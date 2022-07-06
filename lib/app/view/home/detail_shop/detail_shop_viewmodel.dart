import 'package:business_suite_mobile_pos/app/view/home/detail_shop/review/review_shop.dart';
import 'package:business_suite_mobile_pos/app/view/home/pay/pay_page.dart';

import '../../../di/injection.dart';
import '../../../model/product.dart';
import '../../../module/common/navigator_screen.dart';
import '../../../module/local_storage/shared_pref_manager.dart';
import '../../../module/repository/data_repository.dart';
import '../../../viewmodel/base_viewmodel.dart';
class DetailShopViewModel extends BaseViewModel {
  final DataRepository _repo;
  NavigationService _navigationService = getIt<NavigationService>();
  UserSharePref _userSharePref = getIt<UserSharePref>();
  bool canLoadMore = false;
  bool _loading = false;
  String _response = "";
  final products = [
    Product(
        name: 'Conference Chair (Aluminium)',
        price: '\$39.40',
        urlName:
        'http://35.207.78.4:8069/web/image?model=product.product&field=image_128&id=24&write_date=2022-06-20%2014:34:07&unique=1',
        icon: 'assets/images/image8.png'),
    Product(
        name: 'Conference Chair (Steel)',
        price: '\$33.00',
        urlName:
        'http://35.207.78.4:8069/web/image?model=product.product&field=image_128&id=23&write_date=2022-06-20%2014:43:10&unique=1',
        icon: 'assets/images/image8.png'),
    Product(
        name: 'Office Chair',
        price: '\$70.00',
        urlName:
        'http://35.207.78.4:8069/web/image?model=product.product&field=image_128&id=5&write_date=2022-06-20%2014:43:10&unique=1',
        icon: 'assets/images/image8.png'),
    Product(
        name: 'Office Chair Black',
        price: '\$120.50',
        urlName:
        'http://35.207.78.4:8069/web/image?model=product.product&field=image_128&id=25&write_date=2022-06-20%2014:43:10&unique=1',
        icon: 'assets/images/image8.png'),
  ];


  DetailShopViewModel(this._repo);



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


  void openPayPage(){
    _navigationService.pushEnterFadeExitDown(PayPage());
  }

  void openReviewPage(){
    _navigationService.pushEnterFadeExitDown(ReviewPage());
  }

}
