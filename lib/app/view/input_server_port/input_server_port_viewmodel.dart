import 'dart:io';

import 'package:business_suite_mobile_pos/app/model/server_config.dart';
import 'package:business_suite_mobile_pos/app/view/widget_utils/custom/flutter_easyloading/src/easy_loading.dart';
import 'package:business_suite_mobile_pos/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../../di/injection.dart';
import '../../module/common/extension.dart';
import '../../module/common/navigator_screen.dart';
import '../../module/common/toast_util.dart';
import '../../module/local_storage/shared_pref_manager.dart';
import '../../module/network/response/login_response.dart';
import '../../module/repository/data_repository.dart';
import '../../viewmodel/base_viewmodel.dart';
import '../sign_in/sign_in_page.dart';

class InputServerPortViewModel extends BaseViewModel {
  final DataRepository _dataRepo;
  NavigationService _navigationService = getIt<NavigationService>();
  UserSharePref userSharePref = getIt<UserSharePref>();
  final serverFC = FocusNode();
  final portFC = FocusNode();
  String server = '34.159.226.218';
  String port = '8069';
  var serverController = TextEditingController(text: '34.159.226.218');
  var portController = TextEditingController(text: '8069');

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
    userSharePref.saveServerConfig(ServerConfig(server: server, port: port));
    openSignIn();
  }

  void openSignIn() {
    _navigationService.pushScreenNoAnim(SignInPage());
  }

  bool doubleBackToExit = false;
  Future<bool> onDoubleBackToExit() async{
    if(doubleBackToExit){
      if (Platform.isAndroid) {
        SystemNavigator.pop();
      } else if (Platform.isIOS) {
        exit(0);
      }
      return true;
    }
    doubleBackToExit = true;
    ToastUtil.showToast(LocaleKeys.press_the_back_button_to_exit.tr());
    Future.delayed(Duration(seconds: 2), (){
      doubleBackToExit = false;
    });
    return false;
  }
}
