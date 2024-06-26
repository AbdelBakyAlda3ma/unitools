import 'package:flutter/material.dart';
import 'package:unitools/core/constant.dart';
import 'package:unitools/widgets/category_item.dart';

class MyFavouriteGridView extends StatelessWidget {
  const MyFavouriteGridView({
    super.key,
  });
  // final List<ItemModel> itemModel;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: favouriteTools.length,
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.79,
        crossAxisSpacing: 10,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        return CategoryItem(
          toolModel: favouriteTools[index],
        );
      },
    );
  }
}
