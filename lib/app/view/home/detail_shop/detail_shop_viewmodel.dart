import 'dart:async';

import 'package:business_suite_mobile_pos/app/model/session_info.dart';
import 'package:business_suite_mobile_pos/app/view/home/detail_shop/review/review_page.dart';
import 'package:business_suite_mobile_pos/app/view/home/pay/pay_page.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../di/injection.dart';
import '../../../model/bill.dart';
import '../../../module/common/config.dart';
import '../../../module/common/navigator_screen.dart';
import '../../../module/local_storage/shared_pref_manager.dart';
import '../../../module/network/response/category_product_response.dart';
import '../../../module/network/response/detail_shop_response.dart';
import '../../../module/repository/data_repository.dart';
import '../../../viewmodel/base_viewmodel.dart';

class DetailShopViewModel extends BaseViewModel {
  final DataRepository _dataRepo;
  NavigationService _navigationService = getIt<NavigationService>();
  GlobalKey<SliderDrawerState> keySlider = GlobalKey<SliderDrawerState>();
  UserSharePref userSharePref = getIt<UserSharePref>();

  ScrollController scrollController = ScrollController();

  bool isHome = false;
  int lastIndexMenu = 0;
  final Completer<void> completer = Completer<void>();
  double endReachedThreshold = 200;
  bool isLoading = true;
  bool canLoadMore = false;
  LoadingState loadingState = LoadingState.LOADING;
  List<Product> products = [];
  List<Product> allProducts = [];
  List<Category> categoryProducts = [];

  CategoryProductResponse? _categoryProductResponse;

  set categoryProductResponse(
      CategoryProductResponse? categoryProductResponse) {
    _categoryProductResponse = categoryProductResponse;
    notifyListeners();
  }

  CategoryProductResponse? get categoryProductResponse =>
      _categoryProductResponse;

  DetailShopResponse? _detailShopResponse;

  set detailShopResponse(DetailShopResponse? detailShopResponse) {
    _detailShopResponse = detailShopResponse;
    notifyListeners();
  }

  DetailShopResponse? get detailShopResponse => _detailShopResponse;

  final List<Bill> bills = [
    Bill(
        date: '2022-07-1303:43PM',
        receipt: 'Order00004',
        number: '135-0005',
        customer: '',
        employee: 'Mitchell Admin',
        total: '\$12314',
        status: 'Ongoing'),
    Bill(
        date: '2022-07-1303:43PM',
        receipt: 'Order00004',
        number: '135-0005',
        customer: '',
        employee: 'Mitchell Admin',
        total: '\$12314',
        status: 'Ongoing'),
    Bill(
        date: '2022-07-1303:43PM',
        receipt: 'Order00004',
        number: '135-0005',
        customer: '',
        employee: 'Mitchell Admin',
        total: '\$12314',
        status: 'Ongoing'),
    Bill(
        date: '2022-07-1303:43PM',
        receipt: 'Order00004',
        number: '135-0005',
        customer: '',
        employee: 'Mitchell Admin',
        total: '\$12314',
        status: 'Ongoing'),
    Bill(
        date: '2022-07-1303:43PM',
        receipt: 'Order00004',
        number: '135-0005',
        customer: '',
        employee: 'Mitchell Admin',
        total: '\$12314',
        status: 'Ongoing'),
  ];

  DetailShopViewModel(this._dataRepo);

