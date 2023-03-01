import 'package:flutter/material.dart';
import '../models/planta.dart';

class PlantCard extends StatelessWidget {
  final List<Planta>? plants;

  const PlantCard({required this.plants});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Plants',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: plants?.length,
            itemBuilder: (context, index) {
              final plant = plants?[index];
              return ListTile(
                title: Text(plant!.common),
                subtitle: Text('${plant.botanical} - Zone ${plant.zone}'),
                trailing: Text('\$${plant.price}'),
              );
            },
          ),
        ],
      ),
    );
  }
}
