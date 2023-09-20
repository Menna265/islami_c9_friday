import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c9/my_theme_data.dart';
import 'package:islami_c9/sura_model.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = 'sura';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadFile(args.index);
    }

    return Stack(
      children: [
        Image.asset(
          "assets/images/background.png",
          width: double.infinity,
          fit: BoxFit.cover,
          height: double.infinity,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              args.name,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              elevation: 12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: MyThemeData.primaryColor
                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Text(verses[index],
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.black87,
                            ),
                        textAlign: TextAlign.center,);
                  },
                  itemCount: verses.length,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  loadFile(int index) async {
    String file = await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> lines = file.split("\n");

    setState(() {});
    verses = lines;
  }
}
