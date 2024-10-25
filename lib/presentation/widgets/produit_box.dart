import 'package:flutter/material.dart';

class ProduitBox extends StatelessWidget {
  final String nomProduit;
  final bool selected; // New attribute to track selection state

  const ProduitBox({super.key, required this.nomProduit, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: selected ? Colors.green : Colors.blueAccent),
        borderRadius: BorderRadius.circular(8),
        color: selected ? Colors.lightGreen[100] : Colors.transparent, // Highlight if selected
      ),
      child: Center(
        child: Text(
          nomProduit,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}