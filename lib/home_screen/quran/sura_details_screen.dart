import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/home_screen/providers/app_config_provider.dart';
import 'package:islami_app/theme/my_theme.dart';
import 'package:provider/provider.dart';
import 'item_sura_details_screen.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura_Details_screen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDataArgs;
    var provider = Provider.of<AppConfigProvider>(context);
    if (verses.isEmpty) {
      loadFile(args.index);
    }
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
            title: Text('${args.name}',
                style: Theme.of(context).textTheme.titleLarge),
          ),
          body: verses.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                  color: MyTheme.primaryLight,
                ))
              : Container(
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
                      itemCount: verses.length,
                      itemBuilder: (context, index) {
                        return ItemSuraDetailsScreen(
                          name: verses[index],
                          index: index,
                        );
                      }),
                )),
    ]);
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split('\n');
    verses = lines;
    setState(() {});
  }
}

class SuraDataArgs {
  String name;
  int index;

  SuraDataArgs({required this.name, required this.index});
}
