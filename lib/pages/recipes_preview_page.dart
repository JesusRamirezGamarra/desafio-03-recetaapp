import 'package:flutter/material.dart';
import 'package:recetasappg10/models/receta_model.dart';
import 'package:recetasappg10/widgets/drop_down_widget.dart';
import 'package:recetasappg10/widgets/porciones_check_widget.dart';

class RecipesPreviewPage extends StatelessWidget {
  final RecetaModel receta;
  final VoidCallback onSave;

  const RecipesPreviewPage({Key? key, required this.receta, required this.onSave})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Vista previa de receta",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        backgroundColor: Colors.grey[900],
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  receta.urlImage,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                receta.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Container(
                constraints: const BoxConstraints(minHeight: 200, maxHeight: 200),
                child: SingleChildScrollView(
                  child: Text(
                    receta.recipe,
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              DropDownWidget(
                options: [receta.type],
                selectedValue: receta.type,
                readOnly: true,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  PorcionesCheckWidget(
                    title: "Con Papa",
                    value: receta.withPapa,
                    onChanged: null,
                  ),
                  PorcionesCheckWidget(
                    title: "Con Camote",
                    value: receta.withCamote,
                    onChanged: null,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Center(
                child: SizedBox(
                  width: 180,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black.withOpacity(0.5),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      onSave(); // Ejecutar la acción de guardado
                      Navigator.pop(context, receta.title); // Devolver el título guardado
                    },
                    child: const Text('GUARDAR'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
