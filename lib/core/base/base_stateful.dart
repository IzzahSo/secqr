import 'package:flutter/material.dart';
import '../../core/database/database_helper.dart';
import '../../model/barcode_model.dart';
import '../image/image_constants.dart';
import '../localization/application_strings.dart';

abstract class BaseStateful<T extends StatefulWidget> extends State<T> {
  ApplicationStrings applicationStrings = ApplicationStrings.instance;
  DatabaseHelper databaseHelper = DatabaseHelper();

  //tweak here
  TextTheme get textTheme => Theme.of(context).textTheme;
  ThemeData get theme => Theme.of(context);
  ColorScheme get colorSchema => Theme.of(context).colorScheme;

  ImageConstants imageConstants = ImageConstants.instance;

  EdgeInsets insetsAll = EdgeInsets.all(30);

  double dynamicHeight(double val) => MediaQuery.of(context).size.height * val;
  double dynamicWidth(double val) => MediaQuery.of(context).size.width * val;

  /// type == 1 scanned, type == 0 generated
  void setLocalStorage(String qrCodeData, int type) async {
    final qrData = BarcodeModel(qrCodeData, type);
    await databaseHelper.insert(qrData);
  }
}
