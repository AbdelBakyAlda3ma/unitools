import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:unitools/core/constant.dart';
import 'package:unitools/views/home_page_view.dart';
import 'package:unitools/views/my_favourite_view.dart';
import 'package:unitools/widgets/add_item_view_body.dart';

class AddItemView extends StatefulWidget {
  const AddItemView({super.key});
  static String routeName = "/AddItemView";

  @override
  State<AddItemView> createState() => _AddItemViewState();
}

class _AddItemViewState extends State<AddItemView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {
          if (value == 0) {
          } else if (value == 1) {
          } else if (value == 2) {
            Navigator.pushNamed(context, AddItemView.routeName);
          } else if (value == 3) {
            Navigator.pushNamed(context, MyFavouriteView.routeName)
                .whenComplete(() => setState(() {}));
          } else if (value == 4) {
            Navigator.pushNamed(context, HomePage.routeName);
          }
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedIndex: 2,
        destinations: itemNavigationBar.map((item) {
          return NavigationDestination(
            icon: item.icon == ""
                ? Icon(item.photo, color: Colors.blue)
                : SvgPicture.asset(item.icon),
            label: item.title,
          );
        }).toList(),
      ),
      body: const AddItemViewBody(),
    );
  }
}
