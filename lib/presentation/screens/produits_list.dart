import 'package:flutter/material.dart';
import 'package:product_app/data/models/product.dart';
import '../widgets/produit_box.dart'; // Import your ProduitBox widget

class ProduitsList extends StatefulWidget {
  @override
  _ProduitsListState createState() => _ProduitsListState();
}

class _ProduitsListState extends State<ProduitsList> {
  // Declare a list of products
  final List<Product> produits = [
    Product(name: 'Produit 1' ),
    Product(name: 'Produit 2'),
    Product(name: 'Produit 3'),
  ];

  void _toggleSelection(Product produit) {
    setState(() {
      produit.selected = !produit.selected; // Change selection state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Produits'),
      ),
      body: ListView(
        children: _buildProduits(),
      ),
    );
  }

  List<Widget> _buildProduits() {
    return produits.map((produit) {
      return GestureDetector(
        onTap: () => _toggleSelection(produit),
        child: ProduitBox(
          nomProduit: produit.name,
          selected: produit.selected,
        ),
      );
    }).toList();
  }
}
