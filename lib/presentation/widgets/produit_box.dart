import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProduitBox extends StatelessWidget {
  final String nomProduit;
  final bool selected;
  final ValueChanged<bool?>? toggleSelection;
  final Function(BuildContext context)? delProduit;

  const ProduitBox({
    Key? key,
    required this.nomProduit,
    this.selected = false,
    this.toggleSelection,
    this.delProduit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(nomProduit),
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => delProduit?.call(context),
            icon: Icons.delete,
            backgroundColor: Colors.red,
            label: 'Supprimer',
          ),
        ],
      ),
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          border: Border.all(color: selected ? Colors.green : Colors.blueAccent),
          borderRadius: BorderRadius.circular(8),
          color: selected ? Colors.lightGreen[100] : Colors.transparent,
        ),
        child: Row(
          children: [
            Checkbox(
              value: selected,
              onChanged: toggleSelection,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                nomProduit,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
