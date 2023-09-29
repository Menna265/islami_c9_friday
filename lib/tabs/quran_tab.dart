import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_c9/my_theme_data.dart';
import 'package:islami_c9/sura_details.dart';
import 'package:islami_c9/sura_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuranTab extends StatelessWidget {
  List<String>quran=["الفاتحه","البقرة","آل عمران","النساء","المائدة","الأنعام","الأعراف","الأنفال","التوبة","يونس","هود"
    ,"يوسف","الرعد","إبراهيم","الحجر","النحل","الإسراء","الكهف","مريم","طه","الأنبياء","الحج","المؤمنون"
    ,"النّور","الفرقان","الشعراء","النّمل","القصص","العنكبوت","الرّوم","لقمان","السجدة","الأحزاب","سبأ"
    ,"فاطر","يس","الصافات","ص","الزمر","غافر","فصّلت","الشورى","الزخرف","الدّخان","الجاثية","الأحقاف"
    ,"محمد","الفتح","الحجرات","ق","الذاريات","الطور","النجم","القمر","الرحمن","الواقعة","الحديد","المجادلة"
    ,"الحشر","الممتحنة","الصف","الجمعة","المنافقون","التغابن","الطلاق","التحريم","الملك","القلم","الحاقة","المعارج"
    ,"نوح","الجن","المزّمّل","المدّثر","القيامة","الإنسان","المرسلات","النبأ","النازعات","عبس","التكوير","الإنفطار"
    ,"المطفّفين","الإنشقاق","البروج","الطارق","الأعلى","الغاشية","الفجر","البلد","الشمس","الليل","الضحى","الشرح"
    ,"التين","العلق","القدر","البينة","الزلزلة","العاديات","القارعة","التكاثر","العصر",
    "الهمزة","الفيل","قريش","الماعون","الكوثر","الكافرون","النصر","المسد","الإخلاص","الفلق","الناس"];


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
        Image.asset('assets/images/quran_image.png'),
          Divider(
            thickness: 2,
            color: MyThemeData.primaryColor,
          ),
          Text(AppLocalizations.of(context)!.sura_name,style: Theme.of(context).textTheme.bodyLarge!.copyWith(color:MyThemeData.blackColor),),



          Divider(
            thickness: 2,
            color: MyThemeData.primaryColor,
          ),
          Expanded(
            child: ListView.separated(
                separatorBuilder: (context,index)=>Divider(
                  thickness: 1,
                  endIndent: 40,
                  indent: 40,
                  color: MyThemeData.primaryColor,
                ),
                itemBuilder: (context,index){
                  return Center(child: InkWell(
                     onTap: (){
                       Navigator.pushNamed(context, SuraDetails.routeName,
                           arguments:SuraModel(name: quran[index], index: index) );
                     },
                      child: Text(quran[index],style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: MyThemeData.blackColor))),);
                },
                itemCount: quran.length),
          ),






      ],),
    );
  }

}