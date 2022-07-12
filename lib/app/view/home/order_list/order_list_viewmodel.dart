import '../../../di/injection.dart';
import '../../../model/order.dart';
import '../../../module/common/navigator_screen.dart';
import '../../../module/common/toast_util.dart';
import '../../../module/local_storage/shared_pref_manager.dart';
import '../../../module/repository/data_repository.dart';
import '../../../viewmodel/base_viewmodel.dart';

class OrderListViewModel extends BaseViewModel {
  final DataRepository _repo;
  NavigationService _navigationService = getIt<NavigationService>();
  UserSharePref _userSharePref = getIt<UserSharePref>();
  bool canLoadMore = false;
  bool _loading = false;
  String _response = "";

  final orders = [
    Order(
        name: 'S00041',
        date: '2022-06-20 02:44PM',
        customer: 'Lumber Inc',
        salesMan: 'OdooBot',
        total: '\$ 1,325.00',
        state: 'Quotation'),
    Order(
        name: 'S00033',
        date: '2022-06-20 02:43PM',
        customer: 'Gemini Furniture',
        salesMan: 'Marc Demo',
        total: '\$ 66.00',
        state: 'Quotation'),
    Order(
        name: 'S00036',
        date: '2022-06-20 02:43PM',
        customer: 'Gemini Furniture',
        salesMan: 'Marc Demo',
        total: '\$ 25.00',
        state: 'Sales Order'),
    Order(
        name: 'S00031',
        date: '2022-06-20 02:43PM',
        customer: 'Gemini Furniture',
        salesMan: 'Marc Demo',
        total: '\$ 1,799.00',
        state: 'Sales Order'),
    Order(
        name: 'S00031',
        date: '2022-06-20 02:43PM',
        customer: 'Gemini Furniture',
        salesMan: 'Marc Demo',
        total: '\$ 1,799.00',
        state: 'Sales Order'),
    Order(
        name: 'S00031',
        date: '2022-06-20 02:43PM',
        customer: 'Gemini Furniture',
        salesMan: 'Marc Demo',
        total: '\$ 1,799.00',
        state: 'Sales Order'),
    Order(
        name: 'S00031',
        date: '2022-06-20 02:43PM',
        customer: 'Gemini Furniture',
        salesMan: 'Marc Demo',
        total: '\$ 1,799.00',
        state: 'Sales Order'),
    Order(
        name: 'S00031',
        date: '2022-06-20 02:43PM',
        customer: 'Gemini Furniture',
        salesMan: 'Marc Demo',
        total: '\$ 1,799.00',
        state: 'Sales Order'),
  ];

  OrderListViewModel(this._repo);

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
}
