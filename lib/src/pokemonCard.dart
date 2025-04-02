import 'package:flutter/material.dart';
import 'package:pokedex/src/pokeStatsPantalla.dart';
import 'package:pokedex/src/listaPokemones.dart';

class Pokemoncard extends StatefulWidget {
  final String pokemonName;
  final Color colorPokemon;
  final String pokemonImage;
  final String numero;
  final int index;
  const Pokemoncard({super.key, required this.pokemonName, required this.colorPokemon, required this.pokemonImage, required this.numero, required this.index});

  @override
  State<Pokemoncard> createState() => _PokemoncardState();
}

class _PokemoncardState extends State<Pokemoncard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, 
        MaterialPageRoute(builder: 
        (context) =>  Pokestatspantalla(index: widget.index, pokemons: pokimonesLista)
        )
        );
      },
      child: Card(
        color: widget.colorPokemon,
        child: Column(
          children: [
              Padding(padding: const EdgeInsets.only(right: 8),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(widget.numero,style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),),
                ),
              ),
              SizedBox(height: 10,),
              Image.asset(widget.pokemonImage, height: 100,),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Text(widget.pokemonName,style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),),
                    SizedBox(width: 180, height: 2,),
                  ],
                ),
              )  
          ],
        ),
      ),
    );
  }
}