import 'package:flutter_web/material.dart';
import 'package:intl/intl.dart';
import 'dart:html' as html;
import 'dart:convert';
import 'package:html_unescape/html_unescape.dart';

import 'rss_service.dart';

const HtmlEscape htmlEscape = HtmlEscape();

class FlutterResources extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Resources'),
      ),
      body: showListing(),
    );
  }

  FutureBuilder showListing() {
    var unescape = new HtmlUnescape();

    return FutureBuilder(
      future: RssService().getFeed(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            if (snapshot.hasData) {
              if (snapshot.data != null) {
                final feed = snapshot.data;
                return ListView.builder(
                    itemCount: feed.items.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      final item = feed.items[index];
                      return ListTile(
                        title: Text(
                          item.title,
                          style: TextStyle(fontFamily: 'Roboto', fontSize: 20),
                        ),
                        leading: Icon(Icons.star_border),
                        contentPadding: EdgeInsets.all(16.0),
                        onTap: () async {
                          openLink(item.id);
                        },
                      );
                    });
              } else {
                return showLoading();
              }
            } else {
              showLoading();
            }
            break;

          default:
            return showLoading();
        }
      },
    );
  }

  Widget showLoading() {
    return Align(
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );
  }

  void openLink(String url) {
    var substr = url.toString().split(":");
    var myUrl = "https://ptyagicodecamp.github.io" + substr[2];
    html.window.open(myUrl, "Flutter Resources");
  }
}
