import 'package:animation_rive/teddyController.dart';
import 'package:animation_rive/tracking_text.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TeddyController _teddyController;

  @override
  void initState() {
    super.initState();
    _teddyController = TeddyController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.blueGrey[700],
      appBar: AppBar(
        title: Text("DSC Rive with Edi Kurniawan"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 200,
            child: FlareActor(
              "assets/Teddy.flr",
              shouldClip: false,
              alignment: Alignment.bottomCenter,
              fit: BoxFit.contain,
              controller: _teddyController,
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TrackingTextInput(
                    hint: "Email Address",
                    onCaretMoved: (Offset caret) {
                      _teddyController.lookAt(caret);
                    }),
                TrackingTextInput(
                  isObscured: true,
                  hint: "Password",
                  onCaretMoved: (Offset caret) {
                    _teddyController.coverEyes(caret != null);
                    _teddyController.lookAt(null);
                  },
                  onTextChanged: (String value) {
                    _teddyController.setPassword(value);
                  },
                ),
                InkWell(
                  onTap: () {
                    _teddyController.submitPassword();
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Colors.purple, Colors.pink])),
                    child: Text(
                      "Sign In",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
