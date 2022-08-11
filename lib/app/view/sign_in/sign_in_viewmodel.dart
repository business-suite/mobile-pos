import 'package:business_suite_mobile_pos/app/module/common/config.dart';
import 'package:business_suite_mobile_pos/app/module/network/response/databases_response.dart';
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
import '../../model/webview_param.dart';
import '../../module/common/extension.dart';
import '../../module/common/navigator_screen.dart';
import '../../module/common/toast_util.dart';
import '../../module/local_storage/shared_pref_manager.dart';
import '../../module/network/response/login_response.dart';
import '../../module/repository/data_repository.dart';
import '../../viewmodel/base_viewmodel.dart';
import '../home/home_page.dart';
import '../webview/webview_page.dart';
import '../widget_utils/custom/flutter_easyloading/src/easy_loading.dart';

class SignInViewModel extends BaseViewModel {
  final DataRepository _dataRepo;
  NavigationService _navigationService = getIt<NavigationService>();
  UserSharePref userSharePref = getIt<UserSharePref>();
  final emailFC = FocusNode();
  final passwordFC = FocusNode();
  String database = '';
  String email = 'software@gusrix.com';
  String password = 'v6%*uvVG%k2D!b65';
  var databaseController = TextEditingController(text: '');
  var emailController = TextEditingController(text: 'software@gusrix.com');
  var passController = TextEditingController(text: 'v6%*uvVG%k2D!b65');
  List<dynamic> databaseList = [];
  LoginResponse? _loginResponse;

  set loginResponse(LoginResponse? loginResponse) {
    _loginResponse = loginResponse;
    notifyListeners();
  }
  LoginResponse? get loginResponse => _loginResponse;

  DatabasesResponse? _databasesResponse;

  set databasesResponse(DatabasesResponse? databasesResponse) {
    _databasesResponse = databasesResponse;
    notifyListeners();
  }
  DatabasesResponse? get databasesResponse => _databasesResponse;

  SignInViewModel(this._dataRepo);

  bool get validate =>
      Utils.isEmail(email.trim()) && password.isNotEmpty && password.length > 4 && database.isNotEmpty;

  onChangeDatabase(String value) {
    this.database = value;
    databaseController.text = value;
    notifyListeners();
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

  String? invalidEmail(String? value) {
    return value == null || !Utils.isEmail(value.trim())
        ? LocaleKeys.invalid_email.tr()
        : null;
  }

  String? invalidDatabase(String? value) {
    return value == null
        ? LocaleKeys.no_database.tr()
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


  void initLogin(){
    var databaseName = userSharePref.getUser()?.db ?? '';
    database = databaseName;
    databaseController.text = databaseName;
  }

  void logInWeb() async {
    removeFocus(_navigationService.navigatorKey.currentContext!);
    Response response = await _dataRepo.webGetCsrfToken(API_LOGIN_WEB);
    Logger().d(response.data);
    if (response.data.isNotEmpty) {
      Utils.getCsrtTokenWeb(response.data);
    }
  }

  void getDatabasesApi() async {
    removeFocus(_navigationService.navigatorKey.currentContext!);
    final subscript = _dataRepo
        .getDatabases()
        .doOnListen(() {
      EasyLoading.show();
    }).doOnDone(() {
      EasyLoading.dismiss();
    }).listen((r) {
      databasesResponse = DatabasesResponse.fromJson(r);
      try {
        if (databasesResponse?.result != null && databasesResponse!.result is List) {
            databaseList = databasesResponse!.result ?? [];
        }
        notifyListeners();
      } catch (e) {
        _navigationService.openErrorPage(message: r is DioError && r.message.isNotEmpty ? r.message.toString() : LocaleKeys.an_unexpected_error_has_occurred.tr());
      } finally {
        notifyListeners();
      }
    });
    addSubscription(subscript);
  }

  void signInApi() async {
    removeFocus(_navigationService.navigatorKey.currentContext!);
    final subscript = _dataRepo
    //.callKW(POS_CATEGORY, SEARCH_READ, kwargs: kwargs, )
        .authenticate(email, password, database)
        .doOnListen(() {
      EasyLoading.show();
    }).doOnDone(() {
      EasyLoading.dismiss();
    }).listen((r) {
      loginResponse = LoginResponse.fromJson(r);
      try {
        if (loginResponse?.result != null) {
          if (loginResponse?.result!.uid == null) {
            openAuthenticationPage();
          } else {
            userSharePref.saveUser(loginResponse?.result);
            openHomePage();
          }
        } else {
          ToastUtil.errorToast(LocaleKeys.msg_login_failed.tr());
        }
      } catch (e) {
        _navigationService.openErrorPage(message: r is DioError && r.message.isNotEmpty ? r.message.toString() : LocaleKeys.an_unexpected_error_has_occurred.tr());
      } finally {
        notifyListeners();
      }
    });
    addSubscription(subscript);
  }



  void openAuthenticationPage() async {
    _navigationService
        .pushReplacementScreenWithSlideRightIn(AuthenticationPage());
  }

  void openHomePage() async {
    _navigationService.pushReplacementScreenWithSlideRightIn(HomePage());
  }

  void openSignUp() {
    _navigationService.pushScreenWithSlideUp(WebviewPage(WebviewParam(title: LocaleKeys.sign_up.tr(), url: '${F.baseUrl}$API_SIGN_UP')));
  }

  void openResetPassPage() async {
   // _navigationService.pushReplacementScreenWithSlideRightIn(ForgotPasswordPage());
    _navigationService.pushScreenWithSlideUp(WebviewPage(WebviewParam(title: LocaleKeys.reset_password.tr(), url: '${F.baseUrl}$API_RESET_PASSWORD')));
  }

  void openManageDatabase() {
    _navigationService.pushScreenWithSlideUp(WebviewPage(WebviewParam(title: LocaleKeys.manage_databases.tr(), url: '${F.baseUrl}$API_MANAGE_DATABASE')));
  }

  void openPoweredOdoo() {
    _navigationService.pushScreenWithSlideUp(WebviewPage(WebviewParam(title: LocaleKeys.odoo.tr(), url: API_POWERED_ODOO)));
  }
}
