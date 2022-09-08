import 'package:business_suite_mobile_pos/app/module/common/config.dart';
import 'package:business_suite_mobile_pos/app/view/home/order_list/order_list_page.dart';
import 'package:business_suite_mobile_pos/app/view/widget_utils/custom/flutter_easyloading/src/easy_loading.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../generated/locale_keys.g.dart';
import '../../../../../main.dart';
import '../../../../di/injection.dart';
import '../../../../model/cart_product_data.dart';
import '../../../../model/keyboard.dart';
import '../../../../model/session_info.dart';
import '../../../../module/common/navigator_screen.dart';
import '../../../../module/event_bus/event_bus.dart';
import '../../../../module/local_storage/shared_pref_manager.dart';
import '../../../../module/network/response/product_info_response.dart';
import '../../../../module/network/response/products_response.dart';
import '../../../../module/network/response/shops_response.dart';
import '../../../../module/network/response/taxes_response.dart';
import '../../../../module/repository/data_repository.dart';
import '../../../../viewmodel/base_viewmodel.dart';
import '../../customer_tablet_list/customer_tablet_list_page.dart';
import '../../info/bottom_sheet_product_info.dart';

class ReviewViewModel extends BaseViewModel {
  final DataRepository _dataRepo;
  NavigationService _navigationService = getIt<NavigationService>();
  UserSharePref userSharePref = getIt<UserSharePref>();
  CartProductData cartProductData = CartProductData(
      products: [], totalPrice: 0.0, totalQuantity: 0, lastIndex: -1);
  Shop? shop;
  List<Tax> taxes = [];
  ProductInfo? productInfo;
  double statusBarHeight = 0.0;

  final computers = [
    KeyBoard(number: 'Customer', sizeStyle: SizeStyle.SMALL),
    KeyBoard(number: '1'),
    KeyBoard(number: '2'),
    KeyBoard(number: '3'),
    KeyBoard(number: 'Qty', sizeStyle: SizeStyle.SMALL),
    KeyBoard(number: '4'),
    KeyBoard(number: '5'),
    KeyBoard(number: '6'),
    KeyBoard(number: 'Disc', sizeStyle: SizeStyle.SMALL),
    KeyBoard(number: '7'),
    KeyBoard(number: '8'),
    KeyBoard(number: '9'),
    KeyBoard(number: 'Prince', sizeStyle: SizeStyle.SMALL),
    KeyBoard(number: '+/-'),
    KeyBoard(number: '0'),
    KeyBoard(number: '.'),
    KeyBoard(
      image: 'assets/icons/ic_backspace.png',
    ),
  ];

  ReviewViewModel(this._dataRepo);

  void onClickItem(int index) {
    cartProductData.lastIndex = index;
    userSharePref.saveCartProductData(cartProductData);
    notifyListeners();
  }

  initData() {
    shop = getIt<UserSharePref>().getShop();
    cartProductData = userSharePref.getCartProductData() ??
        CartProductData(
            products: [], totalPrice: 0.0, totalQuantity: 0, lastIndex: -1);
    notifyListeners();
  }

