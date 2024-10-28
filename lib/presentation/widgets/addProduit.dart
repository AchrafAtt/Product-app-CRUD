import 'package:flutter/material.dart';

class AddProduit extends StatelessWidget {
  final TextEditingController nomController;
  final VoidCallback onAdd;
  final VoidCallback onCancel;

  const AddProduit({
    Key? key,
    required this.nomController,
    required this.onAdd,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Ajouter un produit"),
      content: SizedBox(
        height: 128,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nomController,
              decoration: const InputDecoration(
                labelText: 'Nom du produit',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  onPressed: onAdd,
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: const Text('Add'),
                ),
                const SizedBox(width: 8),
                MaterialButton(
                  onPressed: onCancel,
                  color: Colors.grey,
                  textColor: Colors.white,
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
