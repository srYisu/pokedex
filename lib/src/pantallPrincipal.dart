import 'package:flutter/material.dart';
import 'package:pokedex/src/listaPokemones.dart';
import 'package:pokedex/src/pokemonCard.dart';
import 'package:pokedex/src/tipoColores.dart'; 

class MainApp extends StatelessWidget {
  final List<pokemon> pokemons;

  const MainApp({super.key, required this.pokemons});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 34, 32, 32),
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Row(
            children: [
              Text(
                "Pokedex",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 15),
              Transform.rotate(angle: 3.14, child: Image.asset("assets/images/pokeballWhite2.png", height: 25,),)
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: GridView.builder(
            itemCount: pokemons.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,         // ← 2 columnas
              mainAxisSpacing: 5,
              crossAxisSpacing: 3,
              childAspectRatio: 0.98,
            ),
            itemBuilder: (context, index) {
              final p = pokemons[index];
              final tipoP = p.type.first;
              final color = tipoColores[tipoP.toLowerCase()] ?? Colors.grey;

              return Pokemoncard(
                index: index,
                numero: p.n,
                pokemonName: p.name,
                pokemonImage: p.imagen,
                colorPokemon: color,
              );
            },
          ),
        ),
      ),
    );
  }
}