import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/app/home/tab_item.dart';

class CupertinoHomeScafford extends StatelessWidget {
  const CupertinoHomeScafford({
    Key key,
    @required this.currentTab,
    @required this.onSelectTab,
  }) : super(key: key);
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [],
        onTap: (index) => onSelectTab(TabItem.values[index]),
      ),
      tabBuilder: null,
    );
  }
}
