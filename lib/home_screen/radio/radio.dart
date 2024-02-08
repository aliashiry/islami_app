import 'package:flutter/material.dart';
import 'package:islami_app/theme/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioTab extends StatelessWidget {
  static const String routeName = 'radio-screen';

  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 90,
        ),
        Center(
          child: Image.asset('assets/images/radio_image.png'),
        ),
        const SizedBox(
          height: 50,
        ),
        Text(
          AppLocalizations.of(context)!.quran_radio,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {},
                color: MyTheme.primaryLight,
                iconSize: 50,
                icon: const Icon(
                  Icons.skip_previous,
                )),
            IconButton(
                onPressed: () {},
                color: MyTheme.primaryLight,
                iconSize: 50,
                icon: const Icon(
                  Icons.play_arrow_sharp,
                )),
            IconButton(
                onPressed: () {},
                color: MyTheme.primaryLight,
                iconSize: 50,
                icon: const Icon(
                  Icons.skip_next,
                )),
          ],
        ),
      ],
    );
  }
}
