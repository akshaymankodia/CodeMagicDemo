import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codemagic_demo/app_config.dart';
import 'package:codemagic_demo/environment.dart';
import 'package:flutter/material.dart';

import './config_reader.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool loading = false;
  TextEditingController _controller = TextEditingController();

  void _incrementCounter() {
    setState(() {
      
      if (AppConfig.of(context).buildFlavor == 'Development') {
        _counter += ConfigReader.getDevIncrementAmount();
      }else if(AppConfig.of(context).buildFlavor == 'Production'){
        _counter += ConfigReader.getProdIncrementAmount();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConfig.of(context).appTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("You are running ${AppConfig.of(context).buildFlavor} flavor"),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            loading ? CircularProgressIndicator() : Container(),
            TextField(
              controller: _controller,
            ),
            RaisedButton(
              child: Text("Add to Firestore"),
              onPressed: _addToFirestore,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  _addToFirestore() async {
    if (_controller.text.isEmpty) return;
    setState(() {
      loading = true;
    });
    await Firestore.instance
        .collection('mycoll')
        .add({"string": _controller.text});
    _controller.text = "";
    setState(() {
      loading = false;
    });
  }
}
