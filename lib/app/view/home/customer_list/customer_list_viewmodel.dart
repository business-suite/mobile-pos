import 'package:flutter/material.dart';

import '../../../di/injection.dart';
import '../../../model/customer.dart';
import '../../../module/common/navigator_screen.dart';
import '../../../module/common/toast_util.dart';
import '../../../module/local_storage/shared_pref_manager.dart';
import '../../../module/repository/data_repository.dart';
import '../../../viewmodel/base_viewmodel.dart';

class CustomerListViewModel extends BaseViewModel {
  final DataRepository _repo;
  NavigationService _navigationService = getIt<NavigationService>();
  UserSharePref _userSharePref = getIt<UserSharePref>();
  bool canLoadMore = false;
  bool _loading = false;
  String _response = "";

  final customers = [
    Customer(
        name: 'Addison Olson',
        date: '94523',
      email: 'addison.olson28@example.com',
       ),
    Customer(
        name: 'Azure Interior',
        date: '94538',
      email: 'azure.Interior24@example.com',
       ),
    Customer(
        name: 'Billy Fox',
        date: '95304',
      email: 'billy.fox45@example.com',
        ),
    Customer(
        name: 'Brandon Freeman',
        date: '94538',
      email: 'brandon.freeman55@example.com',
       ),
    Customer(
        name: 'Chester Reed',
        date: '94134',
      email: 'chester.reed79@example.com',
      ),
    Customer(
        name: 'Colleen Diaz',
        date: '94538',
      email: 'colleen.diaz83@example.com',
      ),
    Customer(
        name: 'Deco Addict',
        date: '94523',
      email: 'deco.addict82@example.com',
        ),
    Customer(
        name: 'Douglas Fletcher',
        date: '94523',
        email: 'douglas.fletcher51@example.com',
       ),
    Customer(
        name: 'Douglas Fletcher',
        date: '94523',
      email: 'douglas.fletcher51@example.com',
       ),
    Customer(
        name: 'Douglas Fletcher',
        date: '94523',
      email: 'douglas.fletcher51@example.com',
       ),
    Customer(
        name: 'Douglas Fletcher',
        date: '94523',
      email: 'douglas.fletcher51@example.com',
       ),
    Customer(
        name: 'Douglas Fletcher',
        date: '94523',
      email: 'douglas.fletcher51@example.com',
       ),
    Customer(
      name: 'Addison Olson',
      date: '94523',
      email: 'addison.olson28@example.com',
    ),
    Customer(
      name: 'Azure Interior',
      date: '94538',
      email: 'azure.Interior24@example.com',
    ),
    Customer(
      name: 'Billy Fox',
      date: '95304',
      email: 'billy.fox45@example.com',
    ),
    Customer(
      name: 'Brandon Freeman',
      date: '94538',
      email: 'brandon.freeman55@example.com',
    ),
    Customer(
      name: 'Chester Reed',
      date: '94134',
      email: 'chester.reed79@example.com',
    ),
    Customer(
      name: 'Colleen Diaz',
      date: '94538',
      email: 'colleen.diaz83@example.com',
    ),
    Customer(
      name: 'Deco Addict',
      date: '94523',
      email: 'deco.addict82@example.com',
    ),
    Customer(
      name: 'Douglas Fletcher',
      date: '94523',
      email: 'douglas.fletcher51@example.com',
    ),
    Customer(
      name: 'Addison Olson',
      date: '94523',
      email: 'addison.olson28@example.com',
    ),
    Customer(
      name: 'Azure Interior',
      date: '94538',
      email: 'azure.Interior24@example.com',
    ),
    Customer(
      name: 'Billy Fox',
      date: '95304',
      email: 'billy.fox45@example.com',
    ),
    Customer(
      name: 'Brandon Freeman',
      date: '94538',
      email: 'brandon.freeman55@example.com',
    ),
    Customer(
      name: 'Chester Reed',
      date: '94134',
      email: 'chester.reed79@example.com',
    ),
    Customer(
      name: 'Colleen Diaz',
      date: '94538',
      email: 'colleen.diaz83@example.com',
    ),
    Customer(
      name: 'Deco Addict',
      date: '94523',
      email: 'deco.addict82@example.com',
    ),
    Customer(
      name: 'Douglas Fletcher',
      date: '94523',
      email: 'douglas.fletcher51@example.com',
    ),
  ];

  CustomerListViewModel(this._repo);

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
