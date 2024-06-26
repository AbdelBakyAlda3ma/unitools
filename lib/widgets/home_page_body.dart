// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:unitools/core/constant.dart';
import 'package:unitools/core/items.dart';
import 'package:unitools/models/item_navigaion_model.dart';
import 'package:unitools/views/add_item_view.dart';
import 'package:unitools/views/my_favourite_view.dart';
import 'package:unitools/views/not_found_view.dart';
import 'package:unitools/widgets/category_grid_view.dart';
import 'package:unitools/widgets/custom_app_bar.dart';
import 'package:unitools/widgets/search_section.dart';

import '../views/home_page_view.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  bool isClickedHome = true;
  bool isClickedTools = false;
  bool isClickedProgram = false;
  bool isClickedSection = false;
  bool isClickedLectures = false;
  int currentIndex = 0;
  List<String> horizontalBarList = [
    "Home",
    "Tools",
    "Programs",
    "Sections",
    "Lectures",
  ];

  @override
  Widget build(BuildContext context) {
    const linearGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xffA0DAFB), Color(0xff0A8ED9)],
    );

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
        selectedIndex: 4,
        destinations: itemNavigationBar.map((item) {
          return NavigationDestination(
            icon: item.icon == ""
                ? Icon(item.photo, color: Colors.blue)
                : SvgPicture.asset(item.icon),
            label: item.title,
          );
        }).toList(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const CustomAppBar(),
              const SearchSection(linearGradient: linearGradient),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => HorizontalBarItem(
                    isClicked: currentIndex == index,
                    linearGradient: linearGradient,
                    text: horizontalBarList[index],
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                      });
                      clickTap(index + 1);
                    },
                  ),
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(
                    width: 10,
                  ),
                  itemCount: 5,
                ),
              ),
              const SizedBox(
                height: 27,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Discover more",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  GestureDetector(
                    child: const Text(
                      "See more",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff00A2FF),
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              isClickedHome
                  ? CategoryGridView(
                      numberOfTab: 0,
                      itemModel: items,
                    )
                  : isClickedTools
                      ? CategoryGridView(
                          numberOfTab: 1,
                          itemModel: items,
                        )
                      : isClickedProgram
                          ? CategoryGridView(
                              numberOfTab: 2,
                              itemModel: items,
                            )
                          : isClickedSection
                              ? CategoryGridView(
                                  numberOfTab: 3,
                                  itemModel: items,
                                )
                              : isClickedLectures
                                  ? CategoryGridView(
                                      numberOfTab: 4,
                                      itemModel: items,
                                    )
                                  : const NotFoundView()
            ],
          ),
        ),
      ),
    );
  }

  void clickTap(int state) {
    switch (state) {
      case 1:
        isClickedHome = true;
        isClickedTools = false;
        isClickedProgram = false;
        isClickedSection = false;
        isClickedLectures = false;
        setState(() {});
      case 2:
        isClickedHome = false;
        isClickedTools = true;
        isClickedProgram = false;
        isClickedSection = false;
        isClickedLectures = false;
        setState(() {});
      case 3:
        isClickedHome = false;
        isClickedTools = false;
        isClickedProgram = true;
        isClickedSection = false;
        isClickedLectures = false;
        setState(() {});
      case 4:
        isClickedHome = false;
        isClickedTools = false;
        isClickedProgram = false;
        isClickedSection = true;
        isClickedLectures = false;
        setState(() {});
      case 5:
        isClickedHome = false;
        isClickedTools = false;
        isClickedProgram = false;
        isClickedSection = false;
        isClickedLectures = true;
        setState(() {});
        break;
      default:
    }
  }
}

class HorizontalBarItem extends StatelessWidget {
  const HorizontalBarItem({
    super.key,
    required this.isClicked,
    required this.linearGradient,
    this.onTap,
    required this.text,
  });

  final bool isClicked;
  final LinearGradient linearGradient;
  final void Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: !isClicked ? const Color.fromARGB(207, 242, 240, 240) : null,
            borderRadius: BorderRadius.circular(10),
            gradient: isClicked ? linearGradient : null,
          ),
          width: 80,
          height: 40,
          child: Text(
            text,
            style: TextStyle(
              color: isClicked ? Colors.white : const Color(0xff858585),
            ),
          ),
        ),
      ),
    );
  }
}

class ItemNavigationBar extends StatelessWidget {
  const ItemNavigationBar({
    super.key,
    required this.item,
  });
  final ItemNavigationModel item;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        item.icon == ""
            ? Icon(
                item.photo,
                color: Colors.red,
              )
            : SvgPicture.asset(item.icon),
        const SizedBox(
          height: 9.5,
        ),
        Text(
          item.title,
          style: const TextStyle(color: Colors.black, fontSize: 14),
        ),
      ],
    );
  }
}
