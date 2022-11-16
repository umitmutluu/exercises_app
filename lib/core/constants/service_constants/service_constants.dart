class ServiceConstants {
  static ServiceConstants? _instance;

  static ServiceConstants? get instance {
    _instance ??= ServiceConstants._init();
    return _instance;
  }

  ServiceConstants._init();

  String get baseUrl => "https://exercises-by-api-ninjas.p.rapidapi.com/";

  Map<String, String> get headersJson => {
        'X-RapidAPI-Key': 'b8aa8f38b4msh2df26dec40d9995p175000jsn40bd08aa495a',
        'X-RapidAPI-Host': 'exercises-by-api-ninjas.p.rapidapi.com'
      };
}
