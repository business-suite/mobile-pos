import 'package:business_suite_mobile_pos/app/view/home/shop_list/shop_list_page.dart';
import 'package:flutter/material.dart';

import '../../viewmodel/base_viewmodel.dart';
import '../widget_utils/bottom_sheet/entry_bottom_sheet.dart';
import 'home_viewmodel.dart';

class HomePage extends PageProvideNode<HomeViewModel> {
  HomePage({Key? key}) : super(key: key, params: []);

  @override
  Widget buildContent(BuildContext context) {
    return _HomePage(viewModel);
  }
}

class _HomePage extends StatefulWidget {
  final HomeViewModel _homeViewModel;

  _HomePage(this._homeViewModel);

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<_HomePage> {
  int _currentIndex = 3;
  bool flgBadgeOn = false;

  HomeViewModel get homeViewModel => widget._homeViewModel;

  List<Widget> _children = [
    /* HomeMainPage(),
    AllNotificationPage(),
    MyPage(),*/
  ];

  @override
  void initState() {
    super.initState();
  }

  void showEntryBottomSheet(params) {
    entryBottomSheet(url: "");
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onTabBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ShopListPage(),
      ),
    );
  }
}
