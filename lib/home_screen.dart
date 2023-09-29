import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_c9/my_theme_data.dart';
import 'package:islami_c9/tabs/ahadeth_tab.dart';
import 'package:islami_c9/tabs/quran_tab.dart';
import 'package:islami_c9/tabs/radio_tab.dart';
import 'package:islami_c9/tabs/sebha_tab.dart';
import 'package:islami_c9/tabs/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName='home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index=0;

  @override
  Widget build(BuildContext context) {
    return Stack(
       children: [
         Image.asset("assets/images/background.png",width: double.infinity,fit: BoxFit.cover,height: double.infinity,),

         Scaffold(
           appBar: AppBar(

             title: Text('Islami',style: Theme.of(context).textTheme.bodyLarge),

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

             BottomNavigationBarItem(icon:ImageIcon(AssetImage('assets/images/radio.png')),label: 'radio',backgroundColor:MyThemeData.primaryColor),
               BottomNavigationBarItem(icon:ImageIcon(AssetImage('assets/images/sebha.png')),label: 'sebha',backgroundColor: MyThemeData.primaryColor),
               BottomNavigationBarItem(icon:ImageIcon(AssetImage('assets/images/ahadeth.png')),label: 'ahadeth',backgroundColor: MyThemeData.primaryColor),
               BottomNavigationBarItem(icon:ImageIcon(AssetImage('assets/images/moshaf.png')),label: 'quran',backgroundColor: MyThemeData.primaryColor),
               BottomNavigationBarItem(icon:Icon(Icons.settings),label: 'setting',backgroundColor: MyThemeData.primaryColor),
           ],

           ),

           body: tabs[index],
         )
       ],
    );
  }
  List<Widget>tabs=[RadioTab(),SebhaTab(),AhadethTab(),QuranTab(),SettingsTab()];
}
