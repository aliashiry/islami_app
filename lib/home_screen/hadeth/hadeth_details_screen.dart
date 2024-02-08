import 'package:flutter/material.dart';
import 'package:islami_app/home_screen/hadeth/hadeth_tab.dart';
import 'package:islami_app/home_screen/hadeth/item_hadeth_details_screen.dart';
import 'package:islami_app/home_screen/quran/item_sura_details_screen.dart';
import 'package:islami_app/theme/my_theme.dart';
import 'package:provider/provider.dart';

import '../providers/app_config_provider.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = 'hadeth_Details_screen';

  @override
  State<HadethDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(children: [
      provider.isDarkMode()?Image.asset('assets/images/dark_bg.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill) : Image.asset('assets/images/main_background.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill),
      Scaffold(
          appBar: AppBar(
            title: Text('${args.title}',
                style: Theme.of(context).textTheme.titleLarge),
          ),
          body: Container(
            margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.06,
              horizontal: MediaQuery.of(context).size.width * 0.05,
            ),
            decoration: BoxDecoration(
              color: provider.isDarkMode()
                  ? MyTheme.primeryDark
                  : MyTheme.WhiteColor,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: ListView.builder(
                itemCount: args.content.length,
                itemBuilder: (context, index) {
                  return ItemHadethDetailsScreen(content: args.content[index]);
                }),
          )),
    ]);
  }
}
