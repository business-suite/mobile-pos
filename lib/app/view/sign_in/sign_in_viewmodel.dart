import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';


import '../../di/injection.dart';
import '../../module/common/navigator_screen.dart';
import '../../module/local_storage/shared_pref_manager.dart';
import '../../module/network/response/login_response.dart';
import '../../module/repository/data_repository.dart';
import '../../viewmodel/base_viewmodel.dart';
import '../home/detail_shop/detail_shop.dart';

class SignInViewModel extends BaseViewModel {
  final DataRepository _dataRepo;
  late LoginResponse _response;
  NavigationService _navigationService = getIt<NavigationService>();
  UserSharePref _userSharePref = getIt<UserSharePref>();

  SignInViewModel(this._dataRepo);

  set response(LoginResponse response) {
    _response = response;
    notifyListeners();
  }

  LoginResponse get response => _response;

  setloginType(int loginType) => _userSharePref.saveLoginType(loginType);

  /*Observable sign_in(Map<String, dynamic> params) => _dataRepo
      .sign_in(params)
      .doOnData((r) => response = LoginResponse.fromJson(r))
      .doOnError((e, stacktrace) {
        if (e is DioError) {
          response = LoginResponse.fromJson(e.response?.data.trim());
        }
      })
      .doOnListen(() {})
      .doOnDone(() {
        EasyLoading.dismiss();
      });*/

  Future<void> loginApi(String twitterId) async {
    Map<String, dynamic> params = new Map<String, dynamic>();
    params.putIfAbsent('login_type', () => 1);
    params.putIfAbsent('twitter_id', () => twitterId);
    _navigationService.pushReplacementScreenWithFade(DetailShopPage());
    /*final subscript = this.sign_in(params).listen((_) {
      if (response.success) {
        _userSharePref.saveUser(response);
        _userSharePref.saveTwitterId(twitterId);
        if(response.is_new_regist){
          //new register => goto Agreement Page
          //_navigationService.pushReplacementScreenWithFade(DetailShopPage()());
        }else{
          _navigationService.pushReplacementScreenWithFade(HomePage());
        }
      } else {
        _navigationService.gotoErrorPage(message: response.error_message);
      }
    }, onError: (e) {
      _navigationService.gotoErrorPage();
    });
    this.addSubscription(subscript);*/
  }


  Future<void> signOut() async{
    // _userSharePref.saveUser(null);
    // _userSharePref.saveTwitterId(null);
    // _userSharePref.saveAppToken(null);
    // _userSharePref.saveFirebaseToken(null);
  }


}
