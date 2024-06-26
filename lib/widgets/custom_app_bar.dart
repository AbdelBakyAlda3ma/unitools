import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  List<String> collegesList = [
    'medicine',
    'Engineering',
    'Science',
    'Education',
    'Commerce',
    'Literature',
    'Dentistry',
    'Pharmacy',
    'Nursing',
  ];
  String selectedCity = "Tanta";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 200,
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Univercity",
                  style: TextStyle(color: Color(0xff838383)),
                ),
                DropdownButton<String>(
                    hint: Text(
                      selectedCity,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: "Raleway",
                          fontWeight: FontWeight.w900),
                    ),
                    padding: EdgeInsets.zero,
                    items: collegesList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child:
                              Text(value, style: const TextStyle(fontSize: 20)),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      selectedCity = value!;
                      if (value == "medicine") {
                      } else if (value == "Engineering") {
                      } else if (value == "Science") {
                      } else if (value == "Education") {
                      } else if (value == "Commerce") {
                      } else if (value == "Literature") {
                      } else if (value == "Dentistry") {
                      } else if (value == "Pharmacy") {
                      } else if (value == "Nursing") {}
                      setState(() {});
                    })
              ],
            ),
          ),
          Stack(
            children: [
              SvgPicture.asset(
                "assets/images/bell.svg",
                width: 20,
                height: 25,
              ),
              Positioned(
                left: 10,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
