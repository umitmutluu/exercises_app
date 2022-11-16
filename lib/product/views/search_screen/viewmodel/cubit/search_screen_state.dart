part of 'search_screen_cubit.dart';

abstract class SearchScreenState extends Equatable {
  const SearchScreenState();
}

class SearchScreenInitialState extends SearchScreenState {
  @override
  List<Object> get props => [];
}

class SearchScreenLoadingState extends SearchScreenState {
  final bool isLoading;

  const SearchScreenLoadingState(this.isLoading);

  @override
  List<Object> get props => [];
}

class SearchScreenLoadedState extends SearchScreenState {
  final List<SearchModel> items;

  const SearchScreenLoadedState(this.items);
  @override
  List<Object> get props => [items];
}

class SearchScreenFailureState extends SearchScreenState {
  @override
  List<Object> get props => [];
}
