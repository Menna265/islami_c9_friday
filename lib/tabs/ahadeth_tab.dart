import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c9/hadeth_details.dart';
import 'package:islami_c9/my_theme_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import '../hadeth_model.dart';

class AhadethTab extends StatefulWidget {
  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {

  List<HadethModel> allAhadeth = [];
  @override
  Widget build(BuildContext context) {
    if (allAhadeth.isEmpty) {
      loadHadeth();
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            'assets/images/ahadeth_image.png',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Divider(
            thickness: 2,
            color: MyThemeData.primaryColor,
          ),
          Text(
            AppLocalizations.of(context)!.hadeth_name,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color:Theme.of(context).colorScheme.onPrimary),
          ),

          Divider(
            thickness: 2,
            color: MyThemeData.primaryColor,
          ),
          ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){

                  Navigator.pushNamed(context, HadethDetails.routeName,
                      arguments:allAhadeth[index] );
                },
                child: Center(
                  child: Text(allAhadeth[index].title,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                  textDirection: TextDirection.rtl,),
                ),
              );
            },
            itemCount: allAhadeth.length,
            separatorBuilder: (context, index) => Divider(
              thickness: 1,
              indent: 40,
              endIndent: 40,
              color: MyThemeData.primaryColor,
            ),
          )
        ],
      ),
    );
  }
  loadHadeth() async {
    String ahadeth = await rootBundle.loadString("assets/files/ahadeth.txt");

    List<String> ahadethList = ahadeth.split('#');
    for (int i = 0; i < ahadeth.length; i++) {
      String hadethOne = ahadethList[i];
      List<String> hadethLine = hadethOne.trim().split('\n');
      String title = hadethLine[0];
      hadethLine.removeAt(0);
      List<String> content = hadethLine;
      HadethModel hadethModel = HadethModel(title: title, content: content);
      allAhadeth.add(hadethModel);
      print(title);
      setState(() {});
    }

  }


}
