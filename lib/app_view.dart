library app_view;

import 'package:flutter/material.dart';

/// json to widget StatelessWidget
class JsonToWidget extends StatelessWidget {
  final Map data;
  const JsonToWidget(
    this.data, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return jsonToWidget(data);
  }
}

/// json to widget function
Widget jsonToWidget(dynamic data) {
  if (data is Widget) {
    return data;
  }
  if (data is Map) {
    if (data["@type"] is String) {
      String type = data["@type"];
      if (RegExp(r"^(helloWorld)$", caseSensitive: false).hasMatch(type)) {}

      if (RegExp(r"^(MaterialApp)$", caseSensitive: false).hasMatch(type)) {
        return MaterialApp(
          home: jsonToWidget(data["home"]),
          debugShowCheckedModeBanner: (data["debugShowCheckedModeBanner"] == false) ? false : true,
        );
      }
      if (RegExp(r"^(Scaffold)$", caseSensitive: false).hasMatch(type)) {
        return Scaffold(
          body: jsonToWidget(data["body"]),
          floatingActionButton: jsonToWidget(data["floatingActionButton"]),
        );
      }
      if (RegExp(r"^(Container)$", caseSensitive: false).hasMatch(type)) {
        return Container(
          child: jsonToWidget(data["child"]),
        );
      }
      if (RegExp(r"^(FloatingActionButton)$", caseSensitive: false).hasMatch(type)) {
        return FloatingActionButton(
          onPressed: data["onPressed"],
          tooltip: data["tooltip"],
          child: jsonToWidget(data["child"]),
        );
      }
      if (RegExp(r"^(Center)$", caseSensitive: false).hasMatch(type)) {
        return Center(
          child: jsonToWidget(data["child"]),
        );
      }

      if (RegExp(r"^(Padding)$", caseSensitive: false).hasMatch(type)) {
        return Padding(
          padding: jsonToEdgeInsetsGeometry(data["padding"]),
          child: jsonToWidget(data["child"]),
        );
      }

      if (RegExp(r"^(Text)$", caseSensitive: false).hasMatch(type)) {
        return Text("${data["data"]}");
      }

      if (RegExp(r"^(Column|Row)$", caseSensitive: false).hasMatch(type)) {
        late List<Widget> children = [];
        if (data["children"] is List<Map>) {
          for (var i = 0; i < (data["children"] as List<Map>).length; i++) {
            // ignore: non_constant_identifier_names
            var loop_data = (data["children"] as List<Map>)[i];
            try {
              children.add(jsonToWidget(loop_data));
            } catch (e) {}
          }
        }
        if (RegExp(r"^(Row)$", caseSensitive: false).hasMatch(type)) {
          return Row(
            children: children,
          );
        }
        return Column(
          children: children,
        );
      }
    }
  }
  return Container();
}

/// json to EdgeInsetGeometry
EdgeInsetsGeometry jsonToEdgeInsetsGeometry(Map? data) {
  data ??= {};
  if (data["@type"] is String) {
    String type = data["@type"];
    late double value = 0;
    if (data["value"] is num) {
      value = (data["value"] as num).toDouble();
    }
    late double vertical = 0;
    if (data["vertical"] is num) {
      vertical = (data["vertical"] as num).toDouble();
    }
    late double horizontal = 0;
    if (data["horizontal"] is num) {
      horizontal = (data["horizontal"] as num).toDouble();
    }
    late double top = 0;
    if (data["top"] is num) {
      top = (data["top"] as num).toDouble();
    }
    late double left = 0;
    if (data["left"] is num) {
      left = (data["left"] as num).toDouble();
    }
    late double right = 0;
    if (data["right"] is num) {
      right = (data["right"] as num).toDouble();
    }
    late double bottom = 0;
    if (data["bottom"] is num) {
      bottom = (data["bottom"] as num).toDouble();
    }

    if (RegExp(r"^(EdgeInsets.all)$", caseSensitive: false).hasMatch(type)) {
      return EdgeInsets.all(value);
    }
    if (RegExp(r"^(EdgeInsets.symmetric)$", caseSensitive: false).hasMatch(type)) {
      return EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal);
    }
    if (RegExp(r"^(EdgeInsets.only)$", caseSensitive: false).hasMatch(type)) {
      return EdgeInsets.only(top: top, left: left, right: right, bottom: bottom);
    }
  }
  return const EdgeInsets.all(0);
}