import 'package:exercises_app/core/system_widgets/custom_padding.dart';
import 'package:exercises_app/product/views/search_screen/viewmodel/cubit/search_screen_cubit.dart';
import 'package:flutter/material.dart';

extension SearchFailureItemWidget on SearchScreenFailureState {
  Widget buildFailureWidget(BuildContext context) {
    return Padding(
      padding: CustomPadding.verticalSmall(),
      child: Text(
        "HATA",
        textAlign: TextAlign.center,
      ),
    );
  }
}

extension SearchItemWidget on SearchScreenLoadedState {
  Widget buildWidget(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemCount: 5,
          itemBuilder: (context, index) => Card(
                color: Colors.red,
              )),
    );
  }
}

extension SearchItemInitialWidget on SearchScreenInitialState {
  Widget buildWidget() {
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.red),
          const Center(
            child: SizedBox(
                width: 250,
                child: Text(
                  "Enter the name of the movie you want to find in the search box above.",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                )),
          ),
        ],
      ),
    );
  }
}
