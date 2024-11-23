// import 'package:flutter/material.dart';

// class DropDownWidget extends StatelessWidget {
//   final List<String> options;
//   final Function(String?) funcionOnChanged;

//   const DropDownWidget({
//     super.key,
//     required this.options,
//     required this.funcionOnChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 4, bottom: 8),
//       child: SizedBox(
//         width: 4000, // Ancho personalizado del Dropdown
//         child: DropdownButtonFormField(
//           items: options.map((option) {
//             return DropdownMenuItem(
//               value: option,
//               child: Text(option),
//             );
//           }).toList(),
//           onChanged: funcionOnChanged,
//           // DECORACIÓN
//           decoration: InputDecoration(
//             labelText: "Selecciona el tipo de plato",
//             labelStyle: const TextStyle(color: Colors.white),
//             filled: true,
//             fillColor: Colors.black.withOpacity(0.35),
//             border: OutlineInputBorder(
//               borderSide: const BorderSide(color: Colors.grey, width: 1.5), // Contorno gris
//               borderRadius: BorderRadius.circular(10), // Esquinas redondeadas
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderSide: const BorderSide(color: Colors.grey, width: 1.5), // Contorno gris
//               borderRadius: BorderRadius.circular(10), // Esquinas redondeadas
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderSide: const BorderSide(color: Colors.white, width: 2.0), // Contorno blanco al enfocarse
//               borderRadius: BorderRadius.circular(10), // Esquinas redondeadas
//             ),
//           ),
//           dropdownColor: Colors.black,
//           style: const TextStyle(color: Colors.white),
//           icon: const Icon(Icons.arrow_drop_down_circle),
//           menuMaxHeight: 180,
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class DropDownWidget extends StatelessWidget {
  final List<String> options;
  final Function(String?)? funcionOnChanged;
  final String? selectedValue;
  final bool readOnly;

  const DropDownWidget({
    Key? key,
    required this.options,
    this.funcionOnChanged,
    this.selectedValue,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 8),
      child: DropdownButtonFormField<String>(
        value: selectedValue,
        items: options.map((option) {
          return DropdownMenuItem(
            value: option,
            child: Text(option, style: const TextStyle(color: Colors.white)),
          );
        }).toList(),
        onChanged: readOnly ? null : funcionOnChanged, // Deshabilitar si es solo lectura
        decoration: InputDecoration(
          labelText: "Selecciona el tipo de plato",
          labelStyle: const TextStyle(color: Colors.white),
          filled: true,
          fillColor: Colors.black.withOpacity(0.35),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 1.5),
            borderRadius: BorderRadius.circular(5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 1.5),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        dropdownColor: Colors.black,
        iconEnabledColor: Colors.white,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
