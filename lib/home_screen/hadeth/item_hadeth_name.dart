import 'package:flutter/material.dart';
import 'package:islami_app/home_screen/hadeth/hadeth_details_screen.dart';
import 'package:islami_app/home_screen/hadeth/hadeth_tab.dart';
import 'package:islami_app/home_screen/quran/sura_details_screen.dart';

class ItemHadethName extends StatelessWidget {
  Hadeth hadeth;
  ItemHadethName({super.key, required this.hadeth,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadethDetailsScreen.routeName,
          arguments: hadeth
        );
      },
      child: Text(
        hadeth.title,
        textAlign: TextAlign.center,
        style: Theme
            .of(context)
            .textTheme
            .titleMedium,
      ),
    );
  }
}
