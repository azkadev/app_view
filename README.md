# app_view

A new Flutter project.

- example

![]()
```dart
{
    "@type": "materialApp",
    "home": {
        "@type": "Scaffold",
        "body": {
            "@type": "Center",
            "child": {
                "@type": "Text",
                "text": "Hello count ${variable[\"count\"][\"data\"]}",
                "style": {
                    "@type": "TextStyle",
                    "fontSize": 15
                }
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
                        "var": {
                            "@type": "state",
                            "count": "increase"
                        }
                    }
                ]
            }
        }
    },
    "root": [
        {
            "@type": "variable",
            "var": {
                "@type": "state",
                "count": 0
            }
        },
        {
            "@type": "variable",
            "var": {
                "@type": "database",
                "count_login_app": 0
            }
        }
    ]
}
```