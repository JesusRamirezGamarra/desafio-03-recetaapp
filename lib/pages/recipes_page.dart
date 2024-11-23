import 'package:flutter/material.dart';
import 'package:recetasappg10/models/receta_model.dart';
import 'package:recetasappg10/pages/recipes_preview_page.dart';
import 'package:recetasappg10/widgets/drop_down_widget.dart';
import 'package:recetasappg10/widgets/form_item_widget.dart';
import 'package:recetasappg10/widgets/porciones_check_widget.dart';

class RecipesPage extends StatefulWidget {
  final Color bgColor;
  final String? initialTitle; // Agregar parámetro para el título inicial

  RecipesPage({required this.bgColor, this.initialTitle});

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _preparationController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();
  final List<String> _options = ["Entrada", "Plato de fondo", "Postre"];

  String? _selectedOption;
  bool _conPapa = false;
  bool _conCamote = false;

  @override
  void initState() {
    super.initState();
    // Asignar el título inicial al controlador si se proporciona
    if (widget.initialTitle != null) {
      _titleController.text = widget.initialTitle!;
    }
  }

  void _guardarReceta() {
    String title = _titleController.text.trim();
    String preparation = _preparationController.text.trim();
    String url = _urlController.text.trim();

    if (title.isEmpty || title.length < 5) {
      showError(context, 'El título debe tener al menos 5 caracteres.');
      return;
    }
    if (preparation.isEmpty || preparation.length < 20) {
      showError(context, 'La preparación debe tener al menos 20 caracteres.');
      return;
    }
    if (url.isEmpty || url.length < 10) {
      showError(context, 'La URL debe tener al menos 10 caracteres.');
      return;
    }
    if (_selectedOption == null) {
      showError(context, "Seleccione el tipo de plato");
      return;
    }

    RecetaModel receta = RecetaModel(
      title: title,
      recipe: preparation,
      urlImage: url,
      type: _selectedOption!,
      withPapa: _conPapa,
      withCamote: _conCamote,
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecipesPreviewPage(
          receta: receta,
          onSave: () {
            // Ejemplo de acción al guardar
            print("Receta guardada: ${receta.title}");
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  void showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Formulario de Receta',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        backgroundColor: widget.bgColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormItemWidget(
                controller: _titleController,
                hint: "Ingresa el título",
                icon: Icons.title,
              ),
              FormItemWidget(
                controller: _preparationController,
                hint: "Ingresa la preparación",
                icon: Icons.list,
                maxLines: 3,
              ),
              FormItemWidget(
                controller: _urlController,
                hint: "Ingresa la URL de la imagen",
                icon: Icons.image,
              ),
              DropDownWidget(
                options: _options,
                funcionOnChanged: (value) {
                  setState(() {
                    _selectedOption = value;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  PorcionesCheckWidget(
                    title: "Con Papa",
                    value: _conPapa,
                    onChanged: (value) {
                      setState(() {
                        _conPapa = value ?? false;
                      });
                    },
                  ),
                  PorcionesCheckWidget(
                    title: "Con Camote",
                    value: _conCamote,
                    onChanged: (value) {
                      setState(() {
                        _conCamote = value ?? false;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: _guardarReceta,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black.withOpacity(0.5),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 32.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('GUARDAR'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
