// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:unitools/core/constant.dart';
import 'package:unitools/models/tool_model.dart';

class CategoryItem extends StatefulWidget {
  const CategoryItem({
    super.key,
    required this.toolModel,
  });

  final ToolModel toolModel;

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: 230,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xff1212120D)),
      ),
      child: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: 86,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      widget.toolModel.photos?[0] ?? '',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Text(
              widget.toolModel.name ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              widget.toolModel.description ?? '',
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 70,
                        height: 25,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: const Color.fromARGB(207, 242, 240, 240),
                        ),
                        child: Text(
                          widget.toolModel.university ?? '',
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Container(
                        width: 65,
                        height: 25,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: const Color.fromARGB(207, 242, 240, 240),
                        ),
                        child: Text(
                          '${widget.toolModel.price} EGP',
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  widget.toolModel.college != null
                      ? Container(
                          width: 142,
                          height: 31,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: const Color.fromARGB(207, 242, 240, 240),
                          ),
                          child: Text(
                            widget.toolModel.college ?? "",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : const Text(""),
                ],
              ),
            )
          ],
        ),
        Positioned(
          top: 185,
          left: 145,
          child: GestureDetector(
            // Step 2
            onTap: () {
              setState(() {
                if (!favouriteTools.contains(widget.toolModel)) {
                  favouriteTools.add(widget.toolModel);
                } else {
                  favouriteTools.remove(widget.toolModel);
                }
              });
            },
            child: Icon(
              favouriteTools.contains(widget.toolModel)
                  ? Icons.favorite
                  : Icons.favorite_outline, // Step 4
              size: 25,
              color: favouriteTools.contains(widget.toolModel)
                  ? Colors.red
                  : null, // Example: Change color when favorited
            ),
          ),
        ),
      ]),
    );
  }
}
