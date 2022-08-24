library app_view;

import 'package:flutter/gestures.dart';
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
  var res = request(data);
  if (res is Widget) {
    return res;
  }
  return Container();
}

bool isMatch(String data, String value) {
  try {
    return RegExp("^($data)\$", caseSensitive: false).hasMatch(value);
  } catch (e) {
    return false;
  }
}

/// json or native dart widget reqturn widget or null
dynamic request(dynamic data, {dynamic defaultData, dynamic expectData, bool allowResultNull = true}) {
  if (data is Map) {
    if (data["@type"] is String) {
      String type = data["@type"];
      // completed
      if (isMatch("MaterialApp", type)) {
        return MaterialApp(
          key: request(data["key"]),
          navigatorKey: request(data["navigatorKey"]),
          scaffoldMessengerKey: request(data["scaffoldMessengerKey"]),
          home: request(data["home"]),
          routes: request(data["routes"], defaultData: const <String, WidgetBuilder>{}),
          initialRoute: request(data["initialRoute"]),
          onGenerateRoute: request(data["onGenerateRoute"]),
          onGenerateInitialRoutes: request(data["onGenerateInitialRoutes"]),
          onUnknownRoute: request(data["onUnknownRoute"]),
          navigatorObservers: request(data["navigatorObservers"], defaultData: const <NavigatorObserver>[]),
          builder: request(data["builder"]),
          title: request(data["title"], defaultData: ""),
          onGenerateTitle: request(data["onGenerateTitle"]),
          color: request(data["color"]),
          theme: request(data["theme"]),
          darkTheme: request(data["darkTheme"]),
          highContrastTheme: request(data["highContrastTheme"]),
          highContrastDarkTheme: request(data["highContrastDarkTheme"]),
          themeMode: request(data["themeMode"], defaultData: ThemeMode.system),
          locale: request(data["locale"]),
          localizationsDelegates: request(data["localizationsDelegates"]),
          localeListResolutionCallback: request(data["localeListResolutionCallback"]),
          localeResolutionCallback: request(data["localeResolutionCallback"]),
          supportedLocales: request(data["supportedLocales"], defaultData: const <Locale>[Locale('en', 'US')]),
          debugShowMaterialGrid: request(data["debugShowMaterialGrid"], defaultData: false),
          showPerformanceOverlay: request(data["showPerformanceOverlay"], defaultData: false),
          checkerboardRasterCacheImages: request(data["checkerboardRasterCacheImages"], defaultData: false),
          checkerboardOffscreenLayers: request(data["checkerboardOffscreenLayers"], defaultData: false),
          showSemanticsDebugger: request(data["showSemanticsDebugger"], defaultData: false),
          debugShowCheckedModeBanner: request(data["debugShowCheckedModeBanner"], defaultData: true),
          shortcuts: request(data["shortcuts"]),
          actions: request(data["actions"]),
          restorationScopeId: request(data["restorationScopeId"]),
          scrollBehavior: request(data["scrollBehavior"]),
          useInheritedMediaQuery: request(data["useInheritedMediaQuery"], defaultData: false),
        );
      }
      if (isMatch("Scaffold", type)) {
        return Scaffold(
          key: request(data["key"]),
          appBar: request(data["appBar"]),
          body: request(data["body"]),
          floatingActionButton: request(data["floatingActionButton"]),
          floatingActionButtonLocation: request(data["floatingActionButtonLocation"]),
          floatingActionButtonAnimator: request(data["floatingActionButtonAnimator"]),
          persistentFooterButtons: request(data["persistentFooterButtons"]),
          drawer: request(data["drawer"]),
          onDrawerChanged: request(data["onDrawerChanged"]),
          endDrawer: request(data["endDrawer"]),
          onEndDrawerChanged: request(data["onEndDrawerChanged"]),
          bottomNavigationBar: request(data["bottomNavigationBar"]),
          bottomSheet: request(data["bottomSheet"]),
          backgroundColor: request(data["backgroundColor"]),
          resizeToAvoidBottomInset: request(data["resizeToAvoidBottomInset"]),
          primary: request(data["primary"], defaultData: true),
          drawerDragStartBehavior: request(data["drawerDragStartBehavior"], defaultData: DragStartBehavior.start),
          extendBody: request(data["extendBody"], defaultData: false),
          extendBodyBehindAppBar: request(data["extendBodyBehindAppBar"], defaultData: false),
          drawerScrimColor: request(data["drawerScrimColor"]),
          drawerEdgeDragWidth: request(data["drawerEdgeDragWidth"]),
          drawerEnableOpenDragGesture: request(data["drawerEnableOpenDragGesture"], defaultData: true),
          endDrawerEnableOpenDragGesture: request(data["endDrawerEnableOpenDragGesture"], defaultData: true),
          restorationId: request(data["restorationId"]),
        );
      }
      if (isMatch("Container", type)) {
        return Container(
          key: request(
            data["key"],
          ),
          alignment: jsonToAlignmentGeometry(data["alignment"]),
          padding: jsonToEdgeInsetsGeometry(data["padding"]),
          color: request(data["color"]),
          decoration: request(data["decoration"]),
          foregroundDecoration: request(data["foregroundDecoration"]),
          height: jsonToDouble(data["height"]),
          width: jsonToDouble(data["width"]),
          constraints: request(data["constraints"]),
          margin: request(data["margin"]),
          transform: request(data["transform"]),
          transformAlignment: request(data["transformAlignment"]),
          child: request(
            data["child"],
          ),
          clipBehavior: request(
            data["clipBehavior"],
            defaultData: Clip.none,
          ),
        );
      }

      /// 100 completed
      if (isMatch("FloatingActionButton", type)) {
        return FloatingActionButton(
          key: request(data["key"]),
          child: request(data["child"]),
          tooltip: request(data["tooltip"]),
          foregroundColor: request(data["foregroundColor"]),
          focusColor: request(data["focusColor"]),
          hoverColor: request(data["hoverColor"]),
          splashColor: request(data["splashColor"]),
          elevation: request(data["elevation"]),
          focusElevation: request(data["focusElevation"]),
          hoverElevation: request(data["hoverElevation"]),
          highlightElevation: request(data["highlightElevation"]),
          disabledElevation: request(data["disabledElevation"]),
          onPressed: request(data["onPressed"], defaultData: () {}),
          mouseCursor: request(data["mouseCursor"]),
          mini: request(data["mini"], defaultData: false),
          shape: request(data["shape"]),
          clipBehavior: request(data["clipBehavior"], defaultData: Clip.none),
          focusNode: request(data["focusNode"]),
          autofocus: request(data["autofocus"], defaultData: false),
          materialTapTargetSize: request(data["materialTapTargetSize"]),
          isExtended: request(data["isExtended"], defaultData: false),
          enableFeedback: request(data["enableFeedback"]),
        );
      }
      if (isMatch("Center", type)) {
        return Center(
          key: request(data["key"]),
          widthFactor: jsonToDouble(data["widthFactor"]),
          heightFactor: jsonToDouble(data["heightFactor"]),
          child: request(data["child"]),
        );
      }
      if (isMatch("Padding", type)) {
        return Padding(
          padding: jsonToEdgeInsetsGeometry(data["padding"]) ?? const EdgeInsets.all(0),
          child: request(data["child"]),
        );
      }

      if (isMatch("Icon", type)) {
        return Icon(
          request(data["data"]),
          key: request(data["key"]),
          size: request(data["size"]),
          color: request(data["color"]),
          semanticLabel: request(data["semanticLabel"]),
          textDirection: request(data["textDirection"]),
          shadows: request(data["shadows"]),
        );
      }
      if (isMatch("Text", type)) {
        return Text(
          "${data["data"]}",
          key: request(data["key"]),
          style: request(data["style"]),
          strutStyle: request(data["strutStyle"]),
          textAlign: request(data["textAlign"]),
          textDirection: request(data["textDirection"]),
          locale: request(data["locale"]),
          softWrap: request(data["softWrap"]),
          overflow: request(data["overflow"]),
          textScaleFactor: request(data["textScaleFactor"]),
          maxLines: request(data["maxLines"]),
          semanticsLabel: request(data["semanticsLabel"]),
          textWidthBasis: request(data["textWidthBasis"]),
          textHeightBehavior: request(data["textHeightBehavior"]),
        );
      }

      if (isMatch("Column|Row", type)) {
        late List<Widget> children = [];
        if (data["children"] is List<Map>) {
          for (var i = 0; i < (data["children"] as List<Map>).length; i++) {
            // ignore: non_constant_identifier_names
            var loop_data = (data["children"] as List<Map>)[i];
            try {
              children.add(request(loop_data));
            } catch (e) {}
          }
        }
        if (isMatch("Row", type)) {
          return Row(
            key: request(data["key"]),
            mainAxisAlignment: request(data["mainAxisAlignment"], defaultData: MainAxisAlignment.start),
            mainAxisSize: request(data["mainAxisSize"], defaultData: MainAxisSize.max),
            crossAxisAlignment: request(data["crossAxisAlignment"], defaultData: CrossAxisAlignment.center),
            textDirection: request(data["textDirection"]),
            verticalDirection: request(data["verticalDirection"], defaultData: VerticalDirection.down),
            textBaseline: request(data["textBaseline"]),
            children: children,
          );
        }
        return Column(
          key: request(data["key"]),
          mainAxisAlignment: request(data["mainAxisAlignment"], defaultData: MainAxisAlignment.start),
          mainAxisSize: request(data["mainAxisSize"], defaultData: MainAxisSize.max),
          crossAxisAlignment: request(data["crossAxisAlignment"], defaultData: CrossAxisAlignment.center),
          textDirection: request(data["textDirection"]),
          verticalDirection: request(data["verticalDirection"], defaultData: VerticalDirection.down),
          textBaseline: request(data["textBaseline"]),
          children: children,
        );
      }
    }
  }
  if (data == null) {
    return defaultData;
  }
  return data;
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
