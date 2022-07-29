import 'dart:async';

import 'package:business_suite_mobile_pos/app/module/common/config.dart';
import 'package:business_suite_mobile_pos/generated/locale_keys.g.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

import '../../di/injection.dart';
import '../../module/common/extension.dart';
import '../../module/common/navigator_screen.dart';
import '../../module/common/toast_util.dart';
import '../../module/local_storage/shared_pref_manager.dart';
import '../../module/network/response/otp_data_response.dart';
import '../../module/repository/data_repository.dart';
import '../../viewmodel/base_viewmodel.dart';
import '../home/home_page.dart';
import '../sign_in/sign_in_page.dart';
import '../widget_utils/custom/flutter_easyloading/src/easy_loading.dart';
import 'package:otp/otp.dart';

class AuthenticationViewModel extends BaseViewModel {
  final DataRepository _dataRepo;
  late OtpDataResponse _otpDataResponse;
  NavigationService _navigationService = getIt<NavigationService>();
  UserSharePref userSharePref = getIt<UserSharePref>();
  final emailFC = FocusNode();
  String authenCode = '';
  final subList = <StreamSubscription>[];
  bool dontAskAgain = false;

  AuthenticationViewModel(this._dataRepo);

  bool get validate => authenCode.isNotEmpty && authenCode.length <= 6;

  onChangeAuthenCode(String value) {
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

  void changeDontAskAgain(bool? data) {
    dontAskAgain = data ?? !dontAskAgain;
    notifyListeners();
  }

  set otpDataResponse(OtpDataResponse otpDataResponse) {
    _otpDataResponse = otpDataResponse;
    notifyListeners();
  }

  OtpDataResponse get otpDataResponse => _otpDataResponse;

  submit() async {
    removeFocus(_navigationService.navigatorKey.currentContext!);
    ToastUtil.errorToast('Tính năng đang pending');
    gotoHomePage();
    //readRawOtpData();
  }

  void readRawOtpData() async {
    Map<String, dynamic> kwargs = <String, dynamic>{};
    kwargs.putIfAbsent(
        'context', () => {"lang":"en_US","tz":"Asia/Bangkok","uid": 2,"allowed_company_ids":[1]});
    var args = [
      [11],
      ["url", "qrcode", "__last_update", "secret", "code", "display_name"]
    ];
    final subscript = _dataRepo
        .callKW(AUTH_TOTP, READ, args: args, kwargs: kwargs)
        .doOnData((r) {
      print('Write: ${r.toString()}');
      otpDataResponse = OtpDataResponse.fromJson(r);
    }).doOnError((e, stacktrace) {
      if (e is DioError)
        otpDataResponse = OtpDataResponse.fromJson(e.response?.data.trim());
    }).doOnListen(() {
      EasyLoading.show();
    }).doOnDone(() {
      EasyLoading.dismiss();
    }).listen((_) {
      if(otpDataResponse.result != null){
       dynamic otp =  otpDataResponse.result?[0].getOtpData();
       String otpGen = OTP.generateTOTPCode(otp?.secret ?? '', DateTime.now().microsecond,length: otp?.digits ?? 6,interval: otp?.period ?? 30, algorithm: Algorithm.SHA1, isGoogle: true).toString();
       print('OTP Gen: $otpGen');
       if(authenCode == otpGen){
         gotoHomePage();
         return;
       }
      }
      ToastUtil.errorToast(LocaleKeys.authentication_failed_please_try_again.tr());
    }, onError: (e) {
      ToastUtil.errorToast(LocaleKeys.authentication_failed_please_try_again.tr());
    });
    addSubscription(subscript);
  }

  /*callButton() async {
    Map<String, dynamic> kwargs = <String, dynamic>{};
    kwargs.putIfAbsent(
        'context',
            () => {
              "lang": "en_US",
              "tz": "Asia/Bangkok",
              "uid": 2,
              "allowed_company_ids": [
                1
              ],
              "active_model": "res.users",
              "active_id": 2,
              "active_ids": [
                2
              ]
            });
    var args = [
      [3],
      {'code': authenCode}
    ];


    final subscript = _dataRepo
        .callKW(AUTH_TOTP, READ, args: null, kwargs: kwargs)
        .doOnData((r) {
      print('Call button: ${r.toString()}');
      loginResponse = LoginResponse.fromJson(r);
    }).doOnError((e, stacktrace) {
      if (e is DioError)
        loginResponse = LoginResponse.fromJson(e.response?.data.trim());
    }).doOnListen(() {
    }).doOnDone(() {
      EasyLoading.dismiss();
    }).listen((_) {
     // _navigationService.pushReplacementScreenWithSlideRightIn(HomePage());
    }, onError: (e) {
      ToastUtil.errorToast(LocaleKeys.authentication_failed_please_try_again.tr());
    });
    addSubscription(subscript);
  }*/

  gotoHomePage() async {
    removeFocus(_navigationService.navigatorKey.currentContext!);
    _navigationService.pushReplacementScreenWithSlideRightIn(HomePage());
  }

  cancel() async {
    removeFocus(_navigationService.navigatorKey.currentContext!);
    _navigationService.pushReplacementScreenWithSlideLeftIn(SignInPage());
  }
}
