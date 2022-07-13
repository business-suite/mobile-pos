import 'package:business_suite_mobile_pos/app/view/authentication/authentication_viewmodel.dart';
import 'package:business_suite_mobile_pos/app/view/home/customer_list/customer_list_viewmodel.dart';
import 'package:business_suite_mobile_pos/app/view/home/detail_shop/detail_shop_viewmodel.dart';
import 'package:business_suite_mobile_pos/app/view/home/home_viewmodel.dart';
import 'package:business_suite_mobile_pos/app/view/sign_up/sign_up_viewmodel.dart';
import 'package:get_it/get_it.dart';

import '../module/common/navigator_screen.dart';
import '../module/local_storage/shared_pref_manager.dart';
import '../module/network/request/auth_request.dart';
import '../module/repository/data_repository.dart';
import '../view/home/detail_shop/review/review_viewmodel.dart';
import '../view/forgot_pass/forgot_pass_viewmodel.dart';
import '../view/home/order_list/order_list_viewmodel.dart';
import '../view/home/pay/pay_viewmodel.dart';
import '../view/home/shop_list/shop_list_viewmodel.dart';
import '../view/intro/intro_viewmodel.dart';
import '../view/sign_in/sign_in_viewmodel.dart';
import '../view/splash/splash_viewmodel.dart';
import '../view/webview/webview_viewmodel.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  //local storage
  getIt.registerSingleton<UserSharePref>(UserSharePref());
  getIt.registerSingleton<SharedPrefManager>(SharedPrefManager());
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());

  //repository
  getIt.registerFactory<AuthRequest>(() => AuthRequest());
  //getIt.registerFactory<SocketManager>(() => SocketManager());

  //data repository
  getIt.registerFactory<DataRepository>(() => DataRepository(
        getIt<AuthRequest>(),
        getIt<SharedPrefManager>(),
       // getIt<SocketManager>(),
      ));

  //view model
  getIt.registerFactory<SplashViewModel>(
      () => SplashViewModel(getIt<DataRepository>()));

  getIt.registerFactory<IntroViewModel>(
      () => IntroViewModel(getIt<DataRepository>()));

  getIt.registerFactory<SignInViewModel>(
      () => SignInViewModel(getIt<DataRepository>()));

  getIt.registerFactory<SignUpViewModel>(
      () => SignUpViewModel(getIt<DataRepository>()));

  getIt.registerFactory<ForgotPassViewModel>(
          () => ForgotPassViewModel(getIt<DataRepository>()));

  getIt.registerFactory<AuthenticationViewModel>(
          () => AuthenticationViewModel(getIt<DataRepository>()));

  getIt.registerFactory<HomeViewModel>(
      () => HomeViewModel(getIt<DataRepository>()));

  getIt.registerFactory<ShopListViewModel>(
          () => ShopListViewModel(getIt<DataRepository>()));

  getIt.registerFactory<DetailShopViewModel>(
      () => DetailShopViewModel(getIt<DataRepository>()));

  getIt.registerFactory<PayViewModel>(
      () => PayViewModel(getIt<DataRepository>()));

  getIt.registerFactory<ReviewViewModel>(
      () => ReviewViewModel(getIt<DataRepository>()));

  getIt.registerFactory<OrderListViewModel>(
      () => OrderListViewModel(getIt<DataRepository>()));

  getIt.registerFactory<CustomerListViewModel>(
          () => CustomerListViewModel(getIt<DataRepository>()));

  getIt.registerFactoryParam<WebviewViewModel, List<dynamic>, String>(
      (param1, _) => //no need param2
          WebviewViewModel(webviewParam: param1[0]));
}
