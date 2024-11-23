// import 'package:flutter/material.dart';

// class ListViewPage extends StatefulWidget {
//   final Color bgColor;
//   final List<String> letrasList; // Lista dinámica de datos

//   ListViewPage({required this.bgColor, required this.letrasList});

//   @override
//   State<ListViewPage> createState() => _ListViewPageState();
// }

// class _ListViewPageState extends State<ListViewPage> {
//   Widget buildContainers(String text) {
//     return Container(
//       height: 50,
//       width: 200,
//       color: Colors.red,
//       margin: const EdgeInsets.all(16),
//       child: Center(
//         child: Text(
//           text,
//           style: const TextStyle(color: Colors.white),
//         ),
//       ),
//     );
//   }

//   void _addNewItem(String newItem) {
//     setState(() {
//       widget.letrasList.add(newItem); // Agregar nuevo elemento
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: widget.bgColor,
//       body: ListView.builder(
//         itemCount: widget.letrasList.length,
//         itemBuilder: (BuildContext context, int index) {
//           return buildContainers(widget.letrasList[index]);
//         },
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:recetasappg10/pages/recipes_page.dart'; 
class ListViewPage extends StatefulWidget {
  final Color bgColor;
  final List<String> letrasList; // Lista dinámica de datos

  ListViewPage({required this.bgColor, required this.letrasList});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  Widget buildContainers(String text, int index) {
    return GestureDetector(
      onTap: () async {
        final String? updatedTitle = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipesPage(
              bgColor: widget.bgColor,
              initialTitle: widget.letrasList[index], // Enviar título actual
            ),
          ),
        );
        if (updatedTitle != null) {
          setState(() {
            widget.letrasList[index] = updatedTitle; // Actualizar la lista
          });
        }
      },
      child: Container(
        height: 50,
        width: 200,
        color: Colors.red,
        margin: const EdgeInsets.all(16),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.bgColor,
      body: ListView.builder(
        itemCount: widget.letrasList.length,
        itemBuilder: (BuildContext context, int index) {
          return buildContainers(widget.letrasList[index], index);
        },
      ),
    );
  }
}
