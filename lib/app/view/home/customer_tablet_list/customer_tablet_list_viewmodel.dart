import 'dart:async';

import 'package:business_suite_mobile_pos/app/view/home/customer_tablet_list/customer_tablet_list_page.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../di/injection.dart';
import '../../../model/session_info.dart';
import '../../../module/common/config.dart';
import '../../../module/common/navigator_screen.dart';
import '../../../module/common/toast_util.dart';
import '../../../module/local_storage/shared_pref_manager.dart';
import '../../../module/network/response/customers_response.dart';
import '../../../module/repository/data_repository.dart';
import '../../../viewmodel/base_viewmodel.dart';
import '../add_customer/add_customer_page.dart';

class CustomerTabletListViewModel extends BaseViewModel {
  final DataRepository _dataRepo;
  NavigationService _navigationService = getIt<NavigationService>();
  UserSharePref userSharePref = getIt<UserSharePref>();
  bool isLoading = true;
  bool canLoadMore = true;
  LoadingState loadingState = LoadingState.LOADING;
  List<Customer> customers = [];
  final ScrollController scrollController = ScrollController();
  final Completer<void> completer = Completer<void>();
  double endReachedThreshold = 200;



  CustomerTabletListViewModel(this._dataRepo);

  void onScroll() {
    if (!scrollController.hasClients || isLoading) return;
    final thresholdReached =
        scrollController.position.extentAfter < endReachedThreshold;
    if (thresholdReached) {
      // Load more!
      getCustomersApi();
    }
  }


  refreshData() {
    isLoading = true;
    canLoadMore = true;
    loadingState = LoadingState.LOADING;
    customers.clear();
    notifyListeners();
    getCustomersApi();
  }


  CustomersResponse? _customersResponse;

  CustomersResponse? get customersResponse => _customersResponse;

  set customersResponse(CustomersResponse? customersResponse) {
    _customersResponse = customersResponse;
    notifyListeners();
  }

  void getCustomersApi() async {
    if (customers.length == customersResponse?.result?.length) {
      canLoadMore = false;
      isLoading = false;
      notifyListeners();
      return;
    }
    isLoading = true;
    SessionInfo? sessionInfo = userSharePref.getUser();
    Map<String, dynamic> kwargs = <String, dynamic>{};
    kwargs.putIfAbsent('context', () => sessionInfo?.userContext);
    kwargs.putIfAbsent('domain', () => []);
    kwargs.putIfAbsent('fields', () => [
      "name",
      "street",
      "city",
      "state_id",
      "country_id",
      "vat",
      "lang",
      "phone",
      "zip",
      "mobile",
      "email",
      "barcode",
      "write_date",
      "property_account_position_id",
      "property_product_pricelist"
    ]);
    final subscript = _dataRepo
        .callKW(RES_PARTNER, SEARCH_READ, kwargs: kwargs, )
        .listen((r) {
      try {
        customersResponse = CustomersResponse.fromJson(r);
        if (customersResponse?.result != null) {
          customers.addAll(customersResponse?.result ?? []);
          if (customers.isEmpty)
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


  void onClickItem() {
    ToastUtil.showToast('Test');
  }
  openCustomerListpage(){
    _navigationService.pushScreenWithFade(CustomerTabletListPage());
  }

  openAddCustomerPage(){
    getIt<NavigationService>().pushScreenWithFade(AddCustomerPage());
  }
}
