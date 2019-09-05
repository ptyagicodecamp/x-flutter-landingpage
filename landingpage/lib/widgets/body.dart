import 'package:flutter_web/material.dart';
import 'package:landingpage/utils/responsive_widget.dart';

import 'large_screen.dart';
import 'small_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: LargeScreen(),
      smallScreen: SmallScreen(),
    );
  }
}
