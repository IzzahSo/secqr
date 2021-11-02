import 'package:flutter/material.dart';
import '../../core/base/base_stateful.dart';
import 'qr_code_generator.dart';

abstract class QrCodeGeneratorViewModel extends BaseStateful<QrCodeGenerator> {
  bool isShowQrGenerator = true;
  late TextEditingController qrData;

  @override
  void initState() {
    super.initState();
    qrData = TextEditingController();
  }

  void changeScreen() {
    setState(() {
      setLocalStorage(qrData.text, 0);
      isShowQrGenerator = !isShowQrGenerator;
    });
  }
}
