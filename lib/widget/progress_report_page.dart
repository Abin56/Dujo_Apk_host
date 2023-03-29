import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class InvoiceScreen extends StatefulWidget {
  String studentName;
  String teacherName;
  String schoolName;
  String schoolPlace;
  String wexam;
  String subjects;
  double obtainedMarks;
  double totalMarks;

  InvoiceScreen(
      {required this.teacherName,
      required this.schoolName,
      required this.studentName,
      required this.wexam,
      required this.schoolPlace,
      required this.subjects,
      required this.obtainedMarks,
      required this.totalMarks,
      super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  // late final dref = FirebaseDatabase.instance.ref();
  // late DatabaseReference databaseReference;

  String listID = '';

  String dateText = "";
  int deliveryCharge = 50;

  String formatCurrentDate(DateTime date) {
    return DateFormat("dd MMMM, yyyy").format(date);
  }

  getCurrentLiveTime() {
    final DateTime timeNow = DateTime.now();
    final String liveDate = formatCurrentDate(timeNow);

    if (this.mounted) {
      setState(() {
        dateText = liveDate;
      });
    }
  }

  creatNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(1000000) + 1000000).toString();
    listID = roomName;
  }

  @override
  void initState() {
    // getInvoice();
    // databaseReference = dref.child("course");
    // _counter();

    creatNewMeeting();
    getCurrentLiveTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () async {
              Printing.layoutPdf(
                onLayout: (PdfPageFormat format) {
                  return buildPdf(format);
                },
              );
              // await nextpage();
            },
            child: Container(
              height: 60,
              width: 200,
              child: Center(
                child: Text(
                  "Download Invoice",
                ),
              ),
            ),
          )
        ],
      )),
    );
  }

  // nextpage() async {
  //   await Future.delayed(Duration(seconds: 5));
  //   Get.offAll(HomeScreen());
  // }

  /// This method takes a page format and generates the Pdf file data
  Future<Uint8List> buildPdf(PdfPageFormat format) async {
    // double totalprice = widget.price + gst + sgst + deliveryCharge;
    // Create the Pdf document
    final pw.Document doc = pw.Document();
    final netImage = await networkImage(
        'https://firebasestorage.googleapis.com/v0/b/lepton-scipro-91560.appspot.com/o/LOGO%2027-10-2022.png?alt=media&token=001a32fa-0297-4067-8572-91a985421276');

    // Add one page with centered text "Hello World"
    doc.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Text(
                widget.schoolName,
                style:
                    pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 20),
              ),
              pw.SizedBox(height: 10),
              pw.Text(
                widget.schoolPlace,
                style: pw.TextStyle(fontSize: 17),
              ),
              pw.SizedBox(height: 01),
              pw.Text(
                widget.wexam,
                style:
                    pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 16),
              ),
              pw.SizedBox(height: 10),
              pw.Text(
                'Progress Report',
                style:
                    pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 18),
              ),
              pw.SizedBox(height: 20),
              pw.Row(
                children: [
                  pw.Text(
                    'Name of the Student :  ',
                    style: pw.TextStyle(fontSize: 15),
                  ),
                  pw.Text(widget.studentName,
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold, fontSize: 16)),
                ],
              ),
              pw.Row(
                children: [
                  pw.Text(
                    'Class ADVISER :',
                    style: pw.TextStyle(fontSize: 15),
                  ),
                  pw.SizedBox(height: 10),
                  pw.Text(
                    widget.teacherName,
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              pw.SizedBox(height: 20),
              pw.Row(children: [
                pw.Text(
                  'No',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                ),
                pw.SizedBox(width: 20),
                pw.Text(
                  'Subject',
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.SizedBox(width: 50),
                pw.Text(
                  'Obtained',
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.SizedBox(width: 55),
                pw.Text(
                  'Total',
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ]),
              pw.SizedBox(height: 10),
              pw.Container(
                  height: 500,
                  child: pw.ListView.separated(
                      itemBuilder: (context, index) {
                        return pw.Container(
                            height: 10,
                            width: double.infinity,
                            child: pw.Row(
                              children: [
                                pw.Text(
                                  '${index + 1}',
                                  style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                ),
                                pw.SizedBox(width: 20),
                                pw.Text(
                                  widget.subjects.length.toString(),
                                  style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                ),
                                pw.SizedBox(width: 80),
                                pw.Text(
                                  widget.obtainedMarks.toString(),
                                  style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                ),
                                pw.SizedBox(width: 70),
                                pw.Text(
                                  widget.totalMarks.toString().tr,
                                  style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                ),
                              ],
                            ));
                      },
                      separatorBuilder: (context, index) {
                        return pw.Divider();
                      },
                      itemCount: widget.subjects.length)),
              
            ],
          );
          //  pw.Expanded(child: Container(child: ,))
        },
      ),
    );

    // Build and return the final Pdf file data
    return await doc.save();
  }
}

    //  return pw.Column(
    //         children: [
    //           pw.Column(
    //             children: [


    //               pw.SizedBox(height: 40),


    //           pw.SizedBox(height: 40),
    //           pw.Column(
    //             children: [
    //               pw.Divider(),

    //                     ],
    //                   ),
    //                 ),
    //               ),
                  
    //             ],
    //           )
    //         ],
    //       );