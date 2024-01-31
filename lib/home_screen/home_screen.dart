import 'package:flutter/material.dart';
import 'package:islami_app/home_screen/hadeth/hadeth_tab.dart';
import 'package:islami_app/home_screen/quran/quran_tab.dart';
import 'package:islami_app/home_screen/radio/radio.dart';
import 'package:islami_app/home_screen/sebha/sebha_tab.dart';
import 'package:islami_app/theme/my_theme.dart';

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
                Text('Islami', style: Theme.of(context).textTheme.titleLarge),
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
                items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/icon_quran.png')),
                  label: 'Quran'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/icon_hadeth.png')),
                  label: 'Hadeth'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/icon_sebha.png')),
                  label: 'Sebha'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('assets/images/icon_radio.png')),
                  label: 'Radio'),
            ]),
          ),
          body: tabs[selectedIndex],
        ),
      ],
    );
  }
  List<Widget> tabs= [
    QuranTab(),
    HadehtTab(),
    SebhaTab(),
    RadioTab(),
  ];
}
