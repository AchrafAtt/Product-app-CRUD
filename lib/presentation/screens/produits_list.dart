import 'package:flutter/material.dart';
import 'package:product_app/data/models/product.dart';
import '../widgets/produit_box.dart';
import '../widgets/addProduit.dart';

class ProduitsList extends StatefulWidget {
  @override
  _ProduitsListState createState() => _ProduitsListState();
}

class _ProduitsListState extends State<ProduitsList> {
  final List<Product> produits = [
    Product(name: 'Produit 1', selected: false),
    Product(name: 'Produit 2', selected: false),
    Product(name: 'Produit 3', selected: false),
  ];

  final TextEditingController _productController = TextEditingController();

  void _toggleSelection(int index, bool? value) {
    setState(() {
      produits[index].selected = value ?? false;
    });
  }

  void _deleteProduct(BuildContext context, int index) {
    setState(() {
      produits.removeAt(index);
    });

    // Show a Snackbar notification for better UX
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Produit supprimé')),
    );
  }

  void _addProduct(String productName) {
    setState(() {
      produits.add(Product(name: productName, selected: false));
    });
  }

  void _showAddProductDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AddProduit(
          nomController: _productController,
          onAdd: () {
            if (_productController.text.isNotEmpty) {
              _addProduct(_productController.text);
              _productController.clear();
              Navigator.of(context).pop(); // Close the dialog
            }
          },
          onCancel: () {
            _productController.clear();
            Navigator.of(context).pop(); // Close the dialog
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des Produits'),
      ),
      body: ListView(
        children: _buildProduits(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddProductDialog,
        child: const Icon(Icons.add),
        tooltip: 'Ajouter un produit',
      ),
    );
  }

  List<Widget> _buildProduits() {
    return List.generate(produits.length, (index) {
      final produit = produits[index];
      return ProduitBox(
        nomProduit: produit.name,
        selected: produit.selected,
        toggleSelection: (value) => _toggleSelection(index, value),
        delProduit: (context) => _deleteProduct(context, index),
      );
    });
  }
}
