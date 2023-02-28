import 'package:flutter/material.dart';
import '../models/comida.dart';
import '../services/xml_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Food> _foods;

  @override
  void initState() {
    super.initState();
    _loadXML();
  }

  Future<void> _loadXML() async {
    final XmlService xmlService = XmlService();
    final List<Food> foods = await xmlService.getFoodsFromXML();

    setState(() {
      _foods = foods;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_foods == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('XML ListView Demo'),
        ),
        body: ListView.builder(
          itemCount: _foods.length,
          itemBuilder: (BuildContext context, int index) {
            final Food food = _foods[index];
            return Card(
              child: Column(
                children: <Widget>[
                  Image.network(
                    food.image,
                    fit: BoxFit.fitWidth,
                  ),
                  ListTile(
                    title: Text(food.name),
                    subtitle: Text(food.description),
                    trailing: Text(food.price),
                  ),
                ],
              ),
            );
          },
        ),
      );
    }
  }
}
