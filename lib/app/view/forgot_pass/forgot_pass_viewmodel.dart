import 'dart:async';

import 'package:business_suite_mobile_pos/app/module/common/toast_util.dart';
import 'package:business_suite_mobile_pos/app/view/sign_in/sign_in_page.dart';
import 'package:business_suite_mobile_pos/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../../di/injection.dart';
import '../../module/common/extension.dart';
import '../../module/common/navigator_screen.dart';
import '../../module/local_storage/shared_pref_manager.dart';
import '../../model/session_info.dart';
import '../../module/repository/data_repository.dart';
import '../../viewmodel/base_viewmodel.dart';
import '../home/detail_shop/detail_shop.dart';
import '../widget_utils/custom/flutter_easyloading/src/easy_loading.dart';

class ForgotPassViewModel extends BaseViewModel {
  final DataRepository _dataRepo;
  NavigationService _navigationService = getIt<NavigationService>();
  UserSharePref userSharePref = getIt<UserSharePref>();
  final emailFC = FocusNode();
  String email = '';
  final subList = <StreamSubscription>[];

  ForgotPassViewModel(this._dataRepo);

  bool get validate => Utils.isEmail(email.trim());

  onChangeEmail(String value){
    this.email = value;
    validate;
    notifyListeners();
  }


  String? invalidEmail(String? value) {
    return value == null || !Utils.isEmail(value.trim())
        ? LocaleKeys.invalid_email.tr()
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

  setloginType(int loginType) => userSharePref.saveLoginType(loginType);

  void submit() async {
    //TODO: Check email exist + call api reset password
    removeFocus(_navigationService.navigatorKey.currentContext!);
    EasyLoading.show();
    Future.delayed(
      Duration(milliseconds: 3000),
          () {
        EasyLoading.dismiss();
        ToastUtil.showToast(LocaleKeys.sent_email_reset.tr());
        _navigationService.pushReplacementScreenWithFade(SignInPage());
      },
    );
  }

  cancel() async {
    removeFocus(_navigationService.navigatorKey.currentContext!);
    _navigationService.pushReplacementScreenWithSlideLeftIn(SignInPage());
  }
}
