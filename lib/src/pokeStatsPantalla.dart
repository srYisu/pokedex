import 'package:flutter/material.dart';
import 'package:pokedex/src/listaPokemones.dart';
import 'package:pokedex/src/tipoColores.dart';
import 'package:pokedex/src/tiposIcons.dart'; 
import 'package:pokedex/src/buildStatBar.dart';



class Pokestatspantalla extends StatefulWidget {
  final int index;
  final List<pokemon> pokemons;
  const Pokestatspantalla({super.key, required this.index, required this.pokemons});

  @override
  State<Pokestatspantalla> createState() => _PokestatspantallaState();
}

class _PokestatspantallaState extends State<Pokestatspantalla> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  @override
  void initState() {
      super.initState();
      _controller = AnimationController(
        duration: Duration(seconds: 35), // velocidad de rotación
        vsync: this,
      )..repeat(); // hace que gire constantemente
    }

  @override
  void dispose() {
    _controller.dispose(); // limpia al cerrar
    super.dispose();
  }


  Widget build(BuildContext context) {
    final p = widget.pokemons[widget.index];
    final tipoP = p.type.first;
    final color = tipoColores[tipoP.toLowerCase()] ?? Colors.grey;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 34, 32, 32),
      appBar: AppBar(backgroundColor: color,iconTheme: IconThemeData(color: Colors.white),
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text("Pokedex", style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),
        ),
        actions: [
          Padding(padding: EdgeInsets.only(right: 20),
          child: Center(child: Text(p.n,style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),),)
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                      height: 235, width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomRight: Radius.circular(50), bottomLeft: Radius.circular(50)), color: color ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          AnimatedBuilder(animation: _controller, builder: (_, child){
                            return Transform.rotate(angle: _controller.value * 2 * 3.1416,
                            child: Opacity(
                            opacity: 0.5,
                            child: Transform.rotate(angle: 0.45,
                            child: Image.asset("assets/images/pokeballWhite2.png", width: 220, height: 220, fit: BoxFit.contain,),
                            )
                          ),
                            );
                          }),
                          Image.asset(p.imagen, height: 130,)
                        ],
                      )
                  )
              ],
            ),
            SizedBox(height: 15),
            Text(p.name, style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500, color: Colors.white)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: p.type.map((tipo) {
                final c =tipoColores[tipo.toLowerCase()] ?? Colors.grey;
                final ic = tipoIconos[tipo.toLowerCase()] ?? 'assets/icons/normal.png';
              return Padding(
                padding:  EdgeInsets.symmetric(horizontal: 5),
                  child: SizedBox(
                    height: 40, width: 120,
                    child: Card(
                      color: c, 
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(ic, width: 20, height: 20,),
                          SizedBox(width: 2,),
                          Text(tipo.toUpperCase(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                        ],
                      )
                    ),
                  )
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20,),
                    Text(p.weight, style: TextStyle(color: Colors.white, fontSize: 25),),
                    Text("Weight", style: TextStyle(color: const Color.fromARGB(255, 105, 105, 105), fontSize: 15))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20,),
                    Text(p.height, style: TextStyle(color: Colors.white, fontSize: 25),),
                    Text("Height", style: TextStyle(color: const Color.fromARGB(255, 105, 105, 105), fontSize: 15,))
                  ],
                )
              ],
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20,),
                  Text("Base Stats", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400, color: Colors.white)),
                  SizedBox(height: 5,),
                  buildStatBar(
                    stats: "HP",
                    icon: Icons.favorite,
                    value: p.hp,
                  color: Colors.red,
                  ),
                  SizedBox(height: 10,),
                  buildStatBar(
                    stats: "ATK",
                    icon: Icons.sports_martial_arts,
                    value: p.atk,
                    color: Colors.orange,
                  ),
                  SizedBox(height: 10,),
                  buildStatBar(
                    stats: "DEF",
                    icon: Icons.shield,
                    value: p.def,
                    color: Colors.lightBlueAccent,
                  ),
                  SizedBox(height: 10,),
                  buildStatBar(
                    stats: "SPD",
                    icon: Icons.accessible_forward,
                    value: p.spd,
                    color: const Color.fromARGB(255, 152, 206, 231),
                  ),
                  SizedBox(height: 10,),
                  buildStatBar(
                    stats: "EXP",
                    icon: Icons.elderly_woman,
                    value: p.exp,
                    color: Colors.greenAccent,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}