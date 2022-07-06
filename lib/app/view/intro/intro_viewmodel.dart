import 'package:business_suite_mobile_pos/app/view/sign_up/sign_up_page.dart';

import '../../di/injection.dart';
import '../../module/common/navigator_screen.dart';
import '../../module/local_storage/shared_pref_manager.dart';
import '../../module/repository/data_repository.dart';
import '../../viewmodel/base_viewmodel.dart';
import '../home/detail_shop/detail_shop.dart';

class IntroViewModel extends BaseViewModel {
  final DataRepository _dataRepo;
  NavigationService _navigationService = getIt<NavigationService>();
  UserSharePref _userSharePref = getIt<UserSharePref>();
  bool termOfService = false;
  bool policy = false;

  IntroViewModel(this._dataRepo);

  void changeTermOfService() {
    termOfService = !termOfService;
    notifyListeners();
  }

  void changePolicy() {
    policy = !policy;
    notifyListeners();
  }


  void gotoSignIn() {
   // _navigationService.pushEnterFadeExitDown(SignInPage());
    _navigationService.pushEnterFadeExitDown(DetailShopPage());

  }

  void gotoSignUp() {_navigationService.pushEnterFadeExitDown(SignUpPage());
  }
}
