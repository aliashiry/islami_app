import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:islami_app/home_screen/hadeth/hadeth_tab.dart';
import 'package:islami_app/home_screen/home_screen.dart';
import 'package:islami_app/home_screen/providers/app_config_provider.dart';
import 'package:islami_app/home_screen/quran/quran_tab.dart';
import 'package:islami_app/home_screen/quran/sura_details_screen.dart';
import 'package:islami_app/home_screen/radio/radio.dart';
import 'package:islami_app/home_screen/sebha/sebha_tab.dart';
import 'package:islami_app/theme/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'home_screen/hadeth/hadeth_details_screen.dart';

void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(const Duration(seconds: 1));
  await Future.delayed(const Duration(seconds: 1));
  await Future.delayed(const Duration(seconds: 1));
  FlutterNativeSplash.remove();
  runApp(ChangeNotifierProvider(
    create: (context) => AppConfigProvider(),
      child: const MyApp()));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        QuranTab.routeName: (context) => QuranTab(),
        SebhaTab.routeName: (context) => SebhaTab(),
        RadioTab.routeName: (context) => RadioTab(),
        HadethTab.routeName: (context) => HadethTab(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (context) => HadethDetailsScreen(),
      },
      themeMode: provider.appTheme,
      theme: MyTheme.lightMode,
      darkTheme: MyTheme.darkMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale:Locale(provider.appLanguage),
    );
  }
}
