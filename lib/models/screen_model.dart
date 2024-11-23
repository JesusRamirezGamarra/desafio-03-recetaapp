// import 'package:flutter/material.dart';
// import 'package:recetasappg10/pages/home_page.dart';
// import 'package:recetasappg10/pages/recipes_page.dart';
// import 'package:recetasappg10/widgets_pages/list_view_page.dart';
// import 'package:recetasappg10/widgets_pages/scroll_page.dart';

// class ScreenModel {
//   Widget page;
//   String title;
//   Color bgColor;
//   Color colorButtonOption;
//   Icon icono;

//   ScreenModel({
//     required this.page,
//     required this.title,
//     required this.bgColor,
//     required this.colorButtonOption,
//     required this.icono,
//   });
// }

// List<ScreenModel> pageDetails = [
//   ScreenModel(
//     page: HomePage(bgColor: Color(0xffdad7cd)),
//     title: "Home Page",
//     bgColor: Color(0xffdad7cd),
//     colorButtonOption: Colors.white.withOpacity(0.3),
//     icono: Icon(Icons.home),
//   ),
//   ScreenModel(
//     page: RecipesPage(
//       bgColor: Color(0xff3a5a40),
//     ),
//     title: "Recetas Page",
//     bgColor: Color(0xff3a5a40),
//     colorButtonOption: Colors.white.withOpacity(0.3),
//     icono: Icon(Icons.food_bank),
//   ),
//   ScreenModel(
//     page: ScrollPage(
//       correo: "",
//       bgColor: Color(0xff588157),
//     ),
//     title: "Scroll Page",
//     bgColor: Color(0xff588157),
//     colorButtonOption: Colors.white.withOpacity(0.3),
//     icono: Icon(Icons.home),
//   ),
//   ScreenModel(
//     page: ListViewPage(
//       bgColor: Color(0xffa3b18a),
//     ),
//     title: "ListView Page",
//     bgColor: Color(0xffa3b18a),
//     colorButtonOption: Colors.white.withOpacity(0.3),
//     icono: Icon(Icons.arrow_drop_down_circle),
//   ),
// ];


import 'package:flutter/material.dart';
import 'package:recetasappg10/widgets_pages/list_view_page.dart';

class ScreenModel {
  Widget page;
  String title;
  Color bgColor;
  Color colorButtonOption;
  Icon icono;

  ScreenModel({
    required this.page,
    required this.title,
    required this.bgColor,
    required this.colorButtonOption,
    required this.icono,
  });
}

// List<ScreenModel> pageDetails = [
//   ScreenModel(
//     page: HomePage(bgColor: Color(0xffdad7cd)),
//     title: "Home Page",
//     bgColor: Color(0xffdad7cd),
//     colorButtonOption: Colors.white.withOpacity(0.3),
//     icono: Icon(Icons.home),
//   ),
//   ScreenModel(
//     page: RecipesPage(
//       bgColor: Color(0xff3a5a40),
//     ),
//     title: "Recetas Page",
//     bgColor: Color(0xff3a5a40),
//     colorButtonOption: Colors.white.withOpacity(0.3),
//     icono: Icon(Icons.food_bank),
//   ),
//   ScreenModel(
//     page: ScrollPage(
//       correo: "",
//       bgColor: Color(0xff588157),
//     ),
//     title: "Scroll Page",
//     bgColor: Color(0xff588157),
//     colorButtonOption: Colors.white.withOpacity(0.3),
//     icono: Icon(Icons.home),
//   ),
//   ScreenModel(
//     page: ListViewPage(
//       bgColor: Color(0xffa3b18a),
//       letrasList: ["Inicial 1", "Inicial 2"], // Lista inicial para letrasList
//     ),
//     title: "ListView Page",
//     bgColor: Color(0xffa3b18a),
//     colorButtonOption: Colors.white.withOpacity(0.3),
//     icono: Icon(Icons.arrow_drop_down_circle),
//   ),
// ];


List<ScreenModel> pageDetails = [
  ScreenModel(
    page: ListViewPage(
        bgColor: Color(0xffdad7cd),
        letrasList: ["Inicial 1", "Inicial 2", "Inicial 3", "Inicial 4"], // Lista inicial para letrasList    
        ),
      title: "Home Page",
      bgColor: Color(0xffdad7cd),
      colorButtonOption: Colors.white.withOpacity(0.3),
      icono: Icon(Icons.home_max),
  ),
  ScreenModel(
    page: ListViewPage(
      bgColor: Color(0xff3a5a40),
      letrasList: ["Inicial 1", "Inicial 2", "Inicial 3", "Inicial 4"], // Lista inicial para letrasList
    ),
    title: "Recetas Page",
    bgColor: Color(0xff3a5a40),
    colorButtonOption: Colors.white.withOpacity(0.3),
    icono: Icon(Icons.food_bank),
  ),
  ScreenModel(
    page: ListViewPage(
      bgColor: Color(0xff588157),
      letrasList: ["Inicial 1", "Inicial 2", "Inicial 3", "Inicial 4"], // Lista inicial para letrasList
    ),
    title: "Scroll Page",
    bgColor: Color(0xff588157),
    colorButtonOption: Colors.white.withOpacity(0.3),
    icono: Icon(Icons.home),
  ),
  ScreenModel(
    page: ListViewPage(
      bgColor: Color(0xffa3b18a),
      letrasList: ["Inicial 1", "Inicial 2", "Inicial 3", "Inicial 4"], // Lista inicial para letrasList
    ),
    title: "ListView Page",
    bgColor: Color(0xffa3b18a),
    colorButtonOption: Colors.white.withOpacity(0.3),
    icono: Icon(Icons.arrow_drop_down_circle),
  ),
];
