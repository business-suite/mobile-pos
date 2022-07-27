import 'package:business_suite_mobile_pos/app/model/detail_review_oder.dart';
import 'package:business_suite_mobile_pos/app/model/review_oder.dart';
import 'package:business_suite_mobile_pos/app/module/common/config.dart';
import 'package:business_suite_mobile_pos/app/view/home/order_list/order_list_page.dart';
import '../../../../di/injection.dart';
import '../../../../model/keyboard.dart';
import '../../../../module/common/navigator_screen.dart';
import '../../../../module/common/toast_util.dart';
import '../../../../module/local_storage/shared_pref_manager.dart';
import '../../../../module/repository/data_repository.dart';
import '../../../../viewmodel/base_viewmodel.dart';
class ReviewViewModel extends BaseViewModel {
  final DataRepository _dataRepo;
  NavigationService _navigationService = getIt<NavigationService>();
  UserSharePref _userSharePref = getIt<UserSharePref>();
  bool canLoadMore = false;
  bool _loading = false;
  String _response = "";
  final computers = [
    KeyBoard(number: 'Customer', sizeStyle: SizeStyle.SMALL),
    KeyBoard(number: '1'),
    KeyBoard(number: '2'),
    KeyBoard(number: '3'),
    KeyBoard(number: 'Qty', sizeStyle: SizeStyle.SMALL),
    KeyBoard(number: '4'),
    KeyBoard(number: '5'),
    KeyBoard(number: '6'),
    KeyBoard(number: 'Disc',sizeStyle: SizeStyle.SMALL),
    KeyBoard(number: '7'),
    KeyBoard(number: '8'),
    KeyBoard(number: '9'),
    KeyBoard(number: 'Prince',sizeStyle: SizeStyle.SMALL),
    KeyBoard(number: '+/-'),
    KeyBoard(number: '0'),
    KeyBoard(number: '.'),
    KeyBoard(image: 'assets/icons/ic_backspace.png',),
  ];
  final detailreviews = [
    DetailReview(
      name: '  [FURN_0096] Customizable Desk (Steel, White)',
      amount:"1x",
      price: ':  \$ 750.00 (tax incl.)',
    ),
    DetailReview(
      name: '  [Sub2] Weekly Subscription',
      amount:"1x",
      price: ':  \$ 575.00',
    ),
    DetailReview(
      name: '  Down Payment (POS)',
      amount:"0x",
      price: ':  \$ 0.00 (tax incl.)',
    ),
      ];
  final reviews = [
    Review(
      name: 'Conference Chair (Steel)',
      amount:"1.00",
      sale: ' Units at \$ 33.00/Units',
      price: '\$ 33.00',
    ),
    Review(
      name: 'Desk Organizer',
      amount:"3.00",
      sale: ' Units at \$ 5.10/Units',
      price: '\$ 15.30',
    ),
    Review(
      name: 'Conference Room Chairs & Classroom Seating',
      amount:"9.00",
      sale: ' Units at \$ 39.40/Units',
      price: '\$ 100005.30',
    ),
    Review(
      name: 'Conference Chair (Steel)',
      amount:"1.00",
      sale: ' Units at \$ 33.00/Units',
      price: '\$ 33.00',
    ),
    Review(
      name: 'Desk Organizer',
      amount:"3.00",
      sale: ' Units at \$ 5.10/Units',
      price: '\$ 15.30',
    ),
    Review(
      name: 'Conference Chair (Aluminium)',
      amount:"9.00",
      sale: ' Units at \$ 39.40/Units',
      price: '\$ 100005.30',
    ),
    Review(
      name: 'Conference Chair (Steel)',
      amount:"1.00",
      sale: ' Units at \$ 33.00/Units',
      price: '\$ 33.00',
    ),
    Review(
      name: 'Desk Organizer',
      amount:"3.00",
      sale: ' Units at \$ 5.10/Units',
      price: '\$ 15.30',
    ),
    Review(
      name: 'Conference Chair (Aluminium)',
      amount:"9.00",
      sale: ' Units at \$ 39.40/Units',
      price: '\$ 100005.30',
    ),
    Review(
      name: 'Down Payment (POS)',
      amount:"1.00",
      sale: ' Units at \$ 1,325.40/Units',
      price: '\$ 1,325.30',
    ),
  ];

  ReviewViewModel(this._dataRepo);

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


  gotoOrderListpage(){
    _navigationService.pushScreenWithFade(OrderListPage());
  }

}

class ReviewItemtViewModel extends BaseViewModel {
  final DataRepository _repo;
  NavigationService _navigationService = getIt<NavigationService>();
  UserSharePref _userSharePref = getIt<UserSharePref>();
  bool canLoadMore = false;
  bool _loading = false;
  String _response = "";



  ReviewItemtViewModel(this._repo);

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
