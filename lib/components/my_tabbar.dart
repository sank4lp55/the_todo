import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTabBar extends StatelessWidget {
  final List tabOptions;

  MyTabBar({
    Key? key,
    required this.tabOptions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          unselectedLabelStyle: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),

          unselectedLabelColor: Colors.white60,
          labelStyle: TextStyle(fontSize: 27, color: Colors.white),
          indicatorColor: Color(0xffE0E541),
          //isScrollable: true,
          tabs: [
            Tab(
              child: Text(
                tabOptions[0][0],
              ),
            ),
            Tab(
              child: Text(
                tabOptions[1][0],
              ),
            ),
            Tab(
              child: Text(
                tabOptions[2][0],
              ),
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            children: [
              tabOptions[0][1],
              tabOptions[1][1],
              tabOptions[2][1],
            ],
          ),
        )
      ],
    );
  }
}
