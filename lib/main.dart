import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'components/config/pallete.dart';
import 'pages/homepage.dart';
import 'core/base/base_stateful.dart';
import 'pages/history/history.dart';
import 'pages/qr_code_generator/qr_code_generator.dart';
// import 'pages/qr_code_scanner/qr_code_scanner.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends BaseStateful<MyApp> {
  final SnakeBarBehaviour _snakeBarStyle = SnakeBarBehaviour.floating;
  final SnakeShape _snakeShape = SnakeShape.circle;

  final ShapeBorder? _bottomBarShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  );

  final EdgeInsets _padding = const EdgeInsets.all(12);

  final Color _unselectedColor = kSecondaryDark;

  final bool _showSelectedLabels = false;
  final bool _showUnselectedLabels = false;

  int _selectedItemPosition = 1;

  final List<BottomNavigationBarItem> _bottomNavigationBarItems = [
    BottomNavigationBarItem(icon: Icon(Icons.qr_code_rounded), label: 'QR Generator'),
    BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner_rounded), label: 'QR Scanner'),
    BottomNavigationBarItem(icon: Icon(Icons.history_rounded), label: 'History'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SecQR',
      theme: ThemeData(
        primarySwatch: generateMaterialColor(kPrimaryDark),
        scaffoldBackgroundColor: Colors.deepPurple[50],
      ),
      // theme: buildThemeData(),
      color: kPrimaryLight,
      home: Scaffold(
        body: _selectedItemPosition == 0
            ? QrCodeGenerator() //+Add method calendar
            : _selectedItemPosition == 1
                ? HomePage()
                : History(),
        
        bottomNavigationBar: SnakeNavigationBar.color(
          behaviour: _snakeBarStyle,
          snakeShape: _snakeShape,
          shape: _bottomBarShape,
          padding: _padding,
          unselectedItemColor: _unselectedColor,
          showSelectedLabels: _showSelectedLabels,
          backgroundColor: kSecondaryLight,

          showUnselectedLabels: _showUnselectedLabels,
          currentIndex: _selectedItemPosition,
          onTap: (index) => setState(() => {
                _selectedItemPosition = index,
              }),
          items: _bottomNavigationBarItems,
          snakeViewColor: kSecondaryDark,
        ),
      ),
    );
  }

  //Add dark theme
  // ThemeData buildThemeData(){
  //   final baseTheme = ThemeData.light();
    
  //   return baseTheme.copyWith(
  //     primaryColor: kPrimaryColor,
  //     primaryColorDark: kPrimaryDark,
  //     primaryColorLight: kPrimaryLight 
  // );
}

MaterialColor generateMaterialColor(Color color) {
    return MaterialColor(color.value, {
      50: tintColor(color, 0.9),
      100: tintColor(color, 0.8),
      200: tintColor(color, 0.6),
      300: tintColor(color, 0.4),
      400: tintColor(color, 0.2),
      500: color,
      600: shadeColor(color, 0.1),
      700: shadeColor(color, 0.2),
      800: shadeColor(color, 0.3),
      900: shadeColor(color, 0.4),
    });
  }

  int tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  Color tintColor(Color color, double factor) => Color.fromRGBO(
      tintValue(color.red, factor),
      tintValue(color.green, factor),
      tintValue(color.blue, factor),
      1);

  int shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  Color shadeColor(Color color, double factor) => Color.fromRGBO(
      shadeValue(color.red, factor),
      shadeValue(color.green, factor),
      shadeValue(color.blue, factor),
      1);

