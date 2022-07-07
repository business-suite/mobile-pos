import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../module/res/colors.dart';
import '../../module/res/dimens.dart';
import '../../module/res/string.dart';
import '../../module/res/text.dart';
import '../../viewmodel/base_viewmodel.dart';
import '../widget_utils/bottom_sheet/entry_bottom_sheet.dart';
import 'detail_shop/detail_shop.dart';
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

  HomeViewModel get homeViewModel =>
      widget._homeViewModel;

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
      body: DetailShopPage(),
      backgroundColor: kColor202330,
    );
  }
}
