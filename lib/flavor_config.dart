enum Flavor { dev, staging, prod }

class FlavorConfig {
  late String baseUrl;
  Flavor flavor;

  FlavorConfig({required this.flavor}) {
    switch (flavor) {
      case Flavor.dev:
        baseUrl = 'dev url';
      case Flavor.staging:
        baseUrl = 'stage url';
      case Flavor.prod:
        baseUrl = 'prod url';
    }
  }
}
