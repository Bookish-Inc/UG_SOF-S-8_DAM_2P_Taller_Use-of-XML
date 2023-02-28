import 'package:flutter/material.dart';
import 'models/comida.dart';

class BreakfastMenuCard extends StatelessWidget {
  final List<Food>? foods;

  const BreakfastMenuCard({required this.foods});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Breakfast Menu',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: foods?.length,
            itemBuilder: (context, index) {
              final food = foods?[index];
              return ListTile(
                title: Text(food!.name),
                subtitle: Text('${food.description} - ${food.calories} calories'),
                trailing: Text(food.price),
              );
            },
          ),
        ],
      ),
    );
  }
}
