import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:islami_c9/hadeth_model.dart';

import 'my_theme_data.dart';

class HadethDetails extends StatefulWidget {
  static const String routeName='hadethDetails';

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {

  @override
  Widget build(BuildContext context) {

    var args=ModalRoute.of(context)!.settings.arguments as HadethModel;
    return  Stack(
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
              args.title,
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
                    return Text(args.content[index],
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,);
                  },
                  itemCount: args.content.length,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }


}