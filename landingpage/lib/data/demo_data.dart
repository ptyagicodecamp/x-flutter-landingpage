import 'package:landingpage/data/res_list_item.dart';

import 'res_list_item.dart';

final List<Resource> resources = <Resource>[
  Resource('References', "", "", references),
  Resource('Cheat Sheets', "", "", cheatSheets),
  Resource('Curated Contents', "", "", curatedItems),
  Resource('Videos & Podcasts', "", "", mediaListing)
];

final List<Resource> references = Resource.fromData([
  {
    "title": "It's All Widget",
    "description":
        "An open list of example apps made with Flutter include many open source samples.",
    "link": "https://itsallwidgets.com/"
  },
  {
    "title": "Flutter",
    "description": "Official Flutter Development Website",
    "link": "https://flutter.dev/"
  }
]);

final List<Resource> cheatSheets = Resource.fromData([
  {
    "title": "Flutter Layout Cheat Sheet",
    "description": "",
    "link":
        "https://medium.com/flutter-community/flutter-layout-cheat-sheet-5363348d037e"
  },
  {
    "title": "Flutter Animations Cheat Sheet",
    "description": "",
    "link":
        "https://medium.com/flutter-community/flutter-animations-cheat-sheet-7f8cebfb850c"
  },
  {
    "title": "Dart Awesome Cheat Sheet for Flutter Beginners",
    "description": "",
    "link": "https://link.medium.com/RDSSCukKSZ"
  }
]);

final List<Resource> curatedItems = Resource.fromData([
  {
    "title": "FlutterX",
    "description": "A Searchable List of Flutter Resources",
    "link": "https://flutterx.com/"
  },
  {
    "title": "Curated list of resources",
    "description": "A Searchable List of Flutter Resources",
    "link": "https://github.com/Solido/awesome-flutter"
  }
]);

final List<Resource> mediaListing = Resource.fromData([
  {
    "title": "Flutter YouTube Channel",
    "description": "",
    "link": "https://www.youtube.com/flutterdev"
  },
  {
    "title": "The Boring Flutter Development Show",
    "description":
        "The Boring Show is a biweekly, long-format show in which a few engineers from the Flutter team get together to hack on something",
    "link":
        "https://www.youtube.com/watch?v=vqPG1tU6-c0&list=PLjxrf2q8roU3ahJVrSgAnPjzkpGmL9Czl"
  },
  {
    "title": "Flutter Widget of the Week",
    "description":
        "Widget of the Week is a series of quick, animated videos, each of which covers a particular widget from the Flutter SDK",
    "link":
        "https://www.youtube.com/playlist?list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG"
  },
  {
    "title": "Flutter in Focus",
    "description":
        "Let's learn Flutter features in 10 minutes or less with our new series, Flutter in Focus!",
    "link":
        "https://www.youtube.com/playlist?list=PLjxrf2q8roU2HdJQDjJzOeO6J3FoFLWr2"
  },
  {
    "title": "Flutter Podcast",
    "description":
        "An ongoing series featuring some of the amazing developers from the Flutter community.",
    "link": "https://itsallwidgets.com/podcast"
  }
]);
