import 'package:ecommercegetxyape/app/routes/app_pages.dart';
import 'package:ecommercegetxyape/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MaterialColor buildMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.INITIAL,
      theme: ThemeData(
          primarySwatch: buildMaterialColor(Color(0x00ffE63E6D)),
          primaryColor: Color(0x00ff7D1935),
          scaffoldBackgroundColor: Color(0x00ff420516),
          backgroundColor: Color(0x00ffB42B51),
          accentColor: Color(0x00ffE63E6D),
          textTheme: TextTheme(
            button: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
              color: Color(0x00ff420516),
            ),
            headline1: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Color(0x00ffE63E6D),
            ),
            headline2: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color(0x00ffE63E6D),
            ),
            bodyText1: TextStyle(
              fontSize: 14.0,
              color: Color(0x00ffB42B51),
            ),
            labelMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: Color(0x00ff420516),
            ),
            caption: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
              color: Color(0x00ffE63E6D),
            ),
          )),
      getPages: AppPages.pages,
    );
  }
}
