import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';

import '../../../generated/locale_keys.g.dart';
import '../../di/injection.dart';
import '../../module/common/navigator_screen.dart';
import '../../module/common/toast_util.dart';
import '../../module/network/response/category_product_response.dart';
import '../../model/session_info.dart';
import '../../module/rpc/service/hello_service.dart';
import '../../module/local_storage/shared_pref_manager.dart';
import '../../module/repository/data_repository.dart';
import '../../viewmodel/base_viewmodel.dart';
import '../widget_utils/custom/flutter_easyloading/src/easy_loading.dart';

class HomeViewModel extends BaseViewModel {
  final DataRepository _dataRepo;
  NavigationService _navigationService = getIt<NavigationService>();
  UserSharePref userSharePref = getIt<UserSharePref>();

  bool _loading = false;
  CategoryProductResponse? _response;

  HomeViewModel(this._dataRepo);



  set response(CategoryProductResponse? response) {
    _response = response;
    notifyListeners();
  }

  CategoryProductResponse? get response => _response;

  bool get loading => _loading;

  set loading(bool loading) {
    _loading = loading;
    notifyListeners();
  }





  bool doubleBackToExit = false;
  Future<bool> onDoubleBackToExit() async{
    if(doubleBackToExit){
      if (Platform.isAndroid) {
        SystemNavigator.pop();
      } else if (Platform.isIOS) {
        exit(0);
      }
      return true;
    }
    doubleBackToExit = true;
    ToastUtil.showToast(LocaleKeys.press_the_back_button_to_exit.tr());
    Future.delayed(Duration(seconds: 2), (){
      doubleBackToExit = false;
    });
    return false;
  }


  Future<void> sayHello() async {
    var hello = await HelloService.SayHello();
    print(hello.toString());
  }

}
