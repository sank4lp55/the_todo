import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:the_todo/tabs/recent_tab.dart';
import 'package:the_todo/tabs/top_tab.dart';
import 'package:the_todo/tabs/trending_tab.dart';
import 'package:the_todo/utils/glass_box.dart';

import 'components/my_appbar.dart';
import 'components/my_bottombar.dart';
import 'components/my_tabbar.dart';
import 'controllers/manager_controller.dart';



class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  //text controller
  final _controller = TextEditingController();

  // user tapped searched button
  void searchButtonTapped() {}
  TextEditingController _searchController = TextEditingController();

  // tab options
  List tabOption = [
    ["All Notes", RecentTab()],
    ["Work", TrendingTab()],
    ["Home", TopTab()],
  ];

  // bottom bar navigation
  int _currentBottonIndex = 0;

  void _handleIndexChanged(int? index) {
    setState(() {
      _currentBottonIndex = index!;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Access the TodoProvider
    final todoProvider = Provider.of<TodoProvider>(context);
    return DefaultTabController(
      length: tabOption.length,
      child: Scaffold(
        backgroundColor: Color(0xff1C1C1C),
        extendBody: true,
        bottomNavigationBar: GlassBox(
          child: MyBottomBar(
            index: _currentBottonIndex,
            onTap: _handleIndexChanged,
          ),
        ),
        body: ListView(
          children: [
            // title + search button
            MyAppBar(
              title: '',
              onSearchTap: searchButtonTapped,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  color: Color(0xFF333333),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _searchController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.grey[200]),
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.search,
                      color: Colors.grey[200],
                      size: 20,
                    ),
                  ),
                  onChanged: (value) {
                    print("Searching: $value");
                  },
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),

            SizedBox(
              height: 600,
              child: MyTabBar(
                tabOptions: tabOption,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
