import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_c9/home_screen.dart';
import 'package:islami_c9/my_theme_data.dart';
import 'package:islami_c9/providers/app_config_provider.dart';
import 'package:islami_c9/sura_details.dart';
import 'package:provider/provider.dart';
import 'hadeth_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main(){
  runApp(ChangeNotifierProvider(
      create: (context) =>AppConfigProvider(),
  child: MyApp()));
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     initialRoute: HomeScreen.routeName,
     routes: {
       HomeScreen.routeName:(context)=>HomeScreen(),
       SuraDetails.routeName:(context)=>SuraDetails(),
       HadethDetails.routeName:(context)=>HadethDetails(),

     },
     theme:MyThemeData.lightTheme,

     darkTheme: MyThemeData.darkTheme,

       localizationsDelegates: AppLocalizations.localizationsDelegates,
       supportedLocales: AppLocalizations.supportedLocales,
     locale: Locale(provider.appLanguage),
     themeMode: ThemeMode.dark,

   );

  }

}
