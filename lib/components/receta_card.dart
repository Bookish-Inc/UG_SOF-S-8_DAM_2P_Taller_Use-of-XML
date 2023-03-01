import 'package:flutter/material.dart';
import 'package:lectura_xml/models/receta.dart';

class RecetaCard extends StatelessWidget {
  final Receta receta;

  RecetaCard({required this.receta});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(receta.image),
          ListTile(
            title: Text(receta.nombre),
            subtitle: Text('Dificultad: ${receta.dificultad}'),
          ),
          ButtonBar(
            children: [
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement navigation to recipe details page
                },
                child: const Text('Ver Detalles'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
