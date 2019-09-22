import 'package:landingpage/plugins/url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResourceListItem extends StatelessWidget {
  final Resource _resource;
  const ResourceListItem(this._resource);

  @override
  Widget build(BuildContext context) {
    return _buildTiles(_resource);
  }

  Widget _buildTiles(Resource resource) {
    if (resource.children.isEmpty)
      return ListTile(
          title: Text(
            resource.title,
            style: TextStyle(fontFamily: 'Montserrat-Regular', fontSize: 20),
          ),
          subtitle: resource.description.isNotEmpty
              ? Text(
                  resource.description,
                  style: TextStyle(fontFamily: 'Fresca', fontSize: 18),
                )
              : null,
          onTap: () {
            if (resource.link.isNotEmpty) {
              UrlUtils.open(resource.link);
            }
          });

    return ExpansionTile(
      key: PageStorageKey<Resource>(resource),
      title: Text(resource.title,
          style: TextStyle(fontFamily: 'Montserrat-Medium', fontSize: 20)),
      children: resource.children.map(_buildTiles).toList(),
    );
  }
}

class Resource {
  final String title;
  final String description;
  final String link;
  final List<Resource> children;

  //intializing empty children
  Resource(this.title, this.description, this.link,
      [this.children = const <Resource>[]]);

  Resource.fromMap(Map<String, dynamic> data)
      : title = data["title"],
        description = data["description"],
        link = data["link"],
        this.children = const <Resource>[];

  static List<Resource> fromData(List<Map<String, dynamic>> data) {
    return data.map((item) => Resource.fromMap(item)).toList();
  }
}
