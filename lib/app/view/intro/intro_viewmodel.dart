import 'dart:io';

import 'package:business_suite_mobile_pos/app/view/sign_up/sign_up_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';

import '../../../generated/locale_keys.g.dart';
import '../../di/injection.dart';
import '../../module/common/navigator_screen.dart';
import '../../module/common/toast_util.dart';
import '../../module/local_storage/shared_pref_manager.dart';
import '../../module/repository/data_repository.dart';
import '../../viewmodel/base_viewmodel.dart';
import '../home/detail_shop/detail_shop.dart';
import '../sign_in/sign_in_page.dart';

class IntroViewModel extends BaseViewModel {
  final DataRepository _dataRepo;
  NavigationService _navigationService = getIt<NavigationService>();
  UserSharePref userSharePref = getIt<UserSharePref>();
  bool termOfService = false;
  bool dontAskAgain = false;

  List<String> get onBoardingTitles => [
    LocaleKeys.on_boarding_title_1.tr(),
    LocaleKeys.on_boarding_title_2.tr(),
    LocaleKeys.on_boarding_title_3.tr(),
  ];

  List<String> get onBoardingDescriptions => [
    LocaleKeys.on_boarding_desc_1.tr(),
    LocaleKeys.on_boarding_desc_2.tr(),
    LocaleKeys.on_boarding_desc_3.tr(),
  ];

  List<String> get onBoardingUrl => [
    'assets/images/homepage_desktop.png',
    'assets/images/screens_mockup.png',
    'assets/images/market_position_update.png',
  ];

  IntroViewModel(this._dataRepo);

  void changeTermOfService() {
    termOfService = !termOfService;
    notifyListeners();
  }

  void changePolicy() {
    dontAskAgain = !dontAskAgain;
    notifyListeners();
  }

  void gotoSignIn() {
    _navigationService.pushScreenNoAnim(SignInPage());
  }

  void gotoSignUp() {
    _navigationService.pushScreenNoAnim(SignUpPage());
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
