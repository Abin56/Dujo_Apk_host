import 'package:dujo_application/home/teacher_home/teacher_drawer/teacher_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import '../teacher_home_screen.dart';

class ClassTeacherHomeScreen extends StatefulWidget {
  var classID;
  var schoolId;
  var teacherEmail;
  ClassTeacherHomeScreen(
      {required this.schoolId,
      required this.teacherEmail,
      required this.classID,
      Key? key})
      : super(key: key);

  @override
  State<ClassTeacherHomeScreen> createState() => _ClassTeacherHomeScreenState();
}

class _ClassTeacherHomeScreenState extends State<ClassTeacherHomeScreen> {
  int _page = 0;

  //static VideoPlayerController get controller => (controller);
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

 
  // int currentIndex = 0;
  // currentindex(int index) {
  //   currentIndex = index;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     List<Widget> pages = [
    TeacherHomeScreen(
      classID: widget.classID,
      schoolId: widget.schoolId,
      teacherEmail: widget.teacherEmail,
    ),
      TeacherHomeScreen(
      classID: widget.classID,
      schoolId: widget.schoolId,
      teacherEmail: widget.teacherEmail,
    ),
     TeacherHomeScreen(
      classID: widget.classID,
      schoolId: widget.schoolId,
      teacherEmail: widget.teacherEmail,
    ),
       TeacherHomeScreen(
      classID: widget.classID,
      schoolId: widget.schoolId,
      teacherEmail: widget.teacherEmail,
    ),
  ];
    // setSeenonBoard();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 6, 71, 157),
        title: const Text("Dujo"),
      ),
      body: pages[_page],
      bottomNavigationBar: Container(
        height: 71,
        decoration: BoxDecoration(
          // color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          border: Border.all(color: Colors.white.withOpacity(0.13)),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 6, 71, 157),
              Color.fromARGB(255, 6, 71, 157)
            ],
          ),
        ),
        child: GNav(
          // tabBackgroundGradient: LinearGradient(
          //   colors: glassmorphism[0],
          //   begin: Alignment.centerLeft,
          //   end: Alignment.centerRight,
          // ),
          // backgroundColor: Colors.amber,
          // curve: Curves.easeOutExpo,
          // haptic: true,
          gap: 8,
          rippleColor: Colors.grey,
          // hoverColor: Colors.amber,
          activeColor: Colors.white,
          // duration: Duration(microseconds: 300),
          // tabBackgroundColor: Colors.red,
          color: Colors.white,
          tabs: const [
            GButton(
                iconSize: 20,
                icon: LineIcons.home,
                text: 'Home',
                style: GnavStyle.google),
            GButton(
              iconSize: 20,
              textSize: 9,
              icon: Icons.tv,
              text: 'ReC_Courses',
            ),
            GButton(
              iconSize: 20,
              // iconSize: 10,
              textSize: 12,
              icon: Icons.laptop,
              text: 'Live Courses',
            ),
            GButton(
              iconSize: 20,
              icon: Icons.live_tv_sharp,
              text: 'Hybrid',
            )
          ],
          selectedIndex: _page,
          onTabChange: (value) {
            onPageChanged(value);
          },
        ),
      ),
      // drawer: NavDrawer(),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TeacherHeaderDrawer(),
              MyDrawerList(context),
            ],
          ),
        ),
      ),
    );
  }

  // Future setSeenonBoard() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   seenonboard = await prefs.setBool('seenonboard', true);
  //   log(seenonboard.toString());
  // }
}
