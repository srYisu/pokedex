import 'package:flutter/material.dart';
Widget buildStatBar({
  required String stats,
  required IconData icon,
  required int value,
  required Color color,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
    child: Row(
      children: [
        // Icono + etiqueta
        SizedBox(
          width: 60, // espacio fijo para ícono y label
          child: Row(
            children: [
              Text(stats,style: TextStyle(color: Colors.white70, fontSize: 14),),
              SizedBox(width: 4),
              Icon(icon, color: Colors.white70, size: 18),
            ],
          ),
        ),
        SizedBox(width: 10),

        // Barra con número centrado
        Expanded(
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(
                  value: value / 150,
                  minHeight: 20,
                  backgroundColor: Colors.white24,
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                ),
              ),
              Positioned.fill(
                child: Center(
                  child: Text(
                    "$value / 150",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          offset: Offset(0.5, 0.5),
                          blurRadius: 2,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}