import 'package:exercises_app/core/utils/network_query.dart';
import 'package:exercises_app/product/service/base_service/base_service.dart';
import 'package:exercises_app/product/service/search_screen_service/i-search_screen_service.dart';
import 'package:exercises_app/product/views/search_screen/model/search_screen_model.dart';

class SearchService extends ISearchService {
  SearchService(BaseApiService manager) : super(manager);

  @override
  Future<List<SearchModel>?> fetchSearchList(
      {String? muscle, String? type}) async {
    final response = await baseManager.fetchData(
      endPoint,
      parameters: Map.fromEntries(
        [
          NetworkQuery.muscle.muscleQuery(muscle ?? ''),
          NetworkQuery.type.muscleQuery(type ?? '')
        ],
      ),
    );
    final resultModel = response.data;
    if (resultModel == null) {
      return [];
    }
    final dataList = searchModelFromJson(resultModel);
    return dataList;
  }
}
