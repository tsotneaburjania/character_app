import 'package:flutter/material.dart';
import 'package:tsotne_aburjania_midterm_clothing_app_variant_1/logic/crud_operations.dart';
import 'package:tsotne_aburjania_midterm_clothing_app_variant_1/presentation/screens/home_screen.dart';

removeItemDialogue(BuildContext context, int index) {
  Widget cancelButton = TextButton(
    child: const Text("Cancel", style: TextStyle(color: Colors.yellow),),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );
  Widget removeButton = TextButton(
    child: const Text("REMOVE", style: TextStyle(color: Colors.red),),
    onPressed:  () {
      CRUDOperations.deleteItem(index);
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    },
  );

  AlertDialog alert = AlertDialog(
    backgroundColor: Colors.black54,
    title: const Text("Removal", style: TextStyle(color: Colors.yellow),),
    content: const Text("Would you like to remove this item?", style: TextStyle(color: Colors.yellow),),
    actions: [
      cancelButton,
      removeButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}