// import 'package:flutter/material.dart';

// class FormItemWidget extends StatelessWidget {
//   TextEditingController controller;
//   String hint;
//   IconData icon;
//   int maxLines;
//   FormItemWidget({
//     required this.controller,
//     required this.hint,
//     required this.icon,
//     this.maxLines = 1,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8),
//       child: TextField(
//         maxLines: maxLines,
//         style: TextStyle(color: Colors.white),
//         controller: controller,
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//           hintStyle: TextStyle(color: Colors.white),
//           prefixIcon: Icon(
//             icon,
//             color: Colors.white,
//           ),
//           hintText: hint,
//           filled: true,
//           fillColor: Colors.black.withOpacity(0.35),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide.none,
//             borderRadius: BorderRadius.circular(5),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide.none,
//             borderRadius: BorderRadius.circular(5),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class FormItemWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final int maxLines;
  final bool readOnly;

  const FormItemWidget({
    Key? key,
    required this.controller,
    required this.hint,
    required this.icon,
    this.maxLines = 1,
    this.readOnly = false, // Por defecto, no es de solo lectura
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        readOnly: readOnly, // Configura el modo de solo lectura
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: Icon(icon, color: Colors.white),
          filled: true,
          fillColor: Colors.black.withOpacity(0.3),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
