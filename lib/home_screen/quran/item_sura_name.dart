import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/home_screen/quran/sura_details_screen.dart';
class ItemSuraName extends StatelessWidget {
  String name;
  int index;
  ItemSuraName({super.key, required this.name, required this.index});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          SuraDetailsScreen.routeName,
          arguments: SuraDataArgs(
            name: name,
            index: index,
          ),
        );
      },
      child: Text(
        name,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  void loadFile(int index) async {
   String content= await rootBundle.loadString('assets/files/${index + 1}.txt');
  }
}

class SuraDetailsArgs {
  String name;
  int index;

  SuraDetailsArgs({required this.name, required this.index});
}
