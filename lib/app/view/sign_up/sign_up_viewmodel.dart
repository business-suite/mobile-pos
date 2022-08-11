import 'package:business_suite_mobile_pos/app/model/webview_param.dart';
import 'package:business_suite_mobile_pos/app/module/network/response/login_response.dart';
import 'package:business_suite_mobile_pos/app/view/sign_in/sign_in_page.dart';
import 'package:business_suite_mobile_pos/app/view/webview/webview_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../../../flavors.dart';
import '../../../generated/locale_keys.g.dart';
import '../../di/injection.dart';
import '../../module/common/extension.dart';
import '../../module/common/navigator_screen.dart';
import '../../module/local_storage/shared_pref_manager.dart';
import '../../model/session_info.dart';
import '../../module/repository/data_repository.dart';
import '../../viewmodel/base_viewmodel.dart';

class SignUpViewModel extends BaseViewModel {
  final DataRepository _dataRepo;
  NavigationService _navigationService = getIt<NavigationService>();
  UserSharePref userSharePref = getIt<UserSharePref>();
  final formKey = GlobalKey<FormState>();
  String fullName = '';
  String email = '';
  String password = '';
  String companyName = '';
  bool agreeTermsOfService = false;
  final fullNameFC = FocusNode();
  final emailFC = FocusNode();
  final passwordFC = FocusNode();
  final companyNameFC = FocusNode();

  SignUpViewModel(this._dataRepo);

  late LoginResponse _loginResponse;
  set loginResponse(LoginResponse loginResponse) {
    _loginResponse = loginResponse;
    notifyListeners();
  }
  LoginResponse get loginResponse => _loginResponse;


  bool get validate => fullName.isNotEmpty && Utils.isEmail(email.trim()) && password.isNotEmpty &&
          password.length > 5
          && companyName.isNotEmpty &&
          agreeTermsOfService == true;

  String? requiredField(String? value, String fieldName) {
    return value == null || value.isEmpty
        ? LocaleKeys.msg_is_required.tr(
      namedArgs: {
        'field': fieldName,
      },
    )
        : null;
  }

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

  onCheckChangeAgree(bool? value) {
    this.agreeTermsOfService = value ?? false;
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

  String? minimum6Characters(String value, String fieldName) =>
      value.length < 6
          ? LocaleKeys.msg_is_at_least_6_characters.tr(
        namedArgs: {
          'field': fieldName,
        },
      )
          : null;


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
    /*final subscript = this.sign_in(params).listen((_) {
      if (response.success) {
        userSharePref.saveUser(response);
        userSharePref.saveTwitterId(twitterId);
        if(response.is_new_regist){
          //new register => open Agreement Page
          //_navigationService.pushReplacementScreenWithFade(AgreementPage());
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

  void openPrivacyPolicy() {
    _navigationService.pushScreenWithSlideUp(WebviewPage(WebviewParam(title: LocaleKeys.privacy_policy.tr(), url: '${F.baseUrl}/contactus')));
  }

  void openTermOfService() {
    _navigationService.pushScreenWithSlideUp(WebviewPage(WebviewParam(title: LocaleKeys.term_of_service.tr(), url: '${F.baseUrl}/contactus')));
  }
  
  void signUp() {
    openSignInPage();
  }

  void openSignInPage() async {
    _navigationService.pushReplacementScreenWithSlideRightIn(SignInPage());
  }
}
