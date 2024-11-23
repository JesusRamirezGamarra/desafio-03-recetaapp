import 'package:flutter/material.dart';
import 'package:recetasappg10/widgets_pages/list_view_page.dart';

class HomePage extends StatelessWidget {
  final Color bgColor; // Agregado 'final' para hacer la variable inmutable
  HomePage({required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListViewPage(
                      bgColor: Colors.white,
                      letrasList: ["Menu 1", "Menu2", "Menu3", "Menu4"], // Lista inicial
                    ),
                  ),
                );
              },
              child: Text("Ir a otra pantalla"),
            ),
          ],
        ),
      ),
    );
  }
}
