import 'dart:async';

import 'package:business_suite_mobile_pos/app/module/network/response/shops_response.dart';
import 'package:business_suite_mobile_pos/app/view/home/detail_shop/product_page.dart';
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

class ShopsViewModel extends BaseViewModel {
  final DataRepository _dataRepo;
  NavigationService _navigationService = getIt<NavigationService>();
  UserSharePref userSharePref = getIt<UserSharePref>();

  final Completer<void> completer = Completer<void>();
  double endReachedThreshold = 200;
  bool isLoading = true;
  bool canLoadMore = true;
  LoadingState loadingState = LoadingState.LOADING;
  List<Shop> shops = [];

  final ScrollController scrollController = ScrollController();

  ShopsViewModel(this._dataRepo);

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
      "last_session_closing_cash"
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
    getShopsApi();
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

  void onClickItem() {
    ToastUtil.showToast('Test');
  }

  openDetailShop() async {
    removeFocus(_navigationService.navigatorKey.currentContext!);
    _navigationService.pushScreenWithFade(ProductPage());
  }
}
