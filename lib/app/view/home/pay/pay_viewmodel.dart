import 'package:business_suite_mobile_pos/app/module/common/config.dart';

import '../../../di/injection.dart';
import '../../../model/cart_product_data.dart';
import '../../../model/keyboard.dart';
import '../../../module/common/navigator_screen.dart';
import '../../../module/common/toast_util.dart';
import '../../../module/local_storage/shared_pref_manager.dart';
import '../../../module/network/response/shops_response.dart';
import '../../../module/repository/data_repository.dart';
import '../../../viewmodel/base_viewmodel.dart';
import '../customer_phone_list/customer_phone_list_page.dart';
import '../customer_tablet_list/customer_tablet_list_page.dart';
import '../popup_empty_order/popup_empty_order.dart';
import '../popup_invoice/popup_invoice.dart';
class PayViewModel extends BaseViewModel {
  final DataRepository _dataRepo;
  bool isChange = true;
  NavigationService _navigationService = getIt<NavigationService>();
  UserSharePref userSharePref = getIt<UserSharePref>();
  CartProductData cartProductData = CartProductData(products: [], totalPrice: 0.0, totalQuantity: 0, lastIndex: -1);
  Shop? shop;

  final computers = [
    KeyBoard(number: '1'),
    KeyBoard(number: '2'),
    KeyBoard(number: '3'),
    KeyBoard(number: '+10', sizeStyle: SizeStyle.SMALL),
    KeyBoard(number: '4'),
    KeyBoard(number: '5'),
    KeyBoard(number: '6'),
    KeyBoard(number: '+20',sizeStyle: SizeStyle.SMALL),
    KeyBoard(number: '7'),
    KeyBoard(number: '8'),
    KeyBoard(number: '9'),
    KeyBoard(number: '+50',sizeStyle: SizeStyle.SMALL),
    KeyBoard(number: '+/-'),
    KeyBoard(number: '0'),
    KeyBoard(number: '.'),
    KeyBoard(image: 'assets/icons/ic_backspace.png',),
  ];


  PayViewModel(this._dataRepo);



  void onClickItem(){
    ToastUtil.showToast('Test');
  }

  initData(){
    shop = getIt<UserSharePref>().getShop();
    cartProductData = userSharePref.getCartProductData() ?? CartProductData(products: [], totalPrice: 0.0, totalQuantity: 0, lastIndex: -1);
    notifyListeners();
  }

  openCustomerListpage(){
    _navigationService.pushScreenWithFade(CustomerTabletListPage());
  }

  void changePopup(){
    isChange =! isChange;
    if(isChange){
      OpenPopupInvoiceValidate();
    }else{
      OpenPopupEmptyOrder();
    }
     notifyListeners();
  }
}
