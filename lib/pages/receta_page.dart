import 'package:flutter/material.dart';
import 'package:lectura_xml/models/receta.dart';
import '../components/receta_card.dart';
import '/services/xml_service.dart';

class RecetaPage extends StatefulWidget {
  @override
  _RecetaPageState createState() => _RecetaPageState();
}

class _RecetaPageState extends State<RecetaPage> {
  late List<Receta> _recetas;

  @override
  void initState() {
    super.initState();
    _loadXML();
  }

  Future<void> _loadXML() async {
    final XmlService xmlService = XmlService();
    final List<Receta> recetas = await xmlService.getRecetaFromXML();

    setState(() {
      _recetas = recetas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _recetas.length,
      itemBuilder: (BuildContext context, int index) {
        return RecetaCard(receta: _recetas[index]);
      },
    );
  }
}
