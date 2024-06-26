// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'dart:typed_data';

import 'package:flutter/material.dart';

class ChooceImageWidget extends StatelessWidget {
  const ChooceImageWidget(
      {super.key, this.image, this.onTap, required this.title});
  final Uint8List? image;
  final void Function()? onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 90,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: const Color(0xffD5D5D580),
              ),
              image: image != null
                  ? DecorationImage(
                      image: MemoryImage(image!),
                      fit: BoxFit.cover,
                    )
                  : null),
          child: image != null
              ? const Text("")
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add,
                      size: 50,
                      color: Color.fromRGBO(18, 18, 18, 0.7),
                    ),
                    Text(title),
                  ],
                ),
        ),
      ),
    );
  }
}
