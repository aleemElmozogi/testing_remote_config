import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MapDataToWidget {
  List<Widget> serverWidget = [];
  mapWidget(serverUI) {
    for (var element in jsonDecode(serverUI)) {
      String type = element['type'];
      serverWidget.add(toWidget(element, type));
    }
    return serverWidget;
  }

  toWidget(element, type) {
    switch (type) {
      case 'FlutterLogo':
        return FlutterLogo(
          size: element['size'].toDouble(),
        );
      case 'Container':
        return Container(
          width: element['width'].toDouble(),
          height: element['height'].toDouble(),
          color: HexColor(element['color']),
          child: toWidget(element['attributes'], element['attributes']['type']),
        );
      case 'Text':
        return Text(
          element['txtData'],
          style: TextStyle(
              fontSize: element['fontSize'] != null
                  ? element['fontSize'].toDouble()
                  : 50),
        );
      default:
        return const Text(
          'Error',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.pink),
        );
    }
  }
}
