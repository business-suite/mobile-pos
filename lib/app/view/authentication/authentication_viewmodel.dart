import 'dart:async';

import 'package:business_suite_mobile_pos/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../../di/injection.dart';
import '../../module/common/extension.dart';
import '../../module/common/navigator_screen.dart';
import '../../module/common/toast_util.dart';
import '../../module/local_storage/shared_pref_manager.dart';
import '../../module/network/response/login_response.dart';
import '../../module/repository/data_repository.dart';
import '../../viewmodel/base_viewmodel.dart';
import '../home/detail_shop/detail_shop.dart';
import '../home/home_page.dart';
import '../sign_in/sign_in_page.dart';
import '../widget_utils/custom/flutter_easyloading/src/easy_loading.dart';

class AuthenticationViewModel extends BaseViewModel {
  final DataRepository _dataRepo;
  late LoginResponse _response;
  NavigationService _navigationService = getIt<NavigationService>();
  UserSharePref _userSharePref = getIt<UserSharePref>();
  final emailFC = FocusNode();
  String authenCode = '';
  final subList = <StreamSubscription>[];
  bool dontAskAgain = false;


  AuthenticationViewModel(this._dataRepo);

  bool get validate => authenCode.isNotEmpty && authenCode.length <= 6;

  onChangeAuthenCode(String value){
    this.authenCode = value;
    validate;
    notifyListeners();
  }


  String? invalidAuthenCode(String? value) {
    return value == null || !validate
        ? LocaleKeys.invalid_authen_code.tr()
        : null;
  }

  String? passwordValidator(String? value, String fieldName) {
    return requiredField(value, fieldName) ??
        minimum6Characters(value ?? '', fieldName);
  }

  String? minimum6Characters(String value, String fieldName) => value.length < 6
      ? LocaleKeys.msg_is_at_least_6_characters.tr(
          namedArgs: {
            'field': fieldName,
          },
        )
      : null;

  String? requiredField(String? value, String fieldName) {
    return value == null || value.isEmpty
        ? LocaleKeys.msg_is_required.tr(
            namedArgs: {
              'field': fieldName,
            },
          )
        : null;
  }

  void changeDontAskAgain() {
    dontAskAgain = !dontAskAgain;
    notifyListeners();
  }

  set response(LoginResponse response) {
    _response = response;
    notifyListeners();
  }

  LoginResponse get response => _response;

  setloginType(int loginType) => _userSharePref.saveLoginType(loginType);

  void submit(BuildContext context) async {
    //TODO: Check email exist + call api reset password
    removeFocus(context);
    EasyLoading.show();
    Future.delayed(
      Duration(milliseconds: 3000),
          () {
        EasyLoading.dismiss();
        if(validate && authenCode == "123456") {
          _navigationService.pushReplacementScreenWithSlideRightIn(HomePage());
          _userSharePref.setIsLogin(true);
        } else ToastUtil.showToast(LocaleKeys.authentication_failed_please_try_again.tr());

      },
    );
  }

  cancel(BuildContext context) async {
    removeFocus(context);
    _navigationService.pushReplacementScreenWithSlideLeftIn(SignInPage());
  }
}
