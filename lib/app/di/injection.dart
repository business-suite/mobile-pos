import 'package:business_suite_mobile_pos/app/view/authentication/authentication_viewmodel.dart';
import 'package:business_suite_mobile_pos/app/view/home/add_customer/add_customer_viewmodel.dart';
import 'package:business_suite_mobile_pos/app/view/home/products/products_viewmodel.dart';
import 'package:business_suite_mobile_pos/app/view/home/products/validate_page/validate_viewmodel.dart';
import 'package:business_suite_mobile_pos/app/view/home/home_viewmodel.dart';
import 'package:business_suite_mobile_pos/app/view/home/popup_quotation_order_page/percentage_viewmodel.dart';
import 'package:business_suite_mobile_pos/app/view/sign_up/sign_up_viewmodel.dart';
import 'package:get_it/get_it.dart';

import '../module/common/navigator_screen.dart';
import '../module/local_storage/shared_pref_manager.dart';
import '../module/repository/data_repository.dart';
import '../view/forgot_pass/forgot_pass_viewmodel.dart';
import '../view/home/closing_control/closing_control_viewmodel.dart';
import '../view/home/coins_bills/coins_bills_viewmodel.dart';
import '../view/home/customer_phone_list/customer_phone_list_viewmodel.dart';
import '../view/home/customer_tablet_list/customer_tablet_list_viewmodel.dart';
import '../view/home/products/review/review_viewmodel.dart';
import '../view/home/invoice/invite_viewmodel.dart';
import '../view/home/opening_cash_control/opening_cash_viewmodel.dart';
import '../view/home/order_list/order_list_viewmodel.dart';
import '../view/home/pay/pay_viewmodel.dart';
import '../view/home/shops/shops_viewmodel.dart';
import '../view/input_server_port/input_server_port_viewmodel.dart';
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
  //getIt.registerFactory<SocketManager>(() => SocketManager());

  //data repository
  getIt.registerFactory<DataRepository>(() => DataRepository(
        getIt<UserSharePref>(),
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

  getIt.registerFactory<ShopsViewModel>(
      () => ShopsViewModel(getIt<DataRepository>()));

  getIt.registerFactory<ProductsViewModel>(
      () => ProductsViewModel(getIt<DataRepository>()));

  getIt.registerFactory<PayViewModel>(
      () => PayViewModel(getIt<DataRepository>()));

  getIt.registerFactory<ReviewViewModel>(
      () => ReviewViewModel(getIt<DataRepository>()));

  getIt.registerFactory<ValidateViewModel>(
      () => ValidateViewModel(getIt<DataRepository>()));

  getIt.registerFactory<OrderListViewModel>(
      () => OrderListViewModel(getIt<DataRepository>()));

  getIt.registerFactory<CustomerPhoneListViewModel>(
      () => CustomerPhoneListViewModel(getIt<DataRepository>()));

  getIt.registerFactory<CustomerTabletListViewModel>(
      () => CustomerTabletListViewModel(getIt<DataRepository>()));

  getIt.registerFactory<AddCustomertViewModel>(
      () => AddCustomertViewModel(getIt<DataRepository>()));

  getIt.registerFactory<PercentageViewModel>(
      () => PercentageViewModel(getIt<DataRepository>()));

  getIt.registerFactory<InVoiceViewModel>(
      () => InVoiceViewModel(getIt<DataRepository>()));

  getIt.registerFactory<InputServerPortViewModel>(
      () => InputServerPortViewModel(getIt<DataRepository>()));

  getIt.registerFactory<ConInsBillsViewModel>(
          () => ConInsBillsViewModel(getIt<DataRepository>()));

  getIt.registerFactory<ClosingControlViewModel>(
          () => ClosingControlViewModel(getIt<DataRepository>()));


  getIt.registerFactory<OpeningCashViewModel>(
          () => OpeningCashViewModel(getIt<DataRepository>()));

  getIt.registerFactoryParam<WebviewViewModel, List<dynamic>, dynamic>(
      (param1, _) => //no need param2
          WebviewViewModel(webviewParam: param1[0]));
}
