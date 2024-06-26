import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:unitools/widgets/custom_search_text_field.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({
    super.key,
    required this.linearGradient,
  });

  final LinearGradient linearGradient;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(
          child: CustomSearchTextField(),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: linearGradient,
          ),
          child: IconButton(
            icon: SvgPicture.asset(
              "assets/images/sliders.svg",
              width: 30,
              height: 30,
            ),
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
