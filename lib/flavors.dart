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

}
