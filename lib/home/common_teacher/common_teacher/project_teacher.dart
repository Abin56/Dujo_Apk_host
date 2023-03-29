import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TeacherProject extends StatefulWidget {
  const TeacherProject({super.key});

  @override
  State<TeacherProject> createState() => _TeacherProjectState();
}

class _TeacherProjectState extends State<TeacherProject> {
  @override
  Widget build(BuildContext context) {
   var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset:false,
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 164, 3, 81),
        title: Text('Teacher Projects')),
      body: 
              Center(
            child: Container(
                color: Color.fromARGB(255, 255, 253, 253),
                height: screenSize.width * 2,
                width: double.infinity,
                //screenSize.width * 1 / 4,
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Submitted to',
                      ),
                    ),
                  ),
                  
                   Padding(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                     
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Project Name',
                      ),
                    ),
                  ),
                   Padding(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                     
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'About Project',
                      ),
                    ),
                  ),
                 
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Submitted Before',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Student Name',
                      ),
                    ),
                  ),
                  
                 
                  SizedBox(height: 30,),
                  InkWell(onTap: () {
                    //  Navigator.push
                    //                 (context, MaterialPageRoute
                    //                 (builder: 
                    //                 ((context) =>  )));
                  },
                    child: Container(
                          height: screenSize.width * 1 / 7,
                          width: screenSize.width * 1 / 2,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 164, 3, 81),
                              borderRadius: BorderRadius.circular(14)),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Color.fromARGB(255, 255, 255, 255),
                              padding: const EdgeInsets.all(9.0),
                              textStyle: const TextStyle(fontSize: 17),
                            ),
                            onPressed: () {},
                            child: const Text('Create'),
                          ),
                        ),
                  ),
                  
                ]),
              ),
            
          ),
    );
  }
}