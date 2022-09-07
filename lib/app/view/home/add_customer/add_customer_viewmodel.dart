import 'package:business_suite_mobile_pos/app/model/customer_add_country.dart';
import 'package:flutter/material.dart';

import '../../../di/injection.dart';
import '../../../module/common/navigator_screen.dart';
import '../../../module/common/toast_util.dart';
import '../../../module/local_storage/shared_pref_manager.dart';
import '../../../module/repository/data_repository.dart';
import '../../../viewmodel/base_viewmodel.dart';

class AddCustomertViewModel extends BaseViewModel {
  final DataRepository _dataRepo;
  NavigationService _navigationService = getIt<NavigationService>();
  UserSharePref userSharePref = getIt<UserSharePref>();
  bool canLoadMore = false;
  bool _loading = false;
  String _response = "";

  final Countrys = [
    Country(
        name: 'None',
        ),
    Country(
        name: 'Afghanistan',
        ),
    Country(
        name: 'Albania',
        ),
    Country(
        name: 'Algeria',
        ),
  ];

  AddCustomertViewModel(this._dataRepo);

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
