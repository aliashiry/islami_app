import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/home_screen/providers/app_config_provider.dart';
import 'package:islami_app/theme/my_theme.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      color: provider.isDarkMode()? MyTheme.primaryLight:
          MyTheme.WhiteColor,
      padding:EdgeInsets.all(30),
      //margin: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              provider.changeThemeMode(ThemeMode.dark);
            },
            child: provider.isDarkMode()
                ? getSelectedItemWidget(AppLocalizations.of(context)!.dark)
                : getUnselectedItemWidget(AppLocalizations.of(context)!.dark),
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              provider.changeThemeMode(ThemeMode.light);
            },
            child: provider.isDarkMode()
                ? getUnselectedItemWidget(AppLocalizations.of(context)!.light)
                : getSelectedItemWidget(AppLocalizations.of(context)!.light),
          ),
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: MyTheme.blackColor,
              ),
        ),
        Icon(
          Icons.check,
          size: 30,
          color: MyTheme.blackColor,
        ),
      ],
    );
  }

  Widget getUnselectedItemWidget(String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleSmall,
    );
  }
}
