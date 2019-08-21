import 'package:flutter_web/material.dart';

import '../router.dart';
import 'myColors.dart';

Widget factBot(BuildContext context) {
  return Container(
    alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        materialTapTargetSize: MaterialTapTargetSize.padded,
        child: Center(
          child: Icon(Icons.chat),
        ),
        elevation: 4.0,
        backgroundColor: MyColors.blue1,
        onPressed: () => Navigator.pushNamed(context, FACTS_DIALOGFLOW),
      )
  );
}