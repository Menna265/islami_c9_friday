import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_c9/my_theme_data.dart';
import 'package:islami_c9/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class BottomLanguage extends StatefulWidget {


  @override
  State<BottomLanguage> createState() => _BottomLanguageState();
}

class _BottomLanguageState extends State<BottomLanguage> {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [


      InkWell(
        onTap: (){
          provider.changeLanguage('en');
          Navigator.pop(context);
        },
        child:provider.appLanguage =='en'?
            getSelected(AppLocalizations.of(context)!.english)
            : getUnSelected(AppLocalizations.of(context)!.english),
      ),

      InkWell(
        onTap: (){
          provider.changeLanguage('ar');
          Navigator.pop(context);
        },
        child:provider.appLanguage=='ar'?
            getSelected(AppLocalizations.of(context)!.arabic)
            : getUnSelected(AppLocalizations.of(context)!.arabic),
      ),
    ],);
  }

  Widget getSelected(String text){
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: MyThemeData.primaryColor,)),
          Icon(Icons.check,color: MyThemeData.primaryColor,size: 30,)
        ],
      ),
    );
  }
  Widget getUnSelected(String text){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(text,style: Theme.of(context).textTheme.bodyLarge),
    );
  }
}
