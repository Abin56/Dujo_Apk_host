import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../controllers/get_schoolList/dropdown-schoolList.dart';
import 'dujosigning.dart';

class SelectSchoolScreen extends StatelessWidget {
  const SelectSchoolScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: GestureDetector(
                onTap: (){
                   showDialog(
                  context: context,
                  barrierDismissible: false, // user must tap button!
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Enter Your School ID'),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[GetSchoolListDropDownButton()],
                          // children: [
                          //   // TextFormField(
                          //   //   controller:schoolIdController,
                          //   // )
                          // ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('ok'),
                          onPressed: () async {
                            await Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return DujoLogin(
                                  schoolID: schoolListValue!["id"],
                                );
                              },
                            ));
                          },
                        ),
                        TextButton(
                          child: const Text('cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
                },
                child: Container(
                      height: 50,
                      width: 300,
                      child: Center(
                        child: Text("login"),
                      ),
                    ),
              ))),
    );
  }
}
