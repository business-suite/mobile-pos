import 'package:business_suite_mobile_pos/app/module/common/config.dart';
import 'package:business_suite_mobile_pos/app/view/home/detail_shop/detail_shop.dart';
import 'package:flutter/cupertino.dart';

import '../../../di/injection.dart';
import '../../../model/keyboard.dart';
import '../../../model/shop.dart';
import '../../../module/common/extension.dart';
import '../../../module/common/navigator_screen.dart';
import '../../../module/common/toast_util.dart';
import '../../../module/local_storage/shared_pref_manager.dart';
import '../../../module/repository/data_repository.dart';
import '../../../viewmodel/base_viewmodel.dart';
import '../../widget_utils/custom/flutter_easyloading/src/easy_loading.dart';
class ShopListViewModel extends BaseViewModel {
  final DataRepository _repo;
  NavigationService _navigationService = getIt<NavigationService>();
  UserSharePref _userSharePref = getIt<UserSharePref>();
  bool canLoadMore = false;
  bool _loading = false;
  String _response = "";
  final shops = [
    Shop(
        shopeName: 'Shop 1',
        lastDate: '07/01/2022',
        lastCash: '\$ 0.00',
        balance: ''),
    Shop(
        shopeName: 'Shop 2',
        lastDate: '08/01/2022',
        lastCash: '\$ 0.00',
        balance: ''),
    Shop(
        shopeName: 'Shop 3',
        lastDate: '09/01/2022',
        lastCash: '\$ 0.00',
        balance: ''),
    Shop(
        shopeName: 'Shop 4',
        lastDate: '10/01/2022',
        lastCash: '\$ 0.00',
        balance: ''),
  ];


  ShopListViewModel(this._repo);



  String get response => _response;

  set response(String response) {
    _response = response;
    notifyListeners();
  }

  bool get loading => _loading;

  set loading(bool loading) {
    _loading = loading;
    notifyListeners();
  }


  void onClickItem(){
    ToastUtil.showToast('Test');
  }

  gotoDetailShop() async {
    removeFocus(_navigationService.navigatorKey.currentContext!);
    EasyLoading.show();
    Future.delayed(
      Duration(milliseconds: 500),
          () {
        EasyLoading.dismiss();
        _navigationService.pushScreenWithFade(DetailShopPage());
      },
    );

  }

}
