import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_screen_state.dart';

class SearchScreenCubit extends Cubit<SearchScreenState> {
  SearchScreenCubit() : super(SearchScreenInitial());
}
