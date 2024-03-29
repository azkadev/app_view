import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:app_view/app_view.dart';

void main() {
  runApp(const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  task() {
    Timer.periodic(const Duration(milliseconds: 1), (t) {
      setState(() {
        _counter++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppView({
      "@type": "MaterialApp",
      "debugShowCheckedModeBanner": false,
      "home": {
        "@type": "Scaffold",
        "body": {
          "@type": "Column",
          "children": [
            {
              "@type": "Padding",
              "padding": const {
                "@type": "EdgeInsets.all",
                "value": 10,
              },
              "child": {
                "@type": "Center",
                "child": {
                  "@type": "Container",
                  "child": {
                    "@type": "Text",
                    "data": "Hello world $_counter",
                  }
                }
              },
            },
            {
              "@type": "Center",
              "child": {
                "@type": "Container",
                "child": {
                  "@type": "Text",
                  "data": "Hello world $_counter",
                }
              }
            },
            {
              "@type": "Padding",
              "padding": const {
                "@type": "EdgeInsets.symmetric",
                "vertical": 50,
              },
              "child": {
                "@type": "Padding",
                "padding": const {
                  "@type": "EdgeInsets.all",
                  "value": 10,
                },
                "child": {
                  "@type": "Row",
                  "children": List.generate(5, (index) {
                    return {
                      "@type": "Padding",
                      "padding": const EdgeInsets.all(10),
                      "child": {
                        "@type": "Text",
                        "data": "Row Text $index",
                      }
                    };
                  })
                }
              }
            },
          ]
        },
        "floatingActionButton": {
          "@type": "floatingActionButton",
          "onPressed": {
            "@type": "SendCallbackData",
            "data": const {"helo": "as"},
            "action": () {
              setState(() {
                _counter++;
              });
            }
          },
          "tooltip": 'Increment',
          "child": const Icon(Icons.abc),
        }
      }
    }, callback: (value) {
      if (kDebugMode) {
        print(value);
      }
    });
  }
}
