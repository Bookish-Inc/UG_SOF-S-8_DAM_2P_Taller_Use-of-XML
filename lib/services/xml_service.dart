import 'package:flutter/services.dart' show rootBundle;
import 'package:xml/xml.dart';
import '../models/comida.dart';

class XmlService {
  Future<List<Food>> getFoodsFromXML() async {
    final String xmlString = await rootBundle.loadString('assets/comida.xml');
    final document = XmlDocument.parse(xmlString);
    final items = document.findAllElements('food');

    final List<Food> foods = items.map((node) {
      return Food(
        name: node.findElements('name').single.text,
        image: node.findElements('image').single.text,
        price: node.findElements('price').single.text,
        description: node.findElements('description').single.text,
        calories: node.findElements('calories').single.text,
      );
    }).toList();

    return foods;
  }
}
