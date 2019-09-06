import 'dart:convert';
import 'dart:html';

import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/src/assets/assets.dart';
import 'package:flutter_web_ui/ui.dart' as ui;
import 'package:landingpage/main.dart' as app;

main() async {
  //Use for firebase package development only
  await config();

  try {
    await config();

    fb.initializeApp(
      apiKey: apiKey,
      authDomain: authDomain,
      databaseURL: databaseUrl,
      storageBucket: storageBucket,
      projectId: projectId,
    );

    await ui.webOnlyInitializePlatform();
    app.main();
  } on fb.FirebaseJsNotLoadedException catch (e) {
    print(e);
  }
}
