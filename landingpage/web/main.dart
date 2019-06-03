import 'package:flutter_web_ui/ui.dart' as ui;


import 'package:landingpage/main.dart' as app;

main() async {
  await ui.webOnlyInitializePlatform();
  app.main();
}