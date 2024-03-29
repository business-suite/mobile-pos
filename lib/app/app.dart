import 'package:business_suite_mobile_pos/app/view/home/products/products_page.dart';
import 'package:business_suite_mobile_pos/app/view/home/shops/shops_page.dart';
import 'package:business_suite_mobile_pos/app/view/splash/splash_page.dart';
import 'package:business_suite_mobile_pos/app/view/widget_utils/custom/flutter_easyloading/src/easy_loading.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import '../flavors.dart';
import 'di/injection.dart';
import 'module/common/navigator_screen.dart';
import 'module/common/system_utils.dart';
import 'module/res/themes.dart';

class App extends StatefulWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    SystemUtils.setPortraitScreenOrientation();
    //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: kColor202330));
    //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: transparent));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: MaterialApp(
        theme: theme,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: F.title,
        //hide badge debug
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
        //home: ProductsPage(),
        //home: HomePage(),
        // home: PopupPercentageContent(),
        //   home: CustomerListPage(),
        //   home: PopupQuotationOrderPage(),
        //home: AddCustomerPage(),
        builder: EasyLoading.init(),
        navigatorKey: getIt<NavigationService>().navigatorKey,
      ),
    );
  }
}
