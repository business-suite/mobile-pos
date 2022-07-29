import 'package:business_suite_mobile_pos/app/module/common/config.dart';
import 'package:business_suite_mobile_pos/app/view/authentication/authentication_page.dart';
import 'package:business_suite_mobile_pos/app/view/forgot_pass/forgot_pass_page.dart';
import 'package:business_suite_mobile_pos/generated/locale_keys.g.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

import '../../../flavors.dart';
import '../../di/injection.dart';
import '../../module/common/extension.dart';
import '../../module/common/navigator_screen.dart';
import '../../module/common/toast_util.dart';
import '../../module/local_storage/shared_pref_manager.dart';
import '../../module/network/response/login_response.dart';
import '../../module/repository/data_repository.dart';
import '../../viewmodel/base_viewmodel.dart';
import '../home/home_page.dart';
import '../widget_utils/custom/flutter_easyloading/src/easy_loading.dart';

class SignInViewModel extends BaseViewModel {
  final DataRepository _dataRepo;
  NavigationService _navigationService = getIt<NavigationService>();
  UserSharePref userSharePref = getIt<UserSharePref>();
  final emailFC = FocusNode();
  final passwordFC = FocusNode();
  String email = 'admin';
  String password = 'admin';
  var emailController = TextEditingController(text: 'admin');
  var passController = TextEditingController(text: 'admin');
  LoginResponse? _loginResponse;

  set loginResponse(LoginResponse? loginResponse) {
    _loginResponse = loginResponse;
    notifyListeners();
  }
  LoginResponse? get loginResponse => _loginResponse;

  SignInViewModel(this._dataRepo);

  bool get validate =>
      /*Utils.isEmail(email.trim()) &&*/ password.isNotEmpty && password.length > 4;

  onChangeEmail(String value) {
    this.email = value;
    validate;
    notifyListeners();
  }

  onChangePassword(String value) {
    this.password = value;
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

  String? minimum6Characters(String value, String fieldName) => value.length < 5
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

  void logInWeb() async {
    removeFocus(_navigationService.navigatorKey.currentContext!);
    Response response = await _dataRepo.webGetCsrfToken(API_LOGIN_WEB);
    Logger().d(response.data);
    if (response.data.isNotEmpty) {
      Utils.getCsrtTokenWeb(response.data);
    }
  }

  void signIn() async {
    removeFocus(_navigationService.navigatorKey.currentContext!);
    final subscript = _dataRepo
        //.callKW(POS_CATEGORY, SEARCH_READ, kwargs: kwargs, )
        .authenticate(email, password, F.odooDatabase)
        .doOnData((r) {
      loginResponse = LoginResponse.fromJson(r);
    }).doOnError((e, stacktrace) {
      if (e is DioError)
        loginResponse = LoginResponse.fromJson(e.response?.data.trim());
    }).doOnListen(() {
      EasyLoading.show();
    }).doOnDone(() {
      EasyLoading.dismiss();
    }).listen((_) {
      if (loginResponse?.result != null) {
        if (loginResponse?.result!.uid == null) {
          gotoAuthenticationPage();
        } else {
          userSharePref.saveUser(loginResponse?.result);
          gotoHomePage();
        }
      } else {
        ToastUtil.errorToast(LocaleKeys.msg_login_failed.tr());
      }
    }, onError: (e) {
      _navigationService.gotoErrorPage();
    });
    addSubscription(subscript);
  }



  void gotoAuthenticationPage() async {
    _navigationService
        .pushReplacementScreenWithSlideRightIn(AuthenticationPage());
  }

  void gotoHomePage() async {
    _navigationService.pushReplacementScreenWithSlideRightIn(HomePage());
  }

  void gotoForgotPassPage() async {
    _navigationService
        .pushReplacementScreenWithSlideRightIn(ForgotPasswordPage());
  }
}
