import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: ListView(children: [
        Stack(
          children: [
            Container(
              height: screenSize.height * 0.55,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://as1.ftcdn.net/v2/jpg/05/64/09/84/1000_F_564098467_DBpYyJr0JaJ3iDQF5fb7R97Dg4zJ8B3u.jpg"),
                      fit: BoxFit.cover)),
            ),

            Stack(
              children: [
                Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: screenSize.width * 1 / 12),
                        width: screenSize.width / 3,
                        child: Divider(
                          color: Colors.red,
                          thickness: 3,
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: screenSize.width * 1 / 12),
                      child: Container(
                        height: screenSize.width * 1 / 7,
                        width: screenSize.width * 1 / 3,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://firebasestorage.googleapis.com/v0/b/lepton-dujo-official.appspot.com/o/files%2Fleptdujo1.png?alt=media&token=2d8436cc-dc95-4d28-b2b5-8a5c0e19baae",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: screenSize.width * 1 / 12),
                        width: screenSize.width / 3,
                        child: Divider(
                          color: Colors.red,
                          thickness: 3,
                        )),
                  ],
                ),
              ],
            ),
            // Container(
            //   height: 250,
            //   width: 200,
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image: NetworkImage(
            //           "https://thumbs.dreamstime.com/z/happy-students-jumping-white-background-passed-exams-happy-students-jumping-white-background-passed-exams-having-fun-145414408.jpg"),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),

            Padding(
                padding: EdgeInsets.only(top: screenSize.width * 1),
                child: Container(
                  height: screenSize.width * 1,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 93, 8, 190),
                        Color.fromARGB(255, 187, 33, 214),
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                  ),
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.all(screenSize.width * 1 / 5),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.mail),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: Color.fromARGB(255, 0, 0, 0)),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          hintText: 'Enter Your Mail ID ',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenSize.width * 1 / 100,
                    ),
                    Container(
                      height: screenSize.width * 1 / 8.2,
                      width: screenSize.width * 1 / 2,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30)),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Color.fromARGB(255, 255, 255, 255),
                          padding: const EdgeInsets.all(10.0),
                          textStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {},
                        child: const Text('SEND A CODE'),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ]),
                )),
          ],
        ),
      ]),
    ));
  }
}
