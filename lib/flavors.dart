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
        return 'Business Suite Pos(dev)';
      case Flavor.PRODUCTION:
        return 'Business Suite Pos';
      default:
        return 'Business Suite Pos';
    }
  }

  //Base URL
  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.DEVELOPMENT:
        return 'http://35.207.78.4:8069';
      case Flavor.PRODUCTION:
        return 'http://35.207.78.4:8069';
      default:
        return 'http://35.207.78.4:8069';
    }
  }

  //Host
  static String get host {
    switch (appFlavor) {
      case Flavor.DEVELOPMENT:
        return '35.207.78.4';
      case Flavor.PRODUCTION:
        return '35.207.78.4';
      default:
        return '35.207.78.4';
    }
  }

  //Port
  static int get port {
    switch (appFlavor) {
      case Flavor.DEVELOPMENT:
        return 8069;
      case Flavor.PRODUCTION:
        return 8069;
      default:
        return 8069;
    }
  }

  //Odoo database
  static String get odooDatabase {
    switch (appFlavor) {
      case Flavor.DEVELOPMENT:
        return 'odoo15';
      case Flavor.PRODUCTION:
        return 'odoo15';
      default:
        return 'odoo15';
    }
  }

}
