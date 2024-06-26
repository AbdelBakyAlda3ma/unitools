import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
      fillColor: const Color.fromARGB(190, 235, 231, 231),
      filled: true,
      enabledBorder: buildOutlineInputBorder(),
      focusedBorder: buildOutlineInputBorder(),
      hintText: "Search tool, or material you need",
      hintStyle: const TextStyle(color: Color(0xff858585)),
      prefixIcon: IconButton(
          onPressed: () {},
          icon: Opacity(
              opacity: 0.8,
              child: SvgPicture.asset(
                "assets/images/searchIcon.svg",
                width: 20,
                height: 20,
              ))),
    ));
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(12));
  }
}
