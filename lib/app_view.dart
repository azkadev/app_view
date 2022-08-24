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
          alignment: jsonToAlignmentGeometry(data["alignment"]),
          padding: jsonToEdgeInsetsGeometry(data["padding"]),
          height: jsonToDouble(data["height"]),
          width: jsonToDouble(data["width"]),
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
          padding: jsonToEdgeInsetsGeometry(data["padding"]) ?? const EdgeInsets.all(0),
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
EdgeInsetsGeometry? jsonToEdgeInsetsGeometry(dynamic data) {
  if (data is EdgeInsetsGeometry) {
    return data;
  }
  if (data is Map) {
    if (data["@type"] is String) {
      String type = data["@type"];
      if (RegExp(r"^(EdgeInsets.all)$", caseSensitive: false).hasMatch(type)) {
        return EdgeInsets.all(jsonToDouble(data["value"]) ?? 0.0);
      }
      if (RegExp(r"^(EdgeInsets.symmetric)$", caseSensitive: false).hasMatch(type)) {
        return EdgeInsets.symmetric(vertical: jsonToDouble(data["vertical"]) ?? 0.0, horizontal: jsonToDouble(data["horizontal"]) ?? 0.0);
      }
      if (RegExp(r"^(EdgeInsets.only)$", caseSensitive: false).hasMatch(type)) {
        return EdgeInsets.only(
          top: jsonToDouble(data["top"]) ?? 0.0,
          left: jsonToDouble(data["left"]) ?? 0.0,
          right: jsonToDouble(data["right"]) ?? 0.0,
          bottom: jsonToDouble(data["bottom"]) ?? 0.0,
        );
      }
    }
  }
  return const EdgeInsets.all(0);
}

/// json to EdgeInsetGeometry
AlignmentGeometry? jsonToAlignmentGeometry(dynamic data) {
  if (data is AlignmentGeometry) {
    return data;
  }
  if (data is Map) {
    if (data["@type"] is String) {
      String type = data["@type"];
    }
  }
  return null;
}

double? jsonToDouble(dynamic value) {
  if (value is String) {
    if (RegExp(r"[0-9]+", caseSensitive: false).hasMatch(value)) {
      return int.parse(RegExp(r"[0-9]+", caseSensitive: false).stringMatch(value) ?? "0").toDouble();
    }
  }
  if (value is num) {
    return value.toDouble();
  }
  return null;
}

int? jsonToInt(dynamic value) {
  if (value is String) {
    if (RegExp(r"[0-9]+", caseSensitive: false).hasMatch(value)) {
      return int.parse(RegExp(r"[0-9]+", caseSensitive: false).stringMatch(value) ?? "0");
    }
  }
  if (value is num) {
    return value.toInt();
  }
  return null;
}
