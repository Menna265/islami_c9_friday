import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_c9/my_theme_data.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int num=0;
  int index=0;
  List<String>sebhaList=[
    'سبحان الله',
    'الحمد الله',
    'الله اكبر',
    'لا إاله إلا الله',
    'استغفر الله',
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          children: [
        Image.asset(
          "assets/images/Group 7.png",
          height: 312,
          width: 232,
        ),
        SizedBox(height: 50),

        Text('عدد التسبيحات',
            style: Theme.of(context).textTheme.bodyLarge),

        SizedBox(height: 20),

        Container(

          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(

              color: MyThemeData.primaryColor,
              borderRadius: BorderRadius.circular(25)),


          child: InkWell(
            onTap: (){
              onClicked();
            },
            child: Text('$num',
                style: Theme.of(context).textTheme.bodyLarge),
          ),
        ),

        SizedBox(height: 20),

        Container(

          decoration: BoxDecoration(
              color:MyThemeData.primaryColor,
              borderRadius: BorderRadius.circular(20)),

          child: Text(sebhaList[index],
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(color:Colors.white)),
        )
      ]),
    );
  }

  onClicked(){
    setState(() {
      if(num<=33){
        num++;
        sebhaList[index];
      }else{
        num=0;
        index++;
        sebhaList[index];
      }

    });

  }
}
