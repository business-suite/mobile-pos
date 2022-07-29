import 'package:business_suite_mobile_pos/app/model/price.dart';
import 'package:business_suite_mobile_pos/app/module/common/config.dart';
import '../../../di/injection.dart';
import '../../../model/keyboard.dart';
import '../../../module/common/navigator_screen.dart';
import '../../../module/local_storage/shared_pref_manager.dart';
import '../../../module/repository/data_repository.dart';
import '../../../module/res/colors.dart';
import '../../../viewmodel/base_viewmodel.dart';


class ConInsBillsViewModel extends BaseViewModel {
  final DataRepository _repo;
  NavigationService _navigationService = getIt<NavigationService>();
  UserSharePref userSharePref = getIt<UserSharePref>();
  bool canLoadMore = false;
  bool _loading = false;
  String _response = "";
  
  final prices = [
    Price(name: '\$ 0.01'),
    Price(name: '\$ 0.02'),
    Price(name: '\$ 0.05'),
    Price(name: '\$ 0.1'),
    Price(name: '\$ 0.2'),
    Price(name: '\$ 0.5'),
    Price(name: '\$ 1'),
  ];

  final priceBills = [
    Price(name: '\$ 2'),
    Price(name: '\$ 5'),
    Price(name: '\$ 10'),
    Price(name: '\$ 20'),
    Price(name: '\$ 50'),
    Price(name: '\$ 100'),
    Price(name: '\$ 200'),
    Price(name: '\$ 500'),
  ];

  ConInsBillsViewModel(this._repo);



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


  String textInput = '';
  void onClickItem(String input){
    textInput +=  input;
    notifyListeners();
  }


  var color = kColorf0eeee;

  pressDown(){
    color = kColor89000000;
    notifyListeners();

  }
  pressUp(){
    color = kColorcacaca;
    notifyListeners();

  }
}
