// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:app_view/app_view.dart';
void main() {
  Map<String, dynamic> app = {
    "@type": "materialApp",
    "home": {
      "@type": "Scaffold",
      "body": {
        "@type": "Center",
        "child": {
          "@type": "Text",
          "text": "Hello world \${variable[\"count\"][\"data\"]}",
          "style": {"@type": "TextStyle", "fontSize": 15}
        }
      },
      "floating_action_button": {
        "@type": "FloatingActionButton",
        "tooltip": "Increment",
        "child": {
          "@type": "icon",
          "icon": "add",
          "onpresed": [
            {
              "@type": "updatevariable",
              "var": {"@type": "state", "count": "increase"}
            }
          ]
        }
      }
    },
    "root": [
      {
        "@type": "variable",
        "var": {"@type": "state", "count": 0}
      }
    ]
  };
  runApp(AppView(app));
}