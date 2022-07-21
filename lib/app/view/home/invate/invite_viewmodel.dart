
import 'package:business_suite_mobile_pos/app/module/common/config.dart';
import 'package:business_suite_mobile_pos/app/view/home/order_list/order_list_page.dart';
import '../../../di/injection.dart';
import '../../../model/invite.dart';
import '../../../module/common/navigator_screen.dart';
import '../../../module/common/toast_util.dart';
import '../../../module/local_storage/shared_pref_manager.dart';
import '../../../module/repository/data_repository.dart';
import '../../../viewmodel/base_viewmodel.dart';

class InViteViewModel extends BaseViewModel {
  final DataRepository _repo;
  NavigationService _navigationService = getIt<NavigationService>();
  UserSharePref _userSharePref = getIt<UserSharePref>();
  bool canLoadMore = false;
  bool _loading = false;
  String _response = "";
  final invites = [
    InVite(
        image: 'assets/images/homepage_desktop.png',
        name: 'Conference Chair (Aluminium)',
        quantity: '0',
        price: '\$ 39.40'),
    InVite(
        image: 'assets/images/homepage_desktop.png',
        name: 'Office Chair Black',
        quantity: '0',
        price: '\$ 120.50'),
    InVite(
        image: 'assets/images/homepage_desktop.png',
        name: 'Conference Chair (Aluminium)',
        quantity: '0',
        price: '\$ 33.00'),
  ];



  InViteViewModel(this._repo);

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

  void onClickItem() {
    ToastUtil.showToast('Test');
  }

  gotoOrderListpage() {
    _navigationService.pushScreenWithFade(OrderListPage());
  }
}
