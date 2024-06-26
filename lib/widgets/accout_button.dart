import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AccountButton extends StatelessWidget {
  final String image;
  const AccountButton({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: SvgPicture.asset(
        image,
      ),
    );
  }
}
