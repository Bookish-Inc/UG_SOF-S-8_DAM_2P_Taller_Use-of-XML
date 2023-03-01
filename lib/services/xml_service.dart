import 'package:flutter/services.dart' show rootBundle;
import 'package:xml/xml.dart';
import '../models/comida.dart';
import '../models/planta.dart';
import '../models/receta.dart';

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

  Future<List<Planta>> getPlantsFromXML() async {
    final String xmlString = await rootBundle.loadString('assets/Planta.xml');
    final document = XmlDocument.parse(xmlString);
    final items = document.findAllElements('PLANT');

    final List<Planta> plants = items.map((node) {
      return Planta(
        common: node.findElements('COMMON').single.text,
        botanical: node.findElements('BOTANICAL').single.text,
        zone: node.findElements('ZONE').single.text,
        light: node.findElements('LIGHT').single.text,
        price: double.parse(node.findElements('PRICE').single.text),
        availability: node.findElements('AVAILABILITY').single.text,
        image: node.findElements('IMAGE').single.text,
      );
    }).toList();

    return plants;
  }

  Future<List<Receta>> getRecetaFromXML() async {
    final String xmlString = await rootBundle.loadString('assets/receta.xml');
    final document = XmlDocument.parse(xmlString);
    final recetas = document.findAllElements('receta');
    final parsedRecetas = <Receta>[];

    for (final receta in recetas) {
      final tipo = receta
          .findElements('tipo')
          .single
          .getAttribute('definicion')
          .toString();
      final dificultad = receta.findElements('dificultad').single.text;
      final nombre = receta.findElements('nombre').single.text;
      final ingredientes =
          receta.findElements('ingrediente').map((ingrediente) {
        final nombre = ingrediente.getAttribute('nombre').toString();
        final cantidad = ingrediente.getAttribute('cantidad').toString();
        return Ingrediente(nombre: nombre, cantidad: cantidad);
      }).toList();
      final calorias = int.parse(receta.findElements('calorias').single.text);
      final pasos = receta.findElements('paso').map((paso) {
        final orden = int.parse(paso.getAttribute('orden').toString());
        final descripcion = paso.text;
        return Paso(orden: orden, descripcion: descripcion);
      }).toList();
      final tiempo = receta.findElements('tiempo').single.text;
      final elaboracion = receta.findElements('elaboracion').single.text;
      final imagenUrl = receta.findElements('imagen').single.text;

      final parsedReceta = Receta(
        tipo: tipo,
        dificultad: dificultad,
        nombre: nombre,
        ingredientes: ingredientes,
        calorias: calorias,
        pasos: pasos,
        tiempo: tiempo,
        elaboracion: elaboracion,
        image: imagenUrl,
      );

      parsedRecetas.add(parsedReceta);
    }

    return parsedRecetas;
  }
}
