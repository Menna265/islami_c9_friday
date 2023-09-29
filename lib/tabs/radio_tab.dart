import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/radio_image.png',width: 412,height: 222,),
        SizedBox(height: 25,),
        Text(AppLocalizations.of(context)!.holy,style: Theme.of(context).textTheme.bodyLarge,),
        SizedBox(height: 80,),
        Image.asset('assets/images/Group 5.png')
      ],

    );
  }
}
