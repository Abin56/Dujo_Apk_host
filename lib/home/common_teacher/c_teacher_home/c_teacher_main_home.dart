import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import '../c_teacher_Drawer/c_teacher_drawer.dart';
import '../common_teacher/common_teacher_home.dart';

class CommonTeacherHomeScreen extends StatefulWidget {
  var schoolId;
  var teacherEmail;
  CommonTeacherHomeScreen(
      {required this.schoolId, required this.teacherEmail, Key? key})
      : super(key: key);

  @override
  State<CommonTeacherHomeScreen> createState() =>
      _CommonTeacherHomeScreenState();
}

class _CommonTeacherHomeScreenState extends State<CommonTeacherHomeScreen> {
  int _page = 0;

  //static VideoPlayerController get controller => (controller);
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      CommonTeacherHome(
        schoolId: widget.schoolId,
        teacherEmail: widget.teacherEmail,
      ),
      CommonTeacherHome(
        schoolId: widget.schoolId,
        teacherEmail: widget.teacherEmail,
      ),
      CommonTeacherHome(
        schoolId: widget.schoolId,
        teacherEmail: widget.teacherEmail,
      ),
      CommonTeacherHome(
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
              const CommonTeacherHeaderDrawer(),
              MyDrawerList(context),
            ],
          ),
        ),
      ),
    );
  }
}
