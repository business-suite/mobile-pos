import 'dart:async';

import 'package:business_suite_mobile_pos/app/module/network/response/check_module_response.dart';
import 'package:business_suite_mobile_pos/app/module/network/response/shops_response.dart';
import 'package:business_suite_mobile_pos/app/view/home/products/products_page.dart';
import 'package:business_suite_mobile_pos/app/view/home/home_viewmodel.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../di/injection.dart';
import '../../../module/common/config.dart';
import '../../../module/common/extension.dart';
import '../../../module/common/navigator_screen.dart';
import '../../../module/common/toast_util.dart';
import '../../../module/local_storage/shared_pref_manager.dart';
import '../../../module/network/response/shops_response.dart';
import '../../../module/repository/data_repository.dart';
import '../../../viewmodel/base_viewmodel.dart';
import '../../widget_utils/custom/flutter_easyloading/src/easy_loading.dart';

class ShopsViewModel extends BaseViewModel {
  final DataRepository _dataRepo;
  NavigationService _navigationService = getIt<NavigationService>();
  UserSharePref userSharePref = getIt<UserSharePref>();

  final Completer<void> completer = Completer<void>();
  double endReachedThreshold = 200;
  bool isGrid = true;
  bool isSelectAll = false;
  bool hasPosModule = false;
  bool isLoading = true;
  bool canLoadMore = true;
  LoadingState loadingState = LoadingState.LOADING;
  List<Shop> shops = [];

  final ScrollController scrollController = ScrollController();

  ShopsViewModel(this._dataRepo);


  CheckModuleResponse? _checkModuleResponse;

  set checkModuleResponse(CheckModuleResponse? checkModuleResponse) {
    _checkModuleResponse = checkModuleResponse;
    notifyListeners();
  }

  CheckModuleResponse? get checkModuleResponse => _checkModuleResponse;

  void checkModulePOSApi({bool showEasyLoading = false}) async {
    if (showEasyLoading == true) EasyLoading.show();
    removeFocus(_navigationService.navigatorKey.currentContext!);
    var domain = [
      ["application", "=", true]
    ];

    var fields = [
      "icon",
      "to_buy",
      "name",
      "state",
      "summary",
      "website",
      "application",
      "shortdesc"
    ];

    Map<String, dynamic>? context =
    userSharePref.getUser()?.userContext?.toJson();
    context?.putIfAbsent('search_default_app', () => 1);
    context?.putIfAbsent('bin_size', () => true);

    final subscript = _dataRepo
        .searchRead(CHECK_MODULE,
        domain: domain,
        fields: fields,
        limit: 80,
        sort: '',
        context: context)
        .listen((r) {
      try {
        checkModuleResponse = CheckModuleResponse.fromJson(r);
        if (checkModuleResponse?.result != null) {
          List<Module> modules = checkModuleResponse?.result?.records ?? [];
          for (Module module in modules) {
            if (module.isPos()) {
              hasPosModule = true;
              break;
            }
          }
          if(hasPosModule) getShopsApi();
          else _navigationService.openErrorPage(message: LocaleKeys.the_system_does_not_support_pos_please_contact_administrator_for_more_information.tr());
          notifyListeners();
        }
      } catch (e) {
        print(e);
        _navigationService.openErrorPage(
            message: r is DioError && r.message.isNotEmpty
                ? r.message.toString()
                : LocaleKeys.an_unexpected_error_has_occurred.tr());
      } finally {
        EasyLoading.dismiss();
        notifyListeners();
      }
    });
    addSubscription(subscript);
  }



  ShopsResponse? _shopsResponse;

  ShopsResponse? get shopsResponse => _shopsResponse;

  set shopsResponse(ShopsResponse? shopsResponse) {
    _shopsResponse = shopsResponse;
    notifyListeners();
  }

  void getShopsApi() async {
    if (shops.length == shopsResponse?.result?.length) {
      canLoadMore = false;
      isLoading = false;
      notifyListeners();
      return;
    }
    isLoading = true;
    var fields = [
      "current_user_id",
      "cash_control",
      "name",
      "current_session_id",
      "current_session_state",
      "last_session_closing_date",
      "pos_session_username",
      "pos_session_state",
      "pos_session_duration",
      "currency_id",
      "number_of_opened_session",
      "last_session_closing_cash",
      "iface_start_categ_id",
      "company_id",

    ];
    final subscript = _dataRepo
        .searchRead(SHOPS,
            domain: [],
            fields: fields,
            limit: LIMIT_SHOP,
            sort: '',
            context: userSharePref.getUser()?.userContext?.toJson())
        .listen((r) {
      try {
        shopsResponse = ShopsResponse.fromJson(r);
        if (shopsResponse?.result != null) {
          if (shopsResponse?.result?.records?.length ==
              shopsResponse?.result?.length) {
            canLoadMore = false;
          }
          shops.addAll(shopsResponse?.result?.records ?? []);
          if (shops.isEmpty)
            loadingState = LoadingState.EMPTY;
          else
            loadingState = LoadingState.DONE;
          notifyListeners();
        }
      } catch (e) {
        print(e);
        if (loadingState != LoadingState.ERROR) {
          loadingState = LoadingState.ERROR;
        }
        _navigationService.openErrorPage(
            message: r is DioError && r.message.isNotEmpty
                ? r.message.toString()
                : LocaleKeys.an_unexpected_error_has_occurred.tr());
      } finally {
        isLoading = false;
        notifyListeners();
      }
    });
    addSubscription(subscript);
  }


  refreshData() {
    isLoading = true;
    canLoadMore = true;
    loadingState = LoadingState.LOADING;
    shops.clear();
    notifyListeners();
    checkModulePOSApi();
   // getShopsApi();
  }

  void onScroll() {
    if (!scrollController.hasClients || isLoading) return;
    final thresholdReached =
        scrollController.position.extentAfter < endReachedThreshold;
    if (thresholdReached) {
      // Load more!
      getShopsApi();
    }
  }

  void changeListUI(){
    isGrid = !isGrid;
    notifyListeners();
  }

  void onSelectChange(bool? value){
    isSelectAll = value ?? false;
    notifyListeners();
  }

  void onClickItem() {
    ToastUtil.showToast('Test');
  }

  openDetailShop() async {
    removeFocus(_navigationService.navigatorKey.currentContext!);
    _navigationService.pushScreenWithFade(ProductsPage());
  }
}
