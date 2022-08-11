import 'dart:async';
import 'dart:convert';

import 'package:business_suite_mobile_pos/app/model/session_info.dart';
import 'package:business_suite_mobile_pos/app/view/home/pay/pay_page.dart';
import 'package:business_suite_mobile_pos/app/view/home/products/review/review_page.dart';
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
import '../../../module/network/response/category_response.dart';
import '../../../module/network/response/products_response.dart';
import '../../../module/repository/data_repository.dart';
import '../../../viewmodel/base_viewmodel.dart';

class ProductsViewModel extends BaseViewModel {
  final DataRepository _dataRepo;
  NavigationService _navigationService = getIt<NavigationService>();
  GlobalKey<SliderDrawerState> keySlider = GlobalKey<SliderDrawerState>();
  UserSharePref userSharePref = getIt<UserSharePref>();

  ScrollController scrollController = ScrollController();

  bool isHome = false;
  int lastId = 0;
  final Completer<void> completer = Completer<void>();
  double endReachedThreshold = 200;
  bool isLoading = true;
  bool canLoadMore = false;
  LoadingState loadingState = LoadingState.LOADING;
  List<Product> products = [];
  List<Product> allProducts = [];
  List<Category> categories = [];
  List<Category> showCategories = [];
  //List<dynamic> startCat = [3, "Desks / Test3"];
  List<dynamic> startCat = [-1];

  CategoryResponse? _categoryResponse;

  set categoryResponse(CategoryResponse? categoryResponse) {
    _categoryResponse = categoryResponse;
    notifyListeners();
  }

  CategoryResponse? get categoryResponse => _categoryResponse;

  ProductsResponse? _productsResponse;

  set productsResponse(ProductsResponse? productsResponse) {
    _productsResponse = productsResponse;
    notifyListeners();
  }

  ProductsResponse? get productsResponse => _productsResponse;

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

  ProductsViewModel(this._dataRepo);

  Future<void> getCategoriesApi() async {
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
        categoryResponse = CategoryResponse.fromJson(r);
        if (categoryResponse?.result != null) {
          categories.clear();
          //categories.addAll(categoryResponse?.result ?? []);
          print(
              '_________________This is category list___________________________');
          print(CategoryResponse(result: categories).toJson().toString());
          //changeMenu(lastId);
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

  final dataJson = {
    "jsonrpc": "2.0",
    "id": 20,
    "result": [
      {
        "id": 4,
        "name": "Drink",
        "parent_id": [3, "Desks / Test3"],
        "child_id": [5],
        "write_date": "2022-08-09 09:21:14"
      },
      {
        "id": 5,
        "name": "Tes4",
        "parent_id": [4, "Desks / Test3 / Drink"],
        "child_id": [],
        "write_date": "2022-08-09 09:21:59"
      },
      {
        "id": 6,
        "name": "Test5",
        "parent_id": false,
        "child_id": [],
        "write_date": "2022-08-09 09:22:21"
      },
      {
        "id": 2,
        "name": "Desks",
        "parent_id": false,
        "child_id": [3],
        "write_date": "2022-08-07 16:54:01"
      },
      {
        "id": 1,
        "name": "Miscellaneous",
        "parent_id": false,
        "child_id": [],
        "write_date": "2022-08-07 16:54:01"
      },
      {
        "id": 3,
        "name": "Test3",
        "parent_id": [2, "Desks"],
        "child_id": [4],
        "write_date": "2022-08-09 09:17:59"
      }
    ]
  };

  testMenu() {
    List<Category> allCategories =
        CategoryResponse.fromJson(dataJson).result ?? [];
    //root menu
    categories = allCategories
        .where((element) => element.parent_id == false)
        .toList()
      ..sort((a, b) => b.id!.compareTo(a.id!));

    //sub menu for root menu
    categories.forEach((element) => element.setChildCat(getListChild(element.id!, allCategories)));
    final json = CategoryResponse(result: showCategories).toJson();
    print(jsonEncode(json));
    showCategories = getCategories();
  }

  List<Category> getListChild(int id, List<Category> allCategories) {
    List<Category> childs = allCategories.where((element) => element.parent_id is List<dynamic> && element.parent_id[0] == id).toList()..sort((a, b) => b.id!.compareTo(a.id!));

    childs.forEach((element) => element.setChildCat(getListChild(element.id!, allCategories)));
    return childs..sort((a, b) => b.id!.compareTo(a.id!));
  }

  List<Category> getCategories() {
    List<Category> allCategories = CategoryResponse.fromJson(dataJson).result ?? [];
    List<Category> tmpCat = [];
    if (startCat is! List<dynamic> || startCat[0] == -1)
      tmpCat = allCategories.where((element) => element.parent_id == false).toList();
    else {

    }

    return tmpCat;
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
        productsResponse = ProductsResponse.fromJson(r);
        if (productsResponse?.result != null) {
          allProducts.addAll(productsResponse?.result ?? []);
          changeMenu(lastId);
          //loadingState = LoadingState.DONE;
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
    /*isLoading = true;
    canLoadMore = false;
    loadingState = LoadingState.LOADING;
    allProducts.clear();
    notifyListeners();
    getProductsApi();
    getCategoriesApi();*/
  }

  void onScroll() {
    /*if (!scrollController.hasClients || isLoading) return;
    final thresholdReached =
        scrollController.position.extentAfter < endReachedThreshold;
    if (thresholdReached) {
      // Load more!
      getProductsApi();
    }*/
  }

  homeMenu() {
    isHome = true;
   // startCat = [0];
    notifyListeners();
  }

  changeMenu(int _lastId) {
   /* if (categories.isEmpty) return;
    lastId = _lastId;
    if (lastId > categories.length) lastId = 0;
    try {
      isHome = false;
      products = allProducts
          .where((element) =>
              element.pos_categ_id is List<dynamic> &&
              categories.isNotEmpty &&
              element.pos_categ_id[0] == lastId)
          .toList();
      if (products.isEmpty)
        loadingState = LoadingState.EMPTY;
      else
        loadingState = LoadingState.DONE;
      if (products.length > 5) scrollToTop();
      notifyListeners();
    } catch (e) {
      _navigationService.openErrorPage();
    }*/
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
