import 'package:landingpage/data/res_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:landingpage/plugins/url_launcher/url_launcher.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

import 'demo_data.dart';

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

  Widget showListing() {
    var items = resources;
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) =>
            ResourceListItem(items[index]));
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
    UrlUtils.open(myUrl);
  }
}
