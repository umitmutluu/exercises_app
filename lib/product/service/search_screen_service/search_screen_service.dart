import 'package:exercises_app/core/utils/network_query.dart';
import 'package:exercises_app/product/service/base_service/base_service.dart';
import 'package:exercises_app/product/service/search_screen_service/i-search_screen_service.dart';
import 'package:exercises_app/product/views/search_screen/model/search_screen_model.dart';

class SearchService extends ISearchService {
  SearchService(BaseApiService manager) : super(manager);

  @override
  Future<List<SearchModel>?> fetchSearchList({String? value}) async {
    List<SearchModel>? modelElements;
    final response = await baseManager.fetchData(
      endPoint,
      parameters: Map.fromEntries(
        [NetworkQuery.valueQueryMuscle.valueQueryMuscleFunc(value ?? '')],
      ),
    );
    if (response == []) {
      final response = await baseManager.fetchData(
        endPoint,
        parameters: Map.fromEntries(
          [NetworkQuery.valueQueryType.valueQueryTypeFunc(value ?? '')],
        ),
      );
      modelElements?.addAll(searchModelFromJson(response));
    } else {
      modelElements?.addAll(searchModelFromJson(response));
    }
    return modelElements;
  }
}
