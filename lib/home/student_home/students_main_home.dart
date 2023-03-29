import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'Students_sections/Drawer/student_drawer.dart';
import 'Students_sections/homescreen/widgets/home_screen.dart';

class StudentsMainHomeScreen extends StatefulWidget {
  var schoolID;
  var classID;
  var studentEmailid;
  StudentsMainHomeScreen(
      {required this.schoolID,
      required this.classID,
      required this.studentEmailid,
      Key? key})
      : super(key: key);

  @override
  State<StudentsMainHomeScreen> createState() => _StudentsMainHomeScreenState();
}

class _StudentsMainHomeScreenState extends State<StudentsMainHomeScreen> {
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
    StudentsHomeHomeScreen(
      classID: widget.classID,
      schoolID: widget.schoolID,
      studentEmailid: widget.studentEmailid,
    ),
   StudentsHomeHomeScreen(
      classID: widget.classID,
      schoolID: widget.schoolID,
      studentEmailid: widget.studentEmailid,
    ),
   StudentsHomeHomeScreen(
      classID: widget.classID,
      schoolID: widget.schoolID,
      studentEmailid: widget.studentEmailid,
    ),
   StudentsHomeHomeScreen(
      classID: widget.classID,
      schoolID: widget.schoolID,
      studentEmailid: widget.studentEmailid,
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
              Color.fromARGB(255, 5, 85, 222)
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
              const StudentsHeaderDrawer(),
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
