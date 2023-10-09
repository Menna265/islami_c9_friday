import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_c9/prefs_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier{
  String appLanguage='en';

  void init(){
    String? newLang=PrefsHelper.getLanguage() ;
    changeLanguage(newLang??"en");
    print(newLang);
    String mode =PrefsHelper.getMode();
    if(mode=="dark"){
      changeTheme(ThemeMode.dark);
    }else{
      changeTheme(ThemeMode.light);
    }
  }
  ThemeMode appTheme=ThemeMode.light;
  void changeLanguage (String newLanguage){
    if(appLanguage==newLanguage){
      return;
    }
    appLanguage=newLanguage;
    PrefsHelper.saveLanguage(newLanguage);
    notifyListeners();
  }

  void changeTheme(ThemeMode mode){
    appTheme=mode;
    if(mode==ThemeMode.dark){
      PrefsHelper.saveMode("dark");
    }else{
      PrefsHelper.saveMode("light");
    }

    notifyListeners();
    // if(appTheme==ThemeMode.light){
    //   appTheme=ThemeMode.dark;
    // }else{
    // appTheme=ThemeMode.light;}


  }
}