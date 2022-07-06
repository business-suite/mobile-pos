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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: kColor202330,
          border: Border(
            top: BorderSide(color: Colors.grey, width: 0.75),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: size_4_h),
          child: BottomNavigationBar(
            backgroundColor: kColor202330,
            selectedItemColor: kCGrey247,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedFontSize: text_11,
            unselectedFontSize: text_11,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: kCGrey60141,
            items: _getItemBottomNav(),
            currentIndex: _currentIndex,
            onTap: onTabBar,
          ),
        ),
      ),
      backgroundColor: kColor202330,
    );
  }

  List<BottomNavigationBarItem> _getItemBottomNav() {
    return [
      BottomNavigationBarItem(
        icon: Container(
          width: size_50_h,
          height: size_24_h,
          child: SvgPicture.asset(
            'assets/icons/ic_tab_home.svg',
            color: _currentIndex == 0 ? kCGrey247 : kCGrey60141,
          ),
        ),
        label: txt_home,
      ),
      BottomNavigationBarItem(
        icon: Container(
          width: size_50_h,
          height: size_24_h,
          child: SvgPicture.asset(
            'assets/icons/ic_tab_tournament_player.svg',
            color: _currentIndex == 1 ? kCGrey247 : kCGrey60141,
          ),
        ),
        label: txt_tournament_list_player,
      ),
      BottomNavigationBarItem(
        icon: Container(
          width: size_50_h,
          height: size_24_h,
          child: SvgPicture.asset(
            'assets/icons/ic_tab_tournament_organizer.svg',
            color: _currentIndex == 2 ? kCGrey247 : kCGrey60141,
          ),
        ),
        label: txt_tournament_list_organizer,
      ),
      BottomNavigationBarItem(
        icon: new Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Container(
                width: size_50_h,
                height: size_24_h,
                child: SvgPicture.asset(
                  'assets/icons/ic_tab_notice.svg',
                  color: _currentIndex == 3 ? kCGrey247 : kCGrey60141,
                ),
              ),
              flgBadgeOn ? new Positioned(  // draw a red marble
                top: 0.0,
                right: 0.0,
                child: new Icon(Icons.brightness_1, size: 14.0,
                    color: Colors.redAccent),
              ) : Container()
            ]
        ),
        label: txt_all_notification,
      ),
      BottomNavigationBarItem(
        icon: Container(
          width: size_24_h,
          height: size_24_h,
          child: SvgPicture.asset(
            'assets/icons/ic_tab_mypage.svg',
            color: _currentIndex == 4 ? kCGrey247 : kCGrey60141,
          ),
        ),
        label: txt_my_page,
      ),
    ];
  }
}