  Future<void> getCategoryProductsApi() async {
    SessionInfo? sessionInfo = userSharePref.getUser();
    Map<String, dynamic> kwargs = <String, dynamic>{};
    kwargs.putIfAbsent('context', () => sessionInfo?.userContext);
    kwargs.putIfAbsent('domain', () => []);
    kwargs.putIfAbsent(
        'fields', () => ["id", "name", "parent_id", "child_id", "write_date"]);
    final subscript = _dataRepo
        .callKW(
      POS_CATEGORY,
      SEARCH_READ,
      kwargs: kwargs,
    )
        .listen((r) {
      try {
        categoryProductResponse = CategoryProductResponse.fromJson(r);
        if (categoryProductResponse?.result != null) {
          categoryProducts.clear();
          categoryProducts.addAll(categoryProductResponse?.result ?? []);
          changeMenu(lastIndexMenu);
          loadingState = LoadingState.DONE;
          notifyListeners();
        }
      } catch (e) {
        print(e);
        if (loadingState != LoadingState.ERROR) {
          loadingState = LoadingState.ERROR;
        }
        _navigationService.gotoErrorPage(
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

  Future<void> getProductsApi() async {
    SessionInfo? sessionInfo = userSharePref.getUser();
    Map<String, dynamic> kwargs = <String, dynamic>{};
    kwargs.putIfAbsent('context', () => sessionInfo?.userContext);
    kwargs.putIfAbsent(
        'domain',
        () => [
              "&",
              "&",
              ["sale_ok", "=", true],
              ["available_in_pos", "=", true],
              "|",
              ["company_id", "=", sessionInfo?.companyId],
              ["company_id", "=", false]
            ]);
    kwargs.putIfAbsent(
        'fields',
        () => [
              "display_name",
              "lst_price",
              "standard_price",
              "categ_id",
              "pos_categ_id",
              "taxes_id",
              "barcode",
              "default_code",
              "to_weight",
              "uom_id",
              "description_sale",
              "description",
              "product_tmpl_id",
              "tracking",
              "write_date",
              "available_in_pos",
              "attribute_line_ids",
              "active"
            ]);
    final subscript = _dataRepo
        .callKW(
      POS_PRODUCT,
      SEARCH_READ,
      kwargs: kwargs,
    )
        .listen((r) {
      try {
        detailShopResponse = DetailShopResponse.fromJson(r);
        if (detailShopResponse?.result != null) {
          allProducts.addAll(detailShopResponse?.result ?? []);
          changeMenu(lastIndexMenu);
          //loadingState = LoadingState.DONE;
          notifyListeners();
        }
      } catch (e) {
        print(e);
        if (loadingState != LoadingState.ERROR) {
          loadingState = LoadingState.ERROR;
        }
        _navigationService.gotoErrorPage(
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
    canLoadMore = false;
    loadingState = LoadingState.LOADING;
    products.clear();
    allProducts.clear();
    notifyListeners();
    getProductsApi();
    getCategoryProductsApi();
  }

  void onScroll() {
    if (!scrollController.hasClients || isLoading) return;
    final thresholdReached =
        scrollController.position.extentAfter < endReachedThreshold;
    if (thresholdReached) {
      // Load more!
      getProductsApi();
    }
  }

  homeMenu() {
    isHome = true;
    notifyListeners();
  }

  changeMenu(int index) {
    if (categoryProducts.isEmpty) return;
    lastIndexMenu = index;
    if (lastIndexMenu > categoryProducts.length) lastIndexMenu = 0;
    try {
      isHome = false;
      products.clear();
      products = allProducts
          .where((element) =>
              element.pos_categ_id is List<dynamic> &&
              categoryProducts.isNotEmpty &&
              element.pos_categ_id[0] == categoryProducts[lastIndexMenu].id)
          .toList();
      if (products.length > 5) scrollToTop();
      notifyListeners();
    } catch (e) {
      if (loadingState != LoadingState.ERROR) {
        loadingState = LoadingState.ERROR;
      }
      notifyListeners();
      //EasyLoading.dismiss();
      _navigationService.gotoErrorPage();
    }
  }

  void scrollToTop() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
      );
    }
  }

  void openPayPage() {
    _navigationService.pushEnterFadeExitDown(PayPage());
  }

  void openReviewPage() {
    _navigationService.pushEnterFadeExitDown(ReviewPage());
  }

  deleteBillItem(index) {
    bills.removeAt(index);
    notifyListeners();
  }
}
