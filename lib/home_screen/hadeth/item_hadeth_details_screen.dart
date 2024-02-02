import 'package:flutter/material.dart';
class ItemHadethDetailsScreen extends StatelessWidget {
  String content;
  ItemHadethDetailsScreen({super.key, required this.content,});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(
       content,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }


}


