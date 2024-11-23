// import 'package:flutter/material.dart';

// class PorcionesCheckWidget extends StatelessWidget {
//   String title;
//   bool value;
//   Function(bool?) onChanged;

//   PorcionesCheckWidget({
//     required this.title,
//     required this.value,
//     required this.onChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width / 3 + 25,
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey, width: 1.5), // Borde blanco
//           borderRadius: BorderRadius.circular(10), // Radio del borde
//         ),
//         child: CheckboxListTile(
//           title: Text(
//             title,
//             style: TextStyle(color: Colors.white, fontSize: 13),
//           ),
//           value: value,
//           onChanged: onChanged,
//           // Personalización del CheckboxListTile
//           activeColor: Colors.green,
//           checkColor: Colors.white,
//           tileColor: Colors.black.withOpacity(0.35),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10), // Radio del CheckboxListTile
//           ),
//           hoverColor: Colors.white,
//           selectedTileColor: Colors.blue,
//           checkboxShape: RoundedRectangleBorder(),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class PorcionesCheckWidget extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool?)? onChanged;
  final bool readOnly;

  PorcionesCheckWidget({
    required this.title,
    required this.value,
    this.onChanged,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3 + 25,
      child: CheckboxListTile(
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 13),
        ),
        value: value,
        onChanged: readOnly ? null : onChanged, // Bloquea cambios si está en modo solo lectura
        activeColor: Colors.green,
        checkColor: Colors.white,
        tileColor: Colors.black.withOpacity(0.35),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
