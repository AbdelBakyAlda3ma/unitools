import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unitools/models/item_model.dart';
import 'package:unitools/models/item_navigaion_model.dart';

var routes = {};
List<ItemModel> favouriteItem = [];

List<ItemNavigationModel> itemNavigationBar = [
  ItemNavigationModel(icon: "assets/images/person.svg", title: "Profile"),
  ItemNavigationModel(icon: "assets/images/advertise.svg", title: "Advertise"),
  ItemNavigationModel(icon: "assets/images/add.svg", title: "Add"),
  ItemNavigationModel(
      icon: "", photo: FontAwesomeIcons.heartCirclePlus, title: "Favourite"),
  ItemNavigationModel(
      icon: "assets/images/homepage.svg", title: "Home page"),
];
