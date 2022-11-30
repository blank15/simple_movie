enum Flavor {
  DEVELOPMENT,
  RELEASE,
}

class Config {
  static Flavor appFlavor = Flavor.DEVELOPMENT;

  static bool get isDebug {
    switch (appFlavor) {
      case Flavor.RELEASE:
        return false;
      case Flavor.DEVELOPMENT:
        return true;
      default:
        return true;
    }
  }
}
