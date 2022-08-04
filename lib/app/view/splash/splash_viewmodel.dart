import 'package:business_suite_mobile_pos/app/view/home/home_page.dart';
import 'package:business_suite_mobile_pos/app/view/intro/intro_page.dart';
import 'package:business_suite_mobile_pos/app/view/sign_in/sign_in_page.dart';

import '../../di/injection.dart';
import '../../module/common/config.dart';
import '../../module/common/navigator_screen.dart';
import '../../module/local_storage/shared_pref_manager.dart';
import '../../module/repository/data_repository.dart';
import '../../viewmodel/base_viewmodel.dart';
import '../home/detail_shop/product_page.dart';

class SplashViewModel extends BaseViewModel {
  final DataRepository _dataRepo;
  NavigationService _navigationService = getIt<NavigationService>();
  UserSharePref userSharePref = getIt<UserSharePref>();

  SplashViewModel(this._dataRepo);

  Future<void> startApi() async {
    Future.delayed(
      Duration(milliseconds: DELAY_SPLASH_PAGE),
      () {
        if( userSharePref.getUser() != null) {
          print('User Info: ' +  userSharePref.getUser()!.toJson().toString() );
        }
        if (userSharePref.isLogin()) {
          _navigationService.pushReplacementScreenWithFade(HomePage());
        } else {
          _navigationService.pushReplacementScreenWithFade(IntroPage());
        }
      },
    );
  }
}
