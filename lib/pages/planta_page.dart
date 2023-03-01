import 'package:flutter/material.dart';
import 'package:lectura_xml/models/planta.dart';
import '/services/xml_service.dart';

class PlantaPage extends StatefulWidget {
  @override
  _PlantaPageState createState() => _PlantaPageState();
}

class _PlantaPageState extends State<PlantaPage> {
  late List<Planta> _plants;

  @override
  void initState() {
    super.initState();
    _loadXML();
  }

  Future<void> _loadXML() async {
    final XmlService xmlService = XmlService();
    final List<Planta> plants = await xmlService.getPlantsFromXML();

    setState(() {
      _plants = plants;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_plants == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('XML Planta'),
        ),
        body: ListView.builder(
          itemCount: _plants.length,
          itemBuilder: (BuildContext context, int index) {
            final Planta plant = _plants[index];
            return Card(
              child: Row(
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Image.network(
                      plant.image ?? '',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: ListTile(
                      title: Text(plant.common),
                      subtitle: Text(plant.botanical),
                      trailing: Text(plant.price.toString()),
                    ),
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
