import 'package:flutter/material.dart';
import 'package:pokedex/src/pantallPrincipal.dart';
import 'package:pokedex/src/listaPokemones.dart';

void main() {
  runApp(MaterialApp(
    home: MainApp(pokemons: pokimonesLista,),
    debugShowCheckedModeBanner: false,
  ));
}