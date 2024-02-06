import 'package:flutter/material.dart';
import 'package:islami_app/home_screen/hadeth/hadeth_tab.dart';
import 'package:islami_app/home_screen/quran/quran_tab.dart';
import 'package:islami_app/home_screen/radio/radio.dart';
import 'package:islami_app/home_screen/sebha/sebha_tab.dart';
import 'package:islami_app/theme/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HomeScreen extends StatefulWidget {
  static const String routeName = 'home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/main_background.png',
            width: double.infinity, fit: BoxFit.fill),
        Scaffold(
          appBar: AppBar(
            title:
                Text(AppLocalizations.of(context)!.app_title, style: Theme.of(context).textTheme.titleLarge),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: MyTheme.primaryLight,
            ),
            child: BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (index){
                  selectedIndex = index;
                  setState(() {});
                },
                items:  [
              BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage('assets/images/icon_quran.png')),
                  label: AppLocalizations.of(context)!.quran),
              BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage('assets/images/icon_hadeth.png')),
                  label: AppLocalizations.of(context)!.hadeth),
              BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage('assets/images/icon_sebha.png')),
                  label: AppLocalizations.of(context)!.sebha),
              BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage('assets/images/icon_radio.png')),
                  label: AppLocalizations.of(context)!.radio),
            ]),
          ),
          body: tabs[selectedIndex],
        ),
      ],
    );
  }
  List<Widget> tabs= [
    QuranTab(),
    HadethTab(),
     SebhaTab(),
     RadioTab(),
  ];
}
