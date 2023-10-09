import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_c9/my_theme_data.dart';
import 'package:islami_c9/providers/app_config_provider.dart';
import 'package:islami_c9/tabs/ahadeth_tab.dart';
import 'package:islami_c9/tabs/quran_tab.dart';
import 'package:islami_c9/tabs/radio_tab.dart';
import 'package:islami_c9/tabs/sebha_tab.dart';
import 'package:islami_c9/tabs/settings_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName='home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index=0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(
       children: [
         Image.asset(provider.appTheme==ThemeMode.light?
           "assets/images/background.png":"assets/images/bg.png",width: double.infinity,fit: BoxFit.cover,height: double.infinity,),

         Scaffold(
           appBar: AppBar(

             title: Text(AppLocalizations.of(context)!.app_title,style: Theme.of(context).textTheme.bodyLarge),

           ),
           bottomNavigationBar: BottomNavigationBar(
             // بتعرفني هيبدا من انهي ايكون
             currentIndex: index,

             onTap: (value){
               index=value;
               setState(() {

               });

             },
             items: [

             BottomNavigationBarItem(icon:ImageIcon(AssetImage('assets/images/radio.png')),label: AppLocalizations.of(context)!.radio,backgroundColor:Theme.of(context).colorScheme.primary),
               BottomNavigationBarItem(icon:ImageIcon(AssetImage('assets/images/sebha.png')),label: AppLocalizations.of(context)!.tasbeh,backgroundColor: Theme.of(context).colorScheme.primary),
               BottomNavigationBarItem(icon:ImageIcon(AssetImage('assets/images/ahadeth.png')),label: AppLocalizations.of(context)!.hadeth,backgroundColor: Theme.of(context).colorScheme.primary),
               BottomNavigationBarItem(icon:ImageIcon(AssetImage('assets/images/moshaf.png')),label: AppLocalizations.of(context)!.quran,backgroundColor: Theme.of(context).colorScheme.primary),
               BottomNavigationBarItem(icon:Icon(Icons.settings),label: AppLocalizations.of(context)!.settings,backgroundColor: Theme.of(context).colorScheme.primary),
           ],

           ),

           body: tabs[index],
         )
       ],
    );
  }
  List<Widget>tabs=[RadioTab(),SebhaTab(),AhadethTab(),QuranTab(),SettingsTab()];
}