  addProductToCart(Product product) {
    int index = cartProductData.products.indexOf(product);
    product.quantity += 1;
    if (index == -1) {
      cartProductData.products.add(product);
    } else {
      cartProductData.products[index] = product;
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

  deleteProductFromCart(int index) {
    if (cartProductData.products[index].quantity == 0) {
      cartProductData.products.removeAt(index);
      if (index == 0)
        index = cartProductData.products.length - 1;
      else
        index -= 1;
    } else {
      cartProductData.products[index].quantity = 0;
    }
    int totalQuantity = 0;
    double totalPrice = 0.0;
    cartProductData.lastIndex = index;
    cartProductData.products.forEach((element) {
      totalQuantity += element.quantity;
      totalPrice += element.getTotalPrice();
    });
    cartProductData.totalQuantity = totalQuantity;
    cartProductData.totalPrice = totalPrice;
    userSharePref.saveCartProductData(cartProductData);
    notifyListeners();
  }

  openOrderListpage() {
    _navigationService.pushScreenWithFade(OrderListPage());
  }

  openCustomerListpage() {
    _navigationService.pushScreenWithFade(CustomerTabletListPage());
  }

  ProductInfoResponse? _productInfoResponse;

  ProductInfoResponse? get productInfoResponse => _productInfoResponse;

  set productInfoResponse(ProductInfoResponse? productInfoResponse) {
    _productInfoResponse = productInfoResponse;
    notifyListeners();
  }

  void getProductInfo() async {
    int lastIndex = cartProductData.lastIndex;
    Product product = cartProductData.products[lastIndex];
    SessionInfo? sessionInfo = userSharePref.getUser();
    Map<String, dynamic> kwargs = <String, dynamic>{};
    kwargs.putIfAbsent('context', () => sessionInfo?.userContext);
    var args = [
      [product.id],
      product.lst_price,
      product.quantity,
      1
    ];
    EasyLoading.show();
    final subscript = _dataRepo
        .callKW(PRODUCT_PRODUCT, GET_PRODUCT_INFO_POS,
            kwargs: kwargs, args: args)
        .listen((r) {
      try {
        productInfoResponse = ProductInfoResponse.fromJson(r);
        if (productInfoResponse?.result != null) {
          productInfo = productInfoResponse?.result!;
          prductInfoBottomSheet(
            onCloseClick: () {},
            statusBarHeight: statusBarHeight,
            productInfo: productInfo!,
            product: cartProductData.products[lastIndex],
          );
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

  openProductInfoBottomsheet(double statusBarHeight) {
    this.statusBarHeight = statusBarHeight;
    notifyListeners();
    if (cartProductData.products.isNotEmpty) getProductInfo();
  }

  refundOrder() {
    if (cartProductData.products.isNotEmpty)
      userSharePref.saveCartProductData(null);
    backToProductPage();
  }

  backToProductPage() {
    getIt<NavigationService>().back();
    eventBus.fire(CloseScreenSettleOrder());
  }

  int selectQtyDicsPrince = 4; //Qty postion
  onChangeQtyDicsPrince(int index) {
    selectQtyDicsPrince = index;
    notifyListeners();
  }

  TaxesResponse? _taxesResponse;

  TaxesResponse? get taxesResponse => _taxesResponse;

  set taxesResponse(TaxesResponse? taxesResponse) {
    _taxesResponse = taxesResponse;
    notifyListeners();
  }

  void getTaxApi() async {
    SessionInfo? sessionInfo = userSharePref.getUser();
    Map<String, dynamic> kwargs = <String, dynamic>{};
    kwargs.putIfAbsent('context', () => sessionInfo?.userContext);
    kwargs.putIfAbsent(
        'fields',
        () => [
              "name",
              "amount",
              "price_include",
              "include_base_amount",
              "is_base_affected",
              "amount_type",
              "children_tax_ids"
            ]);
    kwargs.putIfAbsent(
        'domain',
        () => [
              ["company_id", "=", sessionInfo?.companyId ?? 1]
            ]);

    EasyLoading.show();
    final subscript =
        _dataRepo.callKW(ACCOUNT_TAX, SEARCH_READ, kwargs: kwargs).listen((r) {
      try {
        taxesResponse = TaxesResponse.fromJson(r);
        if (taxesResponse?.result != null) {
          taxes = taxesResponse?.result ?? [];
          //addTaxToProduct();
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

  addTaxToProduct() {
    if (taxes.isEmpty) return;
    taxes.forEach((element) {
      int index = cartProductData.products
          .indexWhere((elementProduct) => elementProduct.id == element.id);
      cartProductData.products[index].tax = element.amount! * 0.01;
    });
  }
}
