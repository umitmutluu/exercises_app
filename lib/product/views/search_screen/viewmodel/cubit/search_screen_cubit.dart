import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exercises_app/product/service/search_screen_service/i-search_screen_service.dart';
import 'package:exercises_app/product/views/search_screen/model/search_screen_model.dart';

part 'search_screen_state.dart';

class SearchScreenCubit extends Cubit<SearchScreenState> {
  final ISearchService searchService;

  late List<SearchModel> searchResultItems;
  bool isPagingLoading = false;

  SearchScreenCubit(this.searchService) : super(SearchScreenInitialState());

  late String valueKey;

  void changeLoading() {
    isPagingLoading = !isPagingLoading;
  }

  void onValueChange(String value) {
    valueKey = value;

    fetchSearchItems();
  }

  Future<void> fetchSearchItems() async {
    emit(const SearchScreenLoadingState(true));
    final items = await searchService.fetchSearchList(value: valueKey);
    if (items == null) {
      emit(SearchScreenFailureState());
    } else {
      if (items.isNotEmpty) {
        searchResultItems = items;
        emit(SearchScreenLoadedState(items));
      }
    }
  }
}
