import 'dart:io';

import 'package:business_suite_mobile_pos/app/model/login_config.dart';
import 'package:business_suite_mobile_pos/app/module/common/snack_bar_util.dart';
import 'package:business_suite_mobile_pos/app/view/widget_utils/custom/flutter_easyloading/src/easy_loading.dart';
import 'package:business_suite_mobile_pos/generated/locale_keys.g.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';

import '../../di/injection.dart';
import '../../module/common/extension.dart';
import '../../module/common/navigator_screen.dart';
import '../../module/common/toast_util.dart';
import '../../module/local_storage/shared_pref_manager.dart';
import '../../module/network/dio_module.dart';
import '../../module/network/response/databases_response.dart';
import '../../module/repository/data_repository.dart';
import '../../viewmodel/base_viewmodel.dart';
import '../sign_in/sign_in_page.dart';

class InputServerPortViewModel extends BaseViewModel {
  final DataRepository _dataRepo;
  NavigationService _navigationService = getIt<NavigationService>();
  UserSharePref userSharePref = getIt<UserSharePref>();
  final serverFC = FocusNode();
  final portFC = FocusNode();
  List<String> protocols = ['http', 'https'];
  bool isExpand = false;
  String protocol = '';
  String server = '';
  String port = '';
  var serverController = TextEditingController();
  var portController = TextEditingController();

  List<dynamic> databaseList = [];
  DatabasesResponse? _databasesResponse;

  set databasesResponse(DatabasesResponse? databasesResponse) {
    _databasesResponse = databasesResponse;
    notifyListeners();
  }

  DatabasesResponse? get databasesResponse => _databasesResponse;

  InputServerPortViewModel(this._dataRepo);

  bool get validate =>
      (server.isNotEmpty &&
          (Utils.isURL(server) ||
              Utils.isIPv4(server) ||
              Utils.isIPv6(server))) &&
      (port.isNotEmpty && Utils.isNum(port) && port.length <= 10);

  onChangeServer(String value) {
    this.server = value.trim();
    notifyListeners();
  }

  onChangePort(String value) {
    this.port = value.trim();
    validate;
    notifyListeners();
  }

  onSelectProtocol(String? itemSelected) {
    this.protocol = itemSelected ?? protocols[1];
    notifyListeners();
  }

  String? invalidServer(String? value) {
    return value == null ||
            !(Utils.isURL(server.trim()) ||
                Utils.isIPv4(server.trim()) ||
                Utils.isIPv6(server.trim()))
        ? LocaleKeys.invalid_server.tr()
        : null;
  }

  String? invalidPort(String? value) {
    return value == null || !Utils.isNum(port) || !(port.length <= 10)
        ? LocaleKeys.invalid_port.tr()
        : null;
  }

  void submit() async {
    removeFocus(_navigationService.navigatorKey.currentContext!);
    //save server config
    LoginConfig? loginConfig = userSharePref.getLoginConfig();
    if(loginConfig == null) loginConfig = LoginConfig(protocol: protocol, server: server, port: port);
    else {
      loginConfig.protocol = protocol;
      loginConfig.server = server;
      loginConfig.port = port;
    }
    await userSharePref.saveLoginConfig(loginConfig);
    dio = AppDio.getInstance();
    openSignIn();
  }

  //check is server = call api get database
  void getDatabasesApi() async {
    removeFocus(_navigationService.navigatorKey.currentContext!);
    final subscript = _dataRepo.getDatabases().doOnListen(() {
      EasyLoading.show();
    }).doOnDone(() {
      EasyLoading.dismiss();
    }).listen((r) {
      try {
        databasesResponse = DatabasesResponse.fromJson(r);
        if (databasesResponse?.result != null &&
            databasesResponse!.result is List) {
          databaseList = databasesResponse!.result ?? [];
          notifyListeners();
          _navigationService.pushScreenNoAnim(SignInPage(
            databaseList: databaseList,
          ));
        }
      } catch (e) {
        SnackBarUtil.showSnack(title: LocaleKeys.something_is_not_right.tr(), message: LocaleKeys.please_check_your_url.tr(), snackType: SnackType.ERROR);
      } finally {
        notifyListeners();
      }
    });
    addSubscription(subscript);
  }


  void initData() {
    LoginConfig? serverConfig = userSharePref.getLoginConfig();
    protocol = serverConfig?.protocol ?? protocols[1];
    server = serverConfig?.server ?? '34.159.110.201';
    port = serverConfig?.port ?? '8069';
    serverController.text = server;
    portController.text = port;
    notifyListeners();
  }

  void openSignIn() {
    getDatabasesApi();
  }

  bool doubleBackToExit = false;

  Future<bool> onDoubleBackToExit() async {
    if (doubleBackToExit) {
      if (Platform.isAndroid) {
        SystemNavigator.pop();
      } else if (Platform.isIOS) {
        exit(0);
      }
      return true;
    }
    doubleBackToExit = true;
    ToastUtil.showToast(LocaleKeys.press_the_back_button_to_exit.tr());
    Future.delayed(Duration(seconds: 2), () {
      doubleBackToExit = false;
    });
    return false;
  }
}
