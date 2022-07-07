<<<<<<< Updated upstream
import 'package:business_suite_mobile_pos/app/view/home/detail_shop/detail_shop.dart';
import 'package:business_suite_mobile_pos/app/view/home/detail_shop/validate_page/validate_page.dart';
import 'package:business_suite_mobile_pos/app/view/home/home_page.dart';
=======
import 'package:business_suite_mobile_pos/app/view/sign_in/sign_in_page.dart';
>>>>>>> Stashed changes
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../flavors.dart';
import 'di/injection.dart';
import 'module/common/navigator_screen.dart';
import 'module/common/system_utils.dart';
import 'module/res/colors.dart';
import 'module/res/themes.dart';
import 'view/widget_utils/custom/flutter_easyloading/flutter_easyloading.dart';
import 'view/splash/splash_page.dart';

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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: transparent));
  }

  @override
  void dispose() {
    super.dispose();
  }

  void backPress(BuildContext context) {
    Navigator.of(context).pop();
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
<<<<<<< Updated upstream
       // home: SplashPage(),
       home: ValidatePage(),
=======
        //home: SplashPage(),
        home: SignInPage(),
>>>>>>> Stashed changes
        builder: EasyLoading.init(),
        navigatorKey: getIt<NavigationService>().navigatorKey,
      ),
    );
  }
}
