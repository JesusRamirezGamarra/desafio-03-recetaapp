import 'package:flutter/material.dart';
import 'package:recetasappg10/pages/home_page.dart';
import 'package:recetasappg10/widgets_pages/scroll_page.dart';

class TextfieldPage extends StatelessWidget {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _contrasenaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Field Page"),
      ),
      body: Center(
        //TEXTFIELD: Básico para capturar textos
        //Fácil de usar y configurar, se usa donde no se necesita validación ni manejo de estados
        // TextField(
        //   decoration: InputDecoration(labelText: "Nombre"),
        // ),
        //TEXTFORMFIELD
        //Versión mejorada del TextField, se integra con un widget llamado Form, permite la validación y manejor de estados, se puede usasr la propiedad validator para verificar entradas
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: "Ingresa tu correo",
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor ingresa tu correo"; //la validación tuvo un error
                    } else if (value.length < 7) {
                      return "debe tener al menos 6 caracteres";
                    } else if (!RegExp(r'^[\w\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return "Ingrese un correo válido";
                    } else {
                      return null; //la validación fue exitosa
                    }
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _contrasenaController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Ingresa una contraseña";
                    } else if (value.length < 8) {
                      return "La contraseña debe tener al menor 8 caracateres";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Ingresa tu Contraseña",
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                ElevatedButton(
                  onPressed: () async {
                    //validar form
                    if (_formKey.currentState!.validate()) {
                      print(_formKey.currentState!.validate());
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(
                      //     content: Text("Formulario validado"),
                      //     backgroundColor: Colors.green,
                      //   ),
                      // );

                      // NAVEGACIÓN ENTRE PANTALLAS CON NAVIGATOR DE MANERA NORMAL
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScrollPage(
                            correo: _emailController.text,
                            bgColor: Colors.white,
                          ),
                        ),
                      );

                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(result)));

                      // NAVEGACIÓN ENTRE PANTALLAS CON RUTAS NOMBRADAS
                      // Navigator.pushNamed(context, "/third");
                    }
                  },
                  child: Text("Enviar form"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
