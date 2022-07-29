import 'package:business_suite_mobile_pos/app/view/home/detail_shop/detail_shop.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

import '../../../di/injection.dart';
import '../../../module/common/config.dart';
import '../../../module/common/extension.dart';
import '../../../module/common/navigator_screen.dart';
import '../../../module/common/toast_util.dart';
import '../../../module/local_storage/shared_pref_manager.dart';
import '../../../module/network/response/shops_response.dart';
import '../../../module/repository/data_repository.dart';
import '../../../viewmodel/base_viewmodel.dart';
import '../../widget_utils/custom/flutter_easyloading/src/easy_loading.dart';

class ShopListViewModel extends BaseViewModel {
  final DataRepository _dataRepo;
  NavigationService _navigationService = getIt<NavigationService>();
  UserSharePref userSharePref = getIt<UserSharePref>();
  bool canLoadMore = false;
  bool _loading = false;

  List<Shop> shops = [];

  ShopListViewModel(this._dataRepo);

  ShopsResponse? _shopsResponse;

  ShopsResponse? get shopsResponse => _shopsResponse;

  set shopsResponse(ShopsResponse? shopsResponse) {
    _shopsResponse = shopsResponse;
    notifyListeners();
  }

  bool get loading => _loading;

  set loading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  void getShops() async {
    var fields = [
      "current_user_id",
      "cash_control",
      "name",
      "current_session_id",
      "current_session_state",
      "last_session_closing_date",
      "pos_session_username",
      "pos_session_state",
      "pos_session_duration",
      "currency_id",
      "number_of_opened_session",
      "last_session_closing_cash"
    ];
    final subscript = _dataRepo
        .searchRead(SHOPS,
            domain: [],
            fields: fields,
            limit: LIMIT_SHOP,
            sort: '',
            context: userSharePref.getUser()?.userContext?.toJson())
        .doOnData((r) {
      shopsResponse = ShopsResponse.fromJson(r);
    }).doOnError((e, stacktrace) {
      if (e is DioError)
        shopsResponse = ShopsResponse.fromJson(e.response?.data.trim());
    }).doOnListen(() {
      EasyLoading.show();
    }).doOnDone(() {
      EasyLoading.dismiss();
    }).listen((_) {
      if (shopsResponse?.result != null) {
        shops = shopsResponse?.result?.records ?? [];
        notifyListeners();
      } else {
        _navigationService.gotoErrorPage();
      }
    }, onError: (e) {
      _navigationService.gotoErrorPage();
    });
    addSubscription(subscript);
  }

  void onClickItem() {
    ToastUtil.showToast('Test');
  }

  gotoDetailShop() async {
    removeFocus(_navigationService.navigatorKey.currentContext!);
    _navigationService.pushScreenWithFade(DetailShopPage());
  }
}
