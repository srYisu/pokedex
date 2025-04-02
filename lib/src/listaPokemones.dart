
class pokemon {
  final String n;
  final String name;
  final String imagen;
  final List<String> type;
  final int hp;
  final int atk;
  final int def;
  final int spd;
  final int exp;
  final String weight;
  final String height;

  pokemon({
    required this.n,
    required this.name,
    required this.imagen,
    required this.type,
    required this.hp,
    required this.atk,
    required this.def,
    required this.spd,
    required this.exp,
    required this.weight,
    required this.height,
  });

}
  List<pokemon> pokimonesLista =[
    pokemon(
      n: "#0129",
      name: "Magikarp", 
      imagen: "assets/images/Magikarp.png",
      type: ["water"], 
      hp: 20, 
      atk: 10, 
      def: 55, 
      spd: 80, 
      exp: 40,
      weight: "20 KG",
      height: "0.9 M"
      ),

      pokemon(
      n: "#0001",
      name: "Bulbasaur", 
      imagen: "assets/images/bulbasaur.png",
      type: ["grass","poison"], 
      hp: 45, 
      atk: 49, 
      def: 49, 
      spd: 45, 
      exp: 10,
      weight: "6.9 KG",
      height: "0.7 M"
      ),

      pokemon(
      n: "#0162",
      name: "Furret", 
      imagen: "assets/images/furretG.png",
      type: ["normal"], 
      hp: 85, 
      atk: 76, 
      def: 64, 
      spd: 90, 
      exp: 12,
      weight: "32.5 KG",
      height: "1.8 M"
      ),

      pokemon(
      n: "#0080",
      name: "Slowbro", 
      imagen: "assets/images/slowbro.png",
      type: ["water","psychic"], 
      hp: 95, 
      atk: 75, 
      def: 110, 
      spd: 30, 
      exp: 69,
      weight: "78.5 KG",
      height: "1.6 M"
      ),

      pokemon(
      n: "#0133",
      name: "Evee", 
      imagen: "assets/images/evee.png",
      type: ["normal"], 
      hp: 55, 
      atk: 55, 
      def: 50, 
      spd: 55, 
      exp: 63,
      weight: "6.5 KG",
      height: "0.3 M"
      ),

      pokemon(
      n: "#0149",
      name: "Dragonite", 
      imagen: "assets/images/dragonite.png",
      type: ["dragon", "flying"], 
      hp: 91, 
      atk: 134, 
      def: 95, 
      spd: 80, 
      exp: 100,
      weight: "210 KG",
      height: "2.2 M"
      ),
      
      pokemon(
      n: "#0129",
      name: "Magikarp GOD", 
      imagen: "assets/images/Magikarp.png",
      type: ["water"], 
      hp: 145, 
      atk: 149, 
      def: 130, 
      spd: 127, 
      exp: 150,
      weight: "20 KG",
      height: "0.9 M"
      ),
  ];