import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dujo_application/home/student_home/Students_sections/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SchoolEventsScreen extends StatefulWidget {
   SchoolEventsScreen({super.key, required this.schoolId}); 

  String schoolId;

  @override
  State<SchoolEventsScreen> createState() => _SchoolEventsScreenState();
}

class _SchoolEventsScreenState extends State<SchoolEventsScreen> { 


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('School Events'),
      ), 
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('SchoolListCollection').doc(widget.schoolId).collection('AdminEvents').snapshots(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return CircularProgressIndicator();
          } 

          return ListView.separated( 
            
            separatorBuilder: (context, index) {
              return SizedBox(height: 10,);
            },
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data!.docs[index]['eventName']),
              );
              // return Container(
              //   color: Colors.blue, 
              //   child: SingleChildScrollView(
              //     child: Column(
              //       children: [
              //         Text(snapshot.data!.docs[index]['eventName'], style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),), 
              //         SizedBox(height: 10,), 
              //         Text(snapshot.data!.docs[index]['eventDescription'], style: TextStyle(color: Colors.white,)), 
              //         SizedBox(height: 10,), 
              //         Text('Date: '+ snapshot.data!.docs[index]['eventDate'], style: TextStyle(color: Colors.white,)), 
              //         SizedBox(height: 10,), 
              //         Text('Venue: '+ snapshot.data!.docs[index]['venue'], style: TextStyle(color: Colors.white,)), 
              //         SizedBox(height: 10,), 
              //         Text('Chief Guest: '+ snapshot.data!.docs[index]['chiefGuest'], style: TextStyle(color: Colors.white,)), 
              //       ],
              //     ),
              //   ),
              // );
          },);
        },),
    );
  }
}