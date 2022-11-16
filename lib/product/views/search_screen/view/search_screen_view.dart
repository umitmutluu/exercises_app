import 'package:exercises_app/core/exceptions/widget_exceptions/widget_exceptions.dart';
import 'package:exercises_app/core/system_widgets/custom_padding.dart';
import 'package:exercises_app/product/service/base_service/base_service.dart';
import 'package:exercises_app/product/service/search_screen_service/search_screen_service.dart';
import 'package:exercises_app/product/views/search_screen/view/search_screen_view_extension.dart';
import 'package:exercises_app/product/views/search_screen/viewmodel/cubit/search_screen_cubit.dart';
import 'package:exercises_app/product/views/search_screen/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreenView extends StatelessWidget {
  SearchScreenView({Key? key}) : super(key: key);
  final searchCubit = SearchScreenCubit(SearchService(BaseApiService()));
  final TextEditingController searchBarEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: true,
      create: (context) => searchCubit,
      child: BlocConsumer<SearchScreenCubit, SearchScreenState>(
        listener: (context, state) {
          if (state is SearchScreenFailureState) {}
          if (state is SearchScreenInitialState) {}
        },
        builder: (context, state) {
          return buildScaffold(state, context);
        },
      ),
    );
  }

  Widget buildScaffold(SearchScreenState state, BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          toolbarHeight: 70,
          expandedHeight: 200,
          floating: true,
          pinned: true,
          flexibleSpace: const FlexibleSpaceBar(
            titlePadding: EdgeInsets.only(bottom: 20),
            centerTitle: true,
            collapseMode: CollapseMode.pin,
            expandedTitleScale: 1,
          ),
          title: CustomTextFormField(
              suffixIcon: GestureDetector(
                  child: const Icon(Icons.close),
                  onTap: () {
                    searchBarEditingController.text = '';
                  }),
              onChanged: context.read<SearchScreenCubit>().onValueChange,
              hintText: "",
              controller: searchBarEditingController),
          actions: [
            Padding(
              padding: const CustomPadding.horizontalXSmall(),
              child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  width: 30,
                  child: const Icon(Icons.add)),
            ),
          ],
        ),
        buildBodyText(state, context)
      ],
    ));
  }

  Widget buildBodyText(SearchScreenState state, BuildContext context) {
    if (state is SearchScreenInitialState) {
      return state.buildWidget();
    } else if (state is SearchScreenLoadingState) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is SearchScreenLoadedState) {
      return state.buildWidget(context);
    } else if (state is SearchScreenFailureState) {
      return state.buildFailureWidget(context);
    }
    throw WidgetNotFoundException<SearchScreenView, SearchScreenState>(state);
  }
}
