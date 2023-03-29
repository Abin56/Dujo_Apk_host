import 'package:flutter/material.dart';



class NewandHotAppBarWidget extends StatelessWidget {
  const NewandHotAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'New & Hot',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
      ),
      actions: [
        Icon(
          Icons.cast,
          color: Colors.white,
          size: 33,
        ),
        SizedBox(
          width: 10,
        ),
        Container(
         
          width: 35,

          decoration: BoxDecoration(
              image: DecorationImage(
                
                  image: AssetImage('assest/Images/NetflixImoji.jpg'))),
        ),
      ],
      bottom: TabBar(
        isScrollable: true,
        unselectedLabelColor: Colors.white,
        labelColor: Colors.black,
        indicator: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.white),
        tabs: [
          Tab(text: '🍿 Coming Soon'),
          Tab(text: "👀 Everyone's watching"),
           Tab(text: "👀 Everyone's watching")
        ],
      ),
    );
  }
}
