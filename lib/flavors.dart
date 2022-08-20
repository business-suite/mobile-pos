import 'package:business_suite_mobile_pos/app/module/local_storage/shared_pref_manager.dart';

import 'app/di/injection.dart';
import 'app/module/common/config.dart';

enum Flavor {
  DEVELOPMENT,
  PRODUCTION,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  //Title App
  static String get title {
    switch (appFlavor) {
      case Flavor.DEVELOPMENT:
        return '$APP_NAME(dev)';
      case Flavor.PRODUCTION:
        return APP_NAME;
      default:
        return APP_NAME;
    }
  }

  //Base URL
 /* static String get baseUrl {
    switch (appFlavor) {
      case Flavor.DEVELOPMENT:
        return getIt<UserSharePref>().getLoginConfig()?.getBaseUrl() ?? '';
      case Flavor.PRODUCTION:
        return getIt<UserSharePref>().getLoginConfig()?.getBaseUrl() ?? '';
      default:
        return getIt<UserSharePref>().getLoginConfig()?.getBaseUrl() ?? '';
    }
  }*/

  //Host
  static String get host {
    switch (appFlavor) {
      case Flavor.DEVELOPMENT:
        return HOST;
      case Flavor.PRODUCTION:
        return HOST;
      default:
        return HOST;
    }
  }

  //Port
  static int get port {
    switch (appFlavor) {
      case Flavor.DEVELOPMENT:
        return PORT;
      case Flavor.PRODUCTION:
        return PORT;
      default:
        return PORT;
    }
  }

  //Odoo database
  /*static String get odooDatabase {
    switch (appFlavor) {
      case Flavor.DEVELOPMENT:
        return ODOO_DB;
      case Flavor.PRODUCTION:
        return ODOO_DB;
      default:
        return ODOO_DB;
    }
  }*/
}
