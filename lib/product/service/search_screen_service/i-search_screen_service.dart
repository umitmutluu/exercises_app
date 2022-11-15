import 'package:exercises_app/product/service/base_service/base_service.dart';
import 'package:exercises_app/product/views/search_screen/model/search_screen_model.dart';

abstract class ISearchService {
  late BaseApiService baseManager;

  ISearchService(this.baseManager);

  final String endPoint = ISearchServicePath.endPoint.returnValue;

  Future<List<SearchModel>?> fetchSearchList({String muscle, String type});
}

enum ISearchServicePath {
  endPoint,
}

extension IWordServicePathExtension on ISearchServicePath {
  String get returnValue {
    switch (this) {
      case ISearchServicePath.endPoint:
        return "v1/exercises";
      default:
        return "";
    }
  }
}
