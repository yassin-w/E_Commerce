class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "http://192.168.0.130:8081";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 15000;

  static const String products = '/products';
  static const String authurl = '/api/auth';
}
