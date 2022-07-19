import 'dart:io';

import 'package:business_suite_mobile_pos/app/module/common/toast_util.dart';
import 'package:business_suite_mobile_pos/app/view/home/shop_list/shop_list_page.dart';
import 'package:business_suite_mobile_pos/app/view/widget_utils/base_scaffold_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  bool flgBadgeOn = false;
  DateTime timeBackPressed = DateTime.now();
  HomeViewModel get homeViewModel => widget._homeViewModel;

  @override
  void initState() {
    super.initState();
  }


  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => homeViewModel.onDoubleBackToExit(),
      child: BaseScaffoldSafeArea(
        body: SafeArea(
          child: ShopListPage(),
        ),
      ),
    );
  }
}
