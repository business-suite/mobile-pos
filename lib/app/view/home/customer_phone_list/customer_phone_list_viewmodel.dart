import 'package:business_suite_mobile_pos/app/model/customer_phone.dart';
import 'package:flutter/material.dart';

import '../../../di/injection.dart';
import '../../../module/common/navigator_screen.dart';
import '../../../module/common/toast_util.dart';
import '../../../module/local_storage/shared_pref_manager.dart';
import '../../../module/repository/data_repository.dart';
import '../../../viewmodel/base_viewmodel.dart';

class CustomerPhoneListViewModel extends BaseViewModel {
  final DataRepository _repo;
  NavigationService _navigationService = getIt<NavigationService>();
  UserSharePref _userSharePref = getIt<UserSharePref>();
  bool canLoadMore = false;
  bool _loading = false;
  String _response = "";

  final customersphone = [
    CustomerPhone(
        name: 'Addison Olson',
        phone: '(223)-399-7637',
        date: '94523',
        address: ' 77 Santa Barbara Rd, 94523, Pleasant Hill, California (US), United States',
      email: 'addison.olson28@example.com',
       ),
    CustomerPhone(
        name: 'Azure Interior',
        date: '94538',
      phone: '(223)-399-7637',
      address: ' 4557 De Silva St, 94538, Fremont, California (US), United States',
      email: 'azure.Interior24@example.com',
       ),
    CustomerPhone(
        name: 'Billy Fox',
        date: '95304',
      phone: '(223)-399-7637',
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
      email: 'billy.fox45@example.com',
        ),
    CustomerPhone(
        name: 'Brandon Freeman',
        date: '94538',
      phone: '(223)-399-7637',
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
      email: 'brandon.freeman55@example.com',
       ),
    CustomerPhone(
      email: 'chester.reed79@example.com',
        name: 'Chester Reed',
      phone: '(223)-399-7637',
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
        date: '94134',
      ),
    CustomerPhone(
      email: 'colleen.diaz83@example.com',
        name: 'Colleen Diaz',
      phone: '(223)-399-7637',
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
        date: '94538',
      ),
    CustomerPhone(
        name: 'Deco Addict',
      phone: '(223)-399-7637',
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
        date: '94523',
      email: 'deco.addict82@example.com',
        ),
    CustomerPhone(
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
        name: 'Douglas Fletcher',
        date: '94523',
      phone: '(223)-399-7637',
        email: 'douglas.fletcher51@example.com',
       ),
    CustomerPhone(
        name: 'Douglas Fletcher',
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
        date: '94523',
      phone: '(223)-399-7637',
      email: 'douglas.fletcher51@example.com',
       ),
    CustomerPhone(
      name: 'Addison Olson',
      date: '94523',
      phone: '(223)-399-7637',
      address: ' 77 Santa Barbara Rd, 94523, Pleasant Hill, California (US), United States',
      email: 'addison.olson28@example.com',
    ),
    CustomerPhone(
      name: 'Addison Olson',
      phone: '(223)-399-7637',
      date: '94523',
      address: ' 77 Santa Barbara Rd, 94523, Pleasant Hill, California (US), United States',
      email: 'addison.olson28@example.com',
    ),
    CustomerPhone(
      name: 'Azure Interior',
      date: '94538',
      phone: '(223)-399-7637',
      address: ' 4557 De Silva St, 94538, Fremont, California (US), United States',
      email: 'azure.Interior24@example.com',
    ),
    CustomerPhone(
      name: 'Billy Fox',
      date: '95304',
      phone: '(223)-399-7637',
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
      email: 'billy.fox45@example.com',
    ),
    CustomerPhone(
      name: 'Brandon Freeman',
      date: '94538',
      phone: '(223)-399-7637',
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
      email: 'brandon.freeman55@example.com',
    ),
    CustomerPhone(
      email: 'chester.reed79@example.com',
      name: 'Chester Reed',
      phone: '(223)-399-7637',
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
      date: '94134',
    ),
    CustomerPhone(
      email: 'colleen.diaz83@example.com',
      name: 'Colleen Diaz',
      phone: '(223)-399-7637',
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
      date: '94538',
    ),
    CustomerPhone(
      name: 'Deco Addict',
      phone: '(223)-399-7637',
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
      date: '94523',
      email: 'deco.addict82@example.com',
    ),
    CustomerPhone(
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
      name: 'Douglas Fletcher',
      date: '94523',
      phone: '(223)-399-7637',
      email: 'douglas.fletcher51@example.com',
    ),
    CustomerPhone(
      name: 'Douglas Fletcher',
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
      date: '94523',
      phone: '(223)-399-7637',
      email: 'douglas.fletcher51@example.com',
    ),
    CustomerPhone(
      name: 'Addison Olson',
      phone: '(223)-399-7637',
      date: '94523',
      address: ' 77 Santa Barbara Rd, 94523, Pleasant Hill, California (US), United States',
      email: 'addison.olson28@example.com',
    ),
    CustomerPhone(
      name: 'Azure Interior',
      date: '94538',
      phone: '(223)-399-7637',
      address: ' 4557 De Silva St, 94538, Fremont, California (US), United States',
      email: 'azure.Interior24@example.com',
    ),
    CustomerPhone(
      name: 'Billy Fox',
      date: '95304',
      phone: '(223)-399-7637',
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
      email: 'billy.fox45@example.com',
    ),
    CustomerPhone(
      name: 'Brandon Freeman',
      date: '94538',
      phone: '(223)-399-7637',
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
      email: 'brandon.freeman55@example.com',
    ),
    CustomerPhone(
      email: 'chester.reed79@example.com',
      name: 'Chester Reed',
      phone: '(223)-399-7637',
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
      date: '94134',
    ),
    CustomerPhone(
      email: 'colleen.diaz83@example.com',
      name: 'Colleen Diaz',
      phone: '(223)-399-7637',
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
      date: '94538',
    ),
    CustomerPhone(
      name: 'Deco Addict',
      phone: '(223)-399-7637',
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
      date: '94523',
      email: 'deco.addict82@example.com',
    ),
    CustomerPhone(
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
      name: 'Douglas Fletcher',
      date: '94523',
      phone: '(223)-399-7637',
      email: 'douglas.fletcher51@example.com',
    ),
    CustomerPhone(
      name: 'Douglas Fletcher',
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
      date: '94523',
      phone: '(223)-399-7637',
      email: 'douglas.fletcher51@example.com',
    ),
    CustomerPhone(
      name: 'Addison Olson',
      date: '94523',
      phone: '(223)-399-7637',
      address: ' 77 Santa Barbara Rd, 94523, Pleasant Hill, California (US), United States',
      email: 'addison.olson28@example.com',
    ),
    CustomerPhone(
      name: 'Addison Olson',
      phone: '(223)-399-7637',
      date: '94523',
      address: ' 77 Santa Barbara Rd, 94523, Pleasant Hill, California (US), United States',
      email: 'addison.olson28@example.com',
    ),
    CustomerPhone(
      name: 'Azure Interior',
      date: '94538',
      phone: '(223)-399-7637',
      address: ' 4557 De Silva St, 94538, Fremont, California (US), United States',
      email: 'azure.Interior24@example.com',
    ),
    CustomerPhone(
      name: 'Billy Fox',
      date: '95304',
      phone: '(223)-399-7637',
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
      email: 'billy.fox45@example.com',
    ),
    CustomerPhone(
      name: 'Brandon Freeman',
      date: '94538',
      phone: '(223)-399-7637',
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
      email: 'brandon.freeman55@example.com',
    ),
    CustomerPhone(
      email: 'chester.reed79@example.com',
      name: 'Chester Reed',
      phone: '(223)-399-7637',
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
      date: '94134',
    ),
    CustomerPhone(
      email: 'colleen.diaz83@example.com',
      name: 'Colleen Diaz',
      phone: '(223)-399-7637',
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
      date: '94538',
    ),
    CustomerPhone(
      name: 'Deco Addict',
      phone: '(223)-399-7637',
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
      date: '94523',
      email: 'deco.addict82@example.com',
    ),
    CustomerPhone(
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
      name: 'Douglas Fletcher',
      date: '94523',
      phone: '(223)-399-7637',
      email: 'douglas.fletcher51@example.com',
    ),
    CustomerPhone(
      name: 'Douglas Fletcher',
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
      date: '94523',
      phone: '(223)-399-7637',
      email: 'douglas.fletcher51@example.com',
    ),
    CustomerPhone(
      name: 'Addison Olson',
      phone: '(223)-399-7637',
      date: '94523',
      address: ' 77 Santa Barbara Rd, 94523, Pleasant Hill, California (US), United States',
      email: 'addison.olson28@example.com',
    ),
    CustomerPhone(
      name: 'Azure Interior',
      date: '94538',
      phone: '(223)-399-7637',
      address: ' 4557 De Silva St, 94538, Fremont, California (US), United States',
      email: 'azure.Interior24@example.com',
    ),
    CustomerPhone(
      name: 'Billy Fox',
      date: '95304',
      phone: '(223)-399-7637',
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
      email: 'billy.fox45@example.com',
    ),
    CustomerPhone(
      name: 'Brandon Freeman',
      date: '94538',
      phone: '(223)-399-7637',
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
      email: 'brandon.freeman55@example.com',
    ),
    CustomerPhone(
      email: 'chester.reed79@example.com',
      name: 'Chester Reed',
      phone: '(223)-399-7637',
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
      date: '94134',
    ),
    CustomerPhone(
      email: 'colleen.diaz83@example.com',
      name: 'Colleen Diaz',
      phone: '(223)-399-7637',
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
      date: '94538',
    ),
    CustomerPhone(
      name: 'Deco Addict',
      phone: '(223)-399-7637',
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
      date: '94523',
      email: 'deco.addict82@example.com',
    ),
    CustomerPhone(
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
      name: 'Douglas Fletcher',
      date: '94523',
      phone: '(223)-399-7637',
      email: 'douglas.fletcher51@example.com',
    ),
    CustomerPhone(
      name: 'Douglas Fletcher',
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
      date: '94523',
      phone: '(223)-399-7637',
      email: 'douglas.fletcher51@example.com',
    ),
    CustomerPhone(
      name: 'Addison Olson',
      date: '94523',
      phone: '(223)-399-7637',
      address: ' 77 Santa Barbara Rd, 94523, Pleasant Hill, California (US), United States',
      email: 'addison.olson28@example.com',
    ),
    CustomerPhone(
      name: 'Addison Olson',
      phone: '(223)-399-7637',
      date: '94523',
      address: ' 77 Santa Barbara Rd, 94523, Pleasant Hill, California (US), United States',
      email: 'addison.olson28@example.com',
    ),
    CustomerPhone(
      name: 'Azure Interior',
      date: '94538',
      phone: '(223)-399-7637',
      address: ' 4557 De Silva St, 94538, Fremont, California (US), United States',
      email: 'azure.Interior24@example.com',
    ),
    CustomerPhone(
      name: 'Billy Fox',
      date: '95304',
      phone: '(223)-399-7637',
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
      email: 'billy.fox45@example.com',
    ),
    CustomerPhone(
      name: 'Brandon Freeman',
      date: '94538',
      phone: '(223)-399-7637',
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
      email: 'brandon.freeman55@example.com',
    ),
    CustomerPhone(
      email: 'chester.reed79@example.com',
      name: 'Chester Reed',
      phone: '(223)-399-7637',
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
      date: '94134',
    ),
    CustomerPhone(
      email: 'colleen.diaz83@example.com',
      name: 'Colleen Diaz',
      phone: '(223)-399-7637',
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
      date: '94538',
    ),
    CustomerPhone(
      name: 'Deco Addict',
      phone: '(223)-399-7637',
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
      date: '94523',
      email: 'deco.addict82@example.com',
    ),
    CustomerPhone(
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
      name: 'Douglas Fletcher',
      date: '94523',
      phone: '(223)-399-7637',
      email: 'douglas.fletcher51@example.com',
    ),
    CustomerPhone(
      name: 'Douglas Fletcher',
      address: ' 7500 W Linne Road, 95304, Tracy, California (US), United States',
      date: '94523',
      phone: '(223)-399-7637',
      email: 'douglas.fletcher51@example.com',
    ),
  ];

  CustomerPhoneListViewModel(this._repo);

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
  // gotoCustomerPhoneListpage(){
  //   _navigationService.pushScreenWithFade(CustomerPhoneListPage());
  // }
  //
  // gotoAddCustomerPhonePage(){
  //   getIt<NavigationService>().pushScreenWithFade(AddCustomerPhonePage());
  // }
}
