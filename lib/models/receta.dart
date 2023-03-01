import 'package:flutter/material.dart';

class Receta {
  final String tipo;
  final String dificultad;
  final String nombre;
  final List<Ingrediente> ingredientes;
  final int calorias;
  final List<Paso> pasos;
  final String tiempo;
  final String elaboracion;
  final String image;

  Receta({
    required this.tipo,
    required this.dificultad,
    required this.nombre,
    required this.ingredientes,
    required this.calorias,
    required this.pasos,
    required this.tiempo,
    required this.elaboracion,
    required this.image,
  });
}

class Ingrediente {
  final String nombre;
  final String cantidad;

  Ingrediente({required this.nombre, required this.cantidad});
}

class Paso {
  final int orden;
  final String descripcion;

  Paso({required this.orden, required this.descripcion});
}
