import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/home_screen/hadeth/item_hadeth_name.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../theme/my_theme.dart';

class HadethTab extends StatefulWidget {
  static const String routeName = 'hadeth-screen';

  HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    if(ahadethList.isEmpty){
      loadFile();
    }
    return Column(children: [
      Center(
        child: Image.asset('assets/images/hadeth_logo.png'),
      ),
      Divider(
        color: MyTheme.primaryLight,
        thickness: 3,
      ),
      Text(
        AppLocalizations.of(context)!.hadeth_name,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      Divider(
        color: MyTheme.primaryLight,
        thickness: 3,
      ),
      ahadethList.isEmpty
          ? Center(
              child: CircularProgressIndicator(
                color: MyTheme.primaryLight,
              ),
            )
          : Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  color: MyTheme.primaryLight,
                  thickness: 2,
                ),
                itemBuilder: (context, index) {
                  return ItemHadethName(hadeth:ahadethList[index]);
                },
                itemCount: ahadethList.length,
              ),
            )
    ]);
  }

  void loadFile() async {
    String hadethContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> hadethList = hadethContent.split('#\r\n');
    for (int i = 0; i < hadethList.length; i++) {
      List<String> hadethLines = hadethList[i].split('\n');
      String title = hadethLines[0];
      hadethLines.remove(0);
      Hadeth hadeth = Hadeth(title: title, content: hadethLines);
      ahadethList.add(hadeth);
      setState(() {});
    }
  }
}

class Hadeth {
  String title;
  List<String> content;

  Hadeth({required this.title, required this.content});
}
