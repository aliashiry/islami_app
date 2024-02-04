import 'package:flutter/material.dart';
import 'package:islami_app/theme/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:math' as math;
class SebhaTab extends StatefulWidget {
  static const String routeName = 'sebha-screen';
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double turns=0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Image.asset('assets/images/head_sebha_logo.png'),
        ),
        Center(
          child: AnimatedRotation(
            turns: turns,
            duration: Duration(seconds: 1),
            child: InkWell(
              onTap: (){
               setState(() {
                 turns +=0.5/4;
               });
              },
                child: Image.asset('assets/images/body_sebha_logo.png')),
          )
        ),
        SizedBox(height: 30,),
        Text(
          AppLocalizations.of(context)!.number_of_tasbeeh,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 15,),
        Container(
          // #B7935F
          decoration: BoxDecoration(color: MyTheme.primaryLight,
              borderRadius: BorderRadius.circular(15)),
          height: 70,
          width: 50,
          child: Center(child: Text('30',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
        ),
        const SizedBox(height: 15,),
        Container(
          // #B7935F
          decoration: BoxDecoration(color: MyTheme.primaryLight,
              borderRadius: BorderRadius.circular(30)),
          height: 40,
          width: 120,
          child: const Center(child: Text('سبحان الله',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold,),)),
        )
      ],
    );
  }
}
