import 'package:business_suite_mobile_pos/app/model/login_data.dart';
import 'package:business_suite_mobile_pos/app/module/common/config.dart';
import 'package:business_suite_mobile_pos/app/view/authentication/authentication_page.dart';
import 'package:business_suite_mobile_pos/generated/locale_keys.g.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

import '../../di/injection.dart';
import '../../model/login_config.dart';
import '../../model/webview_param.dart';
import '../../module/common/extension.dart';
import '../../module/common/navigator_screen.dart';
import '../../module/common/snack_bar_util.dart';
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

  SignInViewModel(this._dataRepo, {this.databaseList = const []});

  bool get validate =>
      Utils.isEmail(email.trim()) &&
      password.isNotEmpty &&
      password.length > 4 &&
      database.isNotEmpty;

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
    return value == null ? LocaleKeys.no_database.tr() : null;
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

  void initLogin() {
    var databaseName = userSharePref.getUser()?.db ?? '';
    if (databaseName.isNotEmpty) {
      database = databaseName;
      databaseController.text = database;
    } else {
      if (databaseList.length == 1) {
        database = databaseList[0];
        databaseController.text = database;
      }
    }
  }

  void logInWeb() async {
    removeFocus(_navigationService.navigatorKey.currentContext!);
    Response response = await _dataRepo.webGetCsrfToken(API_LOGIN_WEB);
    Logger().d(response.data);
    if (response.data.isNotEmpty) {
      Utils.getCsrtTokenWeb(response.data);
    }
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
    }).listen((r) async {
      loginResponse = LoginResponse.fromJson(r);
      try {
        if (loginResponse?.result != null) {
          if (loginResponse?.result!.uid == null) {
            openAuthenticationPage();
          } else {
            //save server config
            LoginConfig loginConfig = userSharePref.getLoginConfig()!;
            loginConfig.database = database;
            loginConfig.email = email;
            loginConfig.password = password;
            loginConfig.userName = loginResponse?.result!.name;
            loginConfig.avatarUrl = getAvatarProfile();
            await userSharePref.saveLoginConfig(loginConfig);
            //save login data
            LoginData loginData = userSharePref.getLoginDataList() ?? LoginData(data: []);
            if (loginData.data.isEmpty || findAccount(loginConfig, loginData.data) == -1) {
              loginData.data.add(loginConfig);
              await userSharePref.saveLoginDataList(loginData);
            }
            //save session info
            await userSharePref.saveUser(loginResponse?.result);
            openHomePage();
          }
        } else {
          SnackBarUtil.showSnack(
              title: LocaleKeys.something_is_not_right.tr(),
              message: LocaleKeys.please_check_your_email_or_password.tr(),
              snackType: SnackType.ERROR);
        }
      } catch (e) {
        _navigationService.openErrorPage(
            message: r is DioError && r.message.isNotEmpty
                ? r.message.toString()
                : LocaleKeys.an_unexpected_error_has_occurred.tr());
      } finally {
        notifyListeners();
      }
    });
    addSubscription(subscript);
  }

  int findAccount(LoginConfig loginConfig, List<LoginConfig> list) {
    return list.indexOf(loginConfig);
  }

  void openAuthenticationPage() async {
    _navigationService
        .pushReplacementScreenWithSlideRightIn(AuthenticationPage());
  }

  void openHomePage() async {
    _navigationService.pushReplacementScreenWithSlideRightIn(HomePage());
  }

  void openSignUp() {
    _navigationService.pushScreenWithSlideUp(WebviewPage(WebviewParam(
        title: LocaleKeys.sign_up.tr(),
        url:
            '${getIt<UserSharePref>().getLoginConfig()?.getBaseUrl() ?? ''}$API_SIGN_UP')));
  }

  void openResetPassPage() async {
    // _navigationService.pushReplacementScreenWithSlideRightIn(ForgotPasswordPage());
    print(
        '${getIt<UserSharePref>().getLoginConfig()?.getBaseUrl() ?? ''}$API_RESET_PASSWORD');
    _navigationService.pushScreenWithSlideUp(WebviewPage(WebviewParam(
        title: LocaleKeys.reset_password.tr(),
        url: 'http://34.159.226.218:8069/web/reset_password')));
  }

  void openManageDatabase() {
    _navigationService.pushScreenWithSlideUp(WebviewPage(WebviewParam(
        title: LocaleKeys.manage_databases.tr(),
        url:
            '${getIt<UserSharePref>().getLoginConfig()?.getBaseUrl() ?? ''}$API_MANAGE_DATABASE')));
  }

  void openPoweredOdoo() {
    _navigationService.pushScreenWithSlideUp(WebviewPage(
        WebviewParam(title: LocaleKeys.odoo.tr(), url: API_POWERED_ODOO)));
  }
}
