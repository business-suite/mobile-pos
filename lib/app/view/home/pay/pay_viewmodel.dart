import 'package:business_suite_mobile_pos/app/module/common/config.dart';

import '../../../di/injection.dart';
import '../../../model/keyboard.dart';
import '../../../module/common/navigator_screen.dart';
import '../../../module/common/toast_util.dart';
import '../../../module/local_storage/shared_pref_manager.dart';
import '../../../module/repository/data_repository.dart';
import '../../../viewmodel/base_viewmodel.dart';
import '../popup_empty_order/popup_empty_order.dart';
import '../popup_invoice/popup_invoice.dart';
class PayViewModel extends BaseViewModel {
  final DataRepository _dataRepo;
  bool isChange = true;
  NavigationService _navigationService = getIt<NavigationService>();
  UserSharePref userSharePref = getIt<UserSharePref>();
  bool canLoadMore = false;
  bool _loading = false;
  String _response = "";
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



  String get response => _response;

  set response(String response) {
    _response = response;
    notifyListeners();
  }

  bool get loading => _loading;

  set loading(bool loading) {
    _loading = loading;
    notifyListeners();
  }


  void onClickItem(){
    ToastUtil.showToast('Test');
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
