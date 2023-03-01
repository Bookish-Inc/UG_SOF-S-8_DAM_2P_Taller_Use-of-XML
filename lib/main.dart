import 'package:flutter/material.dart';
import 'pages/comida_page.dart';
import 'pages/planta_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'App name',
        home: Builder(
            builder: (BuildContext context) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => _navigateToFoodPage(context),
                        child: const Text('Food'),
                      ),
                      ElevatedButton(
                        onPressed: () => _navigateToPlantaPage(context),
                        child: const Text('Plant'),
                      ),
                    ],
                  ),
                )));
  }

  void _navigateToFoodPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ComidaPage()),
    );
  }

  void _navigateToPlantaPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PlantaPage()),
    );
  }
}
