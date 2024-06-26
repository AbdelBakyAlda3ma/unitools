import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unitools/controllers/tools_without_authorized_cubit/tools_without_authorized_cubit.dart';
import 'package:unitools/models/item_model.dart';
import 'package:unitools/views/not_found_view.dart';
import 'package:unitools/widgets/category_item.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({
    super.key,
    required this.itemModel,
    required this.numberOfTab,
  });
  final List<ItemModel> itemModel;
  final int numberOfTab;
  @override
  Widget build(BuildContext context) {
    List<ItemModel> filteredItems = [];
    for (var item in itemModel) {
      if (numberOfTab == 0 ||
          (numberOfTab == 1 && item.category == "tools") ||
          (numberOfTab == 2 && item.category == "programs") ||
          (numberOfTab == 3 && item.category == "section") ||
          (numberOfTab == 4 && item.category == "lecture")) {
        filteredItems.add(item);
      }
    }

    numberOfTab.clamp(0, 4);

    return filteredItems.isEmpty
        ? const NotFoundView()
        : Expanded(
            child: Column(
              children: [
                Expanded(
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (notification) {
                      if (notification.metrics.pixels ==
                              notification.metrics.maxScrollExtent &&
                          notification is ScrollUpdateNotification) {
                        ToolsWithoutAuthorizedCubit.get(context)
                            .getAllToolsWithoutAuthorized(fromLoading: true);
                      }
                      return true;
                    },
                    child: BlocBuilder<ToolsWithoutAuthorizedCubit,
                        ToolsWithoutAuthorizedState>(
                      buildWhen: (previous, current) => current
                          is! ToolsWithoutAuthorizedFromPaginationLoading,
                      builder: (context, state) {
                        if (state is ToolsWithoutAuthorizedSuccess) {
                          return GridView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: state.tools.length,
                            physics: const BouncingScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.79,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 12,
                            ),
                            itemBuilder: (context, index) {
                              return CategoryItem(
                                toolModel: state.tools[index],
                              );
                            },
                          );
                        }
                        if (state is ToolsWithoutAuthorizedFailure) {
                          return Center(
                            child: Text(
                              state.errMsg,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 26,
                                color: Color(0xff858585),
                              ),
                            ),
                          );
                        } else {
                          return const SizedBox(
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }
                      },
                    ),
                  ),
                ),
                BlocBuilder<ToolsWithoutAuthorizedCubit,
                    ToolsWithoutAuthorizedState>(
                  builder: (context, state) {
                    if (state is ToolsWithoutAuthorizedFromPaginationLoading) {
                      return const SizedBox(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ],
            ),
          );
  }
}
