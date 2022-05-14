# app_view
 
Library Eksperiment membuat applikasi flutter dengan mudah data json.

## List Menu
  - [Docs]()
  - [Quickstart]()

#### Quickstart
![](https://github.com/azkadev/app_view/blob/main/screenshots/screenshot.png?raw=true)

<details open>
<summary>Code</summary>

```dart
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
``` 

</details>

## Docs
| key         | value      | Deskripsi | `required` |
| ----------- |:----------:|:----------|:----------:|
| `@type` | [widget](#widget) |  | `yes` |
| `root` | object di dalam array [metod]() | | `no` |

### Widget

#### Scaffold
| key         | value      | Deskripsi | `required` |
| ----------- |:----------:|:----------|:----------:|
| `@type` | `scaffold` |  | `yes` |
| `body` | [Widget](#widget) | | `yes` |

#### Container
| key         | value      | Deskripsi | `required` |
| ----------- |:----------:|:----------|:----------:|
| `@type` | `container` |  | `yes` |
| `child` | [Widget](#widget) | | `yes` |

#### Text
| key         | value      | Deskripsi | `required` |
| ----------- |:----------:|:----------|:----------:|
| `@type` | `text` |  | `yes` |
| `text` | string | | `yes` |

#### Column
| key         | value      | Deskripsi | `required` |
| ----------- |:----------:|:----------|:----------:|
| `@type` | must be `Column` |  | `yes` |
| `children` | List array of [Widget](#widget) | | `yes` |

#### Row
| key         | value      | Deskripsi | `required` |
| ----------- |:----------:|:----------|:----------:|
| `@type` | `Row` |  | `yes` |
| `children` | List array of [Widget](#widget) | | `yes` |