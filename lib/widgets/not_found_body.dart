import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotFoundBody extends StatelessWidget {
  const NotFoundBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/notFound.png",
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Not Found",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
              color: Color(0xff858585)),
        ),
        // const SizedBox(
        //   height: 8,
        // ),
        const Text(
          "sorry, the tool you search cannot be found\n please check again or search with another keyword.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Color(0xff858585),
          ),
        ),
      ],
    );
  }
}
