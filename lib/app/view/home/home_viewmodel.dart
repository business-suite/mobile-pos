import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';

import '../../../generated/locale_keys.g.dart';
import '../../di/injection.dart';
import '../../module/common/navigator_screen.dart';
import '../../module/common/toast_util.dart';
import '../../module/local_storage/shared_pref_manager.dart';
import '../../module/repository/data_repository.dart';
import '../../viewmodel/base_viewmodel.dart';

class HomeViewModel extends BaseViewModel {
  final DataRepository _repo;
  NavigationService _navigationService = getIt<NavigationService>();
  UserSharePref _userSharePref = getIt<UserSharePref>();

  bool _loading = false;
  String _response = "";

  HomeViewModel(this._repo);



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

}
