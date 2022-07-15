import 'package:business_suite_mobile_pos/app/model/webview_param.dart';
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
import '../../module/network/response/login_response.dart';
import '../../module/repository/data_repository.dart';
import '../../viewmodel/base_viewmodel.dart';

class SignUpViewModel extends BaseViewModel {
  final DataRepository _dataRepo;
  late LoginResponse _response;
  NavigationService _navigationService = getIt<NavigationService>();
  UserSharePref _userSharePref = getIt<UserSharePref>();
  final formKey = GlobalKey<FormState>();
  String fullName = '';
  String email = '';
  String password = '';
  bool agreeTermsOfService = false;
  final fullNameFC = FocusNode();
  final emailFC = FocusNode();
  final passwordFC = FocusNode();
  final dobFC = FocusNode();

  SignUpViewModel(this._dataRepo);

  set response(LoginResponse response) {
    _response = response;
    notifyListeners();
  }


  bool get validate => fullName.isNotEmpty && Utils.isEmail(email.trim()) && password.isNotEmpty &&
          password.length > 5
          &&
          agreeTermsOfService != false;

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

  LoginResponse get response => _response;

  setloginType(int loginType) => _userSharePref.saveLoginType(loginType);

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
        _userSharePref.saveUser(response);
        _userSharePref.saveTwitterId(twitterId);
        if(response.is_new_regist){
          //new register => goto Agreement Page
          //_navigationService.pushReplacementScreenWithFade(AgreementPage());
        }else{
          _navigationService.pushReplacementScreenWithFade(HomePage());
        }
      } else {
        _navigationService.gotoErrorPage(message: response.error_message);
      }
    }, onError: (e) {
      _navigationService.gotoErrorPage();
    });
    this.addSubscription(subscript);*/
  }

  Future<void> signOut() async {
    // _userSharePref.saveUser(null);
    // _userSharePref.saveTwitterId(null);
    // _userSharePref.saveAppToken(null);
    // _userSharePref.saveFirebaseToken(null);
  }

  void gotoPrivacyPolicy() {
    _navigationService.pushScreenWithSlideUp(WebviewPage(WebviewParam(title: LocaleKeys.privacy_policy.tr(), url: '${F.baseUrl}/contactus')));
  }

  void gotoTermOfService() {
    _navigationService.pushScreenWithSlideUp(WebviewPage(WebviewParam(title: LocaleKeys.term_of_service.tr(), url: '${F.baseUrl}/contactus')));
  }
  
  void signUp() {

  }

  void gotoSignInPage() async {
    _navigationService.pushReplacementScreenWithSlideRightIn(SignInPage());
  }
}
