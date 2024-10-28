import 'package:flutter/material.dart';
import 'presentation/widgets/produit_box.dart';
import 'presentation/screens/produits_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Produits App',
      home: HomeScreen(), // Change to HomeScreen
    );
  }
}

// Create a HomeScreen widget to include AppBar and body
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produits List'),
        backgroundColor: Colors .amber,
      ),
      body:  ProduitsList(), // Your ProduitBox widget goes here
    );
  }
}
