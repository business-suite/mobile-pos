import 'dart:async';

import 'package:business_suite_mobile_pos/app/di/injection.dart';
import 'package:business_suite_mobile_pos/app/model/webview_param.dart';
import 'package:business_suite_mobile_pos/app/module/common/extension.dart';
import 'package:business_suite_mobile_pos/app/module/common/toast_util.dart';
import 'package:business_suite_mobile_pos/app/module/local_storage/shared_pref_manager.dart';
import 'package:business_suite_mobile_pos/app/view/authentication/authentication_page.dart';
import 'package:business_suite_mobile_pos/app/view/forgot_pass/forgot_pass_page.dart';
import 'package:business_suite_mobile_pos/app/view/home/products/products_page.dart';
import 'package:business_suite_mobile_pos/app/view/home/home_page.dart';
import 'package:business_suite_mobile_pos/flavors.dart';
import 'package:business_suite_mobile_pos/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import '../../../module/common/navigator_screen.dart';
import '../../../module/network/response/login_response.dart';
import '../../../module/repository/data_repository.dart';
import '../../../viewmodel/base_viewmodel.dart';
import '../../webview/webview_page.dart';
import '../../widget_utils/custom/flutter_easyloading/src/easy_loading.dart';

class ClosingControlViewModel extends BaseViewModel {
  final DataRepository _dataRepo;
  late LoginResponse _response;
  NavigationService _navigationService = getIt<NavigationService>();
  UserSharePref userSharePref = getIt<UserSharePref>();
  final emailFC = FocusNode();
  final passwordFC = FocusNode();
  bool agreeTermsOfService = false;
  String email = '';
  String password = '';
  var emailController = TextEditingController();
  var passController = TextEditingController();

  ClosingControlViewModel(this._dataRepo);

  bool get validate =>
      Utils.isEmail(email.trim()) && password.isNotEmpty && password.length > 5;

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

  set response(LoginResponse response) {
    _response = response;
    notifyListeners();
  }

  LoginResponse get response => _response;

  setloginType(int loginType) => userSharePref.saveLoginType(loginType);

  void signInApi() async {
    removeFocus(_navigationService.navigatorKey.currentContext!);
    EasyLoading.show();
    Future.delayed(
      Duration(milliseconds: 3000),
          () {
        EasyLoading.dismiss();
        //if (email != 'lyquangbinh@gmail.com' && password != 'v6%*uvVG%k2D!b65')
        if (email != 'lyquangbinh@gmail.com' || password != '123456'){
          ToastUtil.errorToast(LocaleKeys.msg_login_failed.tr());
          return;
        }
        if (userSharePref.isLogin())
          _navigationService.pushReplacementScreenWithFade(HomePage());
        else
          _navigationService.pushReplacementScreenWithSlideRightIn(AuthenticationPage());

      },
    );
  }
  void openTermOfService() {
    _navigationService.pushScreenWithSlideUp(WebviewPage(WebviewParam(title: LocaleKeys.term_of_service.tr(), url: '${getIt<UserSharePref>().getLoginConfig()?.getBaseUrl() ?? ''}/contactus')));
  }

  void openPrivacyPolicy() {
    _navigationService.pushScreenWithSlideUp(WebviewPage(WebviewParam(title: LocaleKeys.privacy_policy.tr(), url: '${getIt<UserSharePref>().getLoginConfig()?.getBaseUrl() ?? ''}/contactus')));
  }

  void openForgotPassPage() async {
    _navigationService.pushReplacementScreenWithSlideRightIn(ForgotPasswordPage());
  }

  /*Observable sign_in(Map<String, dynamic> params) => _dataRepo
      .sign_in(params)
      .doOnData((r) => response = LoginResponse.fromJson(r))
      .doOnError((e, stacktrace) {
        if (e is DioError) {
          response = LoginResponse.fromJson(e.response?.data.trim());
        }
      })
      .doOnListen(() {})
      .doOnDone(() {
        EasyLoading.dismiss();
      });*/

  Future<void> loginApi(String twitterId) async {
    Map<String, dynamic> params = new Map<String, dynamic>();
    params.putIfAbsent('login_type', () => 1);
    params.putIfAbsent('twitter_id', () => twitterId);
    _navigationService.pushScreenWithFade(ProductsPage());
    /*final subscript = this.sign_in(params).listen((_) {
      if (response.success) {
        userSharePref.saveUser(response);
        userSharePref.saveTwitterId(twitterId);
        if(response.is_new_regist){
          //new register => open Agreement Page
          //_navigationService.pushReplacementScreenWithFade(DetailShopPage()());
        }else{
          _navigationService.pushReplacementScreenWithFade(HomePage());
        }
      } else {
        _navigationService.openErrorPage(message: response.error_message);
      }
    }, onError: (e) {
      _navigationService.openErrorPage();
    });
    this.addSubscription(subscript);*/
  }

  Future<void> signOut() async {
    // userSharePref.saveUser(null);
    // userSharePref.saveTwitterId(null);
    // userSharePref.saveAppToken(null);
    // userSharePref.saveFirebaseToken(null);
  }
  onCheckChangeAgree(bool? value) {
    this.agreeTermsOfService = value ?? false;
    validate;
    notifyListeners();
  }
}
