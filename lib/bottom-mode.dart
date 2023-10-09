import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_c9/my_theme_data.dart';
import 'package:islami_c9/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class BottomMode extends StatefulWidget {
  @override
  State<BottomMode> createState() => _BottomLanguageState();
}

class _BottomLanguageState extends State<BottomMode> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
            onTap: () {
               provider.changeTheme(ThemeMode.light);
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context)!.light,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: provider.appTheme==ThemeMode.light?Theme.of(context).colorScheme.background:Theme.of(context).colorScheme.onPrimary,
                          )),
                  Icon(
                    Icons.check,
                    color: MyThemeData.primaryColor,
                    size: 30,
                  )
                ],
              ),
            )),
        InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context)!.dark,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: provider.appTheme==ThemeMode.dark?Theme.of(context).colorScheme.background:Theme.of(context).colorScheme.onPrimary,
                          )),
                  Icon(
                    Icons.check,
                    color: MyThemeData.primaryColor,
                    size: 30,
                  )
                ],
              ),
            )),
      ],
    );
  }


}
