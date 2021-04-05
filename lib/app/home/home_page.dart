import 'package:flutter/material.dart';
import 'package:time_tracker/app/home/cupertino_home_scafford.dart';
import 'package:time_tracker/app/home/tab_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabItem _currentTab = TabItem.jobs;

  @override
  Widget build(BuildContext context) {
    return CupertinoHomeScafford(
      currentTab: _currentTab,
      onSelectTab: (item){}
      ,
    );
  }
}
