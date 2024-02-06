import 'package:flutter/material.dart';
import 'package:islami_app/theme/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SebhaTab extends StatefulWidget {
  static const String routeName = 'sebha-screen';

  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double turns = 0;
  List<String> tasbeh = ['سبحان الله', 'الحمد لله', 'الله اكبر','أستغفر الله'];
  int counter = 0;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Center(
                child: Image.asset('assets/images/head_sebha_logo.png'),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Center(
                  child: AnimatedRotation(
                turns: turns,
                duration: const Duration(milliseconds: 10),
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        turns += 1 / 4;
                        counter++;
                        if (counter == 34) {
                          counter = 0;
                          index++;
                        }
                        if (index == 4) {
                          index = 0;
                        }
                      });
                    },
                    child: Image.asset('assets/images/body_sebha_logo.png')),
              )),
            ),
          ],
        ),
        // SizedBox(
        //   height: MediaQuery.of(context).size.height * 0.001,
        // ),
        Text(
          AppLocalizations.of(context)!.number_of_tasbeeh,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Container(
          // #B7935F
          decoration: BoxDecoration(
              color: MyTheme.primaryLight,
              borderRadius: BorderRadius.circular(15)),
          height: MediaQuery.of(context).size.height * 0.09,
          width: MediaQuery.of(context).size.width * 0.12,
          child: Center(
              child: Text(
            '${counter}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Container(
          // #B7935F
          decoration: BoxDecoration(
              color: MyTheme.primaryLight,
              borderRadius: BorderRadius.circular(30)),
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.width * 0.4,
          child: Center(
              child: Text(
            tasbeh[index],
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )),
        )
      ],
    );
  }
}
