import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/home_screen/providers/app_config_provider.dart';
import 'package:islami_app/theme/my_theme.dart';
import 'package:provider/provider.dart';
class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: const EdgeInsets.all(30),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
       children: [
         InkWell(
           onTap: (){
             provider.changeLanguage('en');
           },
           child:provider.appLanguage  == 'en'?getSelectedItemWidget(AppLocalizations.of(context)!.english):
               getUnselectedItemWidget(AppLocalizations.of(context)!.english),
         ),
         const SizedBox(
           height: 15,
         ),
         InkWell(
           onTap: (){
             provider.changeLanguage('ar');
           },
             child: provider.appLanguage == 'ar' ?
    getSelectedItemWidget(AppLocalizations.of(context)!.arabic):
        getUnselectedItemWidget(AppLocalizations.of(context)!.arabic),
         ),],
     ),
    );
  }

  Widget getSelectedItemWidget( String text ) {
   return  Row(
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
     children: [
       Text(text,style: Theme.of(context).textTheme.titleSmall?.copyWith(
         color: MyTheme.primaryLight,
       ),),
       Icon(Icons.check,size: 30,color: MyTheme.primaryLight,),
     ],
   );
  }
  Widget getUnselectedItemWidget(String text){
    return Text(text,style: Theme.of(context).textTheme.titleSmall?.copyWith(
      color: MyTheme.blackColor,
    ),);
  }
}
