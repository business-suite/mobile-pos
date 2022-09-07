import 'dart:async';

import 'package:business_suite_mobile_pos/app/model/cart_product_data.dart';
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
import '../../../module/common/extension.dart';
import '../../../module/common/navigator_screen.dart';
import '../../../module/local_storage/shared_pref_manager.dart';
import '../../../module/network/response/category_response.dart';
import '../../../module/network/response/products_response.dart';
import '../../../module/network/response/shops_response.dart';
import '../../../module/repository/data_repository.dart';
import '../../../viewmodel/base_viewmodel.dart';

class ProductsViewModel extends BaseViewModel {
  final DataRepository _dataRepo;
  NavigationService _navigationService = getIt<NavigationService>();
  GlobalKey<SliderDrawerState> keySlider = GlobalKey<SliderDrawerState>();
  UserSharePref userSharePref = getIt<UserSharePref>();
  Shop? shop;

  ScrollController scrollController = ScrollController();

  int lastId = -1;
  final Completer<void> completer = Completer<void>();
  double endReachedThreshold = 200;
  bool isLoading = true;
  bool canLoadMore = false;
  LoadingState loadingState = LoadingState.LOADING;
  List<Product> products = [];
  List<Product> allProducts = [];
  List<Category> allCategories = [];
  List<Category> rootCategories = [];
  List<Category> showCategories = [];
  CartProductData cartProductData = CartProductData(products: [], totalPrice: 0.0, totalQuantity: 0, lastIndex: -1);

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
          showCategories.clear();
          allCategories = categoryResponse?.result ?? [];
          //root menu
          rootCategories =
              allCategories.where((element) => element.parent_id is! List).toList();
          showCategories = getCategories();
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

  List<Category> getCategories() {
    if (lastId == -1)
      return rootCategories;
    else {
      Category cat =
          allCategories.firstWhere((element) => element.id == lastId);
      return []
        ..addAll(getListParent(cat))
        ..addAll(getListChild(cat));
    }
  }

  List<Category> getListChild(Category cat) {
    if (cat.child_id?.isEmpty == true) return [];
    List<Category> childs = allCategories
        .where((element) => element.id == cat.child_id![0])
        .toList();

    /*childs.forEach((element) {
      if (element.child_id?.isEmpty == true) return;
      element.setChildCat(getListChild(element.child_id![0], allCategories));
    });*/

    return childs;
  }

  List<Category> getListParent(Category cat) {
    List<Category> tmp = [];
    if (cat.parent_id is! List) return [cat];
    List<String> tmString = cat.parent_id[1].split('/');
    tmString.forEach((element) {
      tmp.add(allCategories
          .firstWhere((elementCat) => elementCat.name == element.trim()));
    });
    return tmp..add(cat);
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
    isLoading = true;
    canLoadMore = false;
    loadingState = LoadingState.LOADING;
    allProducts.clear();
    notifyListeners();
    getProductsApi();
    getCategoriesApi();
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
    if (lastId != -1) lastId = -1;
    showCategories = getCategories();
    products = allProducts;
    if (products.isEmpty)
      loadingState = LoadingState.EMPTY;
    else
      loadingState = LoadingState.DONE;
    if (products.length > 5) scrollToTop();
    notifyListeners();
  }

  initStartCat(int startCat){
    this.lastId = startCat;
    changeMenu(lastId);
    notifyListeners();
  }

  changeMenu(int _lastId) {
    if (showCategories.isEmpty) return;
    lastId = _lastId;
    showCategories = getCategories();
    notifyListeners();
    try {
      products = allProducts
          .where((element) =>
              element.pos_categ_id is List<dynamic> &&
              showCategories.isNotEmpty &&
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

  initData(){
    shop = getIt<UserSharePref>().getShop();
    cartProductData = userSharePref.getCartProductData() ?? CartProductData(products: [], totalPrice: 0.0, totalQuantity: 0, lastIndex: -1);
    notifyListeners();
  }

  addProductToCart(Product product){
    int index = cartProductData.products.indexOf(product);
    product.quantity += 1;
    if(index == -1) {
      cartProductData.products.add(product);
      cartProductData.lastIndex = 0;
    } else {
      cartProductData.products[index] = product;
      cartProductData.lastIndex = index;
    }
    int totalQuantity = 0;
    double totalPrice = 0.0;
    cartProductData.products.forEach((element) {
      totalQuantity += element.quantity;
      totalPrice += element.getTotalPrice();
    });
    cartProductData.totalQuantity = totalQuantity;
    cartProductData.totalPrice = totalPrice;
    userSharePref.saveCartProductData(cartProductData);
    notifyListeners();
  }

}
