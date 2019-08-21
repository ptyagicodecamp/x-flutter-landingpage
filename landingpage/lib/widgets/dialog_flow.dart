import 'package:flutter_web/material.dart';
import 'package:landingpage/flutter_dialogflow2/auth_google.dart';
import 'package:landingpage/flutter_dialogflow2/language.dart';
import 'package:landingpage/flutter_dialogflow2/message.dart';
import 'fact_message.dart';
import 'package:landingpage/flutter_dialogflow2/dialogflow_v2.dart';

class FlutterFactsDialogFlow extends StatefulWidget {
  FlutterFactsDialogFlow({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FlutterFactsDialogFlowState createState() => new _FlutterFactsDialogFlowState();
}

class _FlutterFactsDialogFlowState extends State<FlutterFactsDialogFlow> {
  final List<FactsMessage> _messages = <FactsMessage>[];
  final TextEditingController _textController = new TextEditingController();

  Widget _queryInputWidget(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _submitQuery,
                decoration: InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => _submitQuery(_textController.text)),
            ),
          ],
        ),
      ),
    );
  }

  void _dialogFlowResponse(query) async {
    _textController.clear();
    AuthGoogle authGoogle =
    await AuthGoogle(fileJson: "assets/flutter-to-fly-creds.json").build();
    Dialogflow dialogFlow =
    Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse response = await dialogFlow.detectIntent(query);
    FactsMessage message = FactsMessage(
      text: response.getMessage() ??
           CardDialogflow(response.getListMessage()[0]).title,
      name: "Flutter Bot",
      type: false,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _submitQuery(String text) {
    _textController.clear();
    FactsMessage message = new FactsMessage(
      text: text,
      name: "Priyanka",
      type: true,
    );
    setState(() {
      _messages.insert(0, message);
    });
    _dialogFlowResponse(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Flutter Facts"),
      ),
      body: Column(children: <Widget>[
        Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true, //To keep the latest messages at the bottom
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            )),
        Divider(height: 1.0),
        Container(
          decoration: new BoxDecoration(color: Theme.of(context).cardColor),
          child: _queryInputWidget(context),
        ),
      ]),
    );
  }
}
