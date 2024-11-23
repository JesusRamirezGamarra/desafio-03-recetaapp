import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:recetasappg10/models/screen_model.dart';

class CurveNavigationPage extends StatefulWidget {
  @override
  State<CurveNavigationPage> createState() => _CurveNavigationPageState();
}

class _CurveNavigationPageState extends State<CurveNavigationPage> {
  int _activePageIndex = 0;
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          //menu lateral a la izquierda
          child: ListView(
            children: [
              DrawerHeader(
                margin: EdgeInsets.all(0),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(32),
                  child: FlutterLogo(
                      // size: 20,
                      ),
                ),
                decoration: BoxDecoration(color: Colors.black),
              ),
              //opciones del menu lateral
              // ListTile(
              //   leading: Icon(Icons.home),
              //   title: Text("Home"),
              //   onTap: () {},
              // )

              ...pageDetails
                  .map(
                    (e) => ListTile(
                      leading: e.icono,
                      title: Text(e.title),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => e.page),
                        );
                      },
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
        // endDrawer: Drawer(), //menu lateral a la derecha
        appBar: AppBar(
          title: Text(
            pageDetails[_activePageIndex].title,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: pageDetails[_activePageIndex].bgColor,
          elevation: 10,
        ),
        bottomNavigationBar: CurvedNavigationBar(
          items: [
            ...pageDetails.map((e) => e.icono).toList(),
          ],
          index: _activePageIndex, //setea donde va a inciar el page
          // height: 10,//altura del menu
          color: Color(0xffccd5ae), //color de fondo de la barra
          buttonBackgroundColor:
              pageDetails[_activePageIndex].colorButtonOption, //Color del botón
          backgroundColor: pageDetails[_activePageIndex]
              .bgColor, //Color de fondo (debe ser similar a la pantalla que va a mostrar)
          onTap: (index) {
            pageController.animateToPage(
              index,
              duration: Duration(seconds: 1),
              curve: Curves.decelerate,
            );
            // _activePageIndex = index;
            setState(() {});
          },
        ),
        body: PageView(
          controller: pageController,
          onPageChanged: (index) {
            _activePageIndex = index;
            setState(() {});
          },
          children: [
            ...pageDetails.map((e) => e.page).toList(),
          ],
          // child: pageDetails[_activePageIndex].page
        ),
      ),
    );
  }
}
