import 'package:flutter/material.dart';

import '../../../business_logic/sdui/map_data_to_widget.dart';
import '../../../data/services/firebase/remoteConfig.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> serverWidget = [];
  @override
  void initState() {
    super.initState();
    getVal();
  }

  getVal() async {
    var serverJsonList = (await FireBaseRemoteConfigObj().initializeConfig());
    setState(() => serverWidget = MapDataToWidget().mapWidget(serverJsonList));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: serverWidget,
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
