import 'package:flutter/material.dart';
class ItemSuraDetailsScreen extends StatelessWidget {
  String name;
  int index;

  ItemSuraDetailsScreen({super.key, required this.name,required this.index});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(
         textDirection: TextDirection.rtl,
        '$name (${index + 1})',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }


}


