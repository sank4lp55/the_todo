import 'package:flutter/material.dart';

class TrendingTab extends StatelessWidget {
  const TrendingTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(  backgroundColor: Color(0xff1C1C1C),
      body: Center(child: Container(child: Text("Feature coming soon!",style: TextStyle(color: Colors.white),),),),);
  }
}
