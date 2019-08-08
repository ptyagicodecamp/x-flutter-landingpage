import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:flutter_web/material.dart';
import 'package:landingpage/utils/strings.dart';
import 'package:landingpage/utils/myColors.dart';
import 'package:landingpage/widgets/emailBox.dart';
import 'package:landingpage/utils/responsive_widget.dart';
import 'package:landingpage/widgets/message.dart';

var backgroundImage = "assets/flutter_image.jpg";

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: LargeScreen(),
      smallScreen: SmallScreen(),
    );
  }
}

class LargeScreen extends StatefulWidget {
  LargeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LargeScreenState createState() => new _LargeScreenState();
}

class _LargeScreenState extends State<LargeScreen> {
  final List<FactsMessage> _messages = <FactsMessage>[];
  final TextEditingController _textController = new TextEditingController();

  Widget _buildTextComposer(BuildContext context) {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration:
                new InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () => _handleSubmitted(_textController.text)),
            ),
          ],
        ),
      ),
    );
  }

  void Response(query) async {
    _textController.clear();
    AuthGoogle authGoogle = await AuthGoogle(
        fileJson: "assets/flutter-to-fly-creds.json")
        .build();
    Dialogflow dialogflow =
    Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse response = await dialogflow.detectIntent(query);
    FactsMessage message = new FactsMessage(
      text: response.getMessage() ??
          new CardDialogflow(response.getListMessage()[0]).title,
      name: "Bot",
      type: false,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    FactsMessage message = new FactsMessage(
      text: text,
      name: "Promise",
      type: true,
    );
    setState(() {
      _messages.insert(0, message);
    });
    Response(text);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[addBackground(), addWelcomeText(context), factBot(context)],
      ),
    );
  }

  Widget factBot(BuildContext context) {
    return FloatingActionButton(
      elevation: 4.0,
      backgroundColor: Colors.blueAccent,
      onPressed: () => _buildTextComposer,
    );
  }

  //Adds background Image
  Widget addBackground() {
    return FractionallySizedBox(
      alignment: Alignment.centerRight, //to keep images aligned to right
      widthFactor: .6, //covers about 60% of the screen width
      child: Image.network(
        backgroundImage,
        scale: .85,
      ),
    );
  }

  //Adds welcome text
  Widget addWelcomeText(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.centerLeft, //text aligned to left side
      widthFactor: .6, //covers about half of the screen
      child: Padding(
        padding: EdgeInsets.only(left: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              Strings.hello,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 60,
                color: MyColors.blue4,
              ),
            ),
            RichText(
              text: TextSpan(
                  text: Strings.welcomeTo,
                  style: TextStyle(fontSize: 60, color: MyColors.blue4),
                  children: [
                    TextSpan(
                        text: Strings.ftf,
                        style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54)
                    )
                  ]),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.0, top: 20),
              child: Text(Strings.subscribeText),
            ),
            SizedBox(
              height: 40,
            ), //Give some spacing
            EmailBox(),
          ],
        ),
      ),
    );
  }
}

class SmallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              Strings.hello,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: MyColors.blue4,
              ),
            ),
            RichText(
              text: TextSpan(
                  text: Strings.welcomeTo,
                  style: TextStyle(fontSize: 40, color: MyColors.blue4),
                  children: [
                    TextSpan(
                        text: Strings.ftf,
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54))
                  ]),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Image.network(
                backgroundImage,
                scale: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.0, top: 20),
              child: Text(Strings.subscribeText),
            ),
            SizedBox(
              height: 30,
            ),
            EmailBox(),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
