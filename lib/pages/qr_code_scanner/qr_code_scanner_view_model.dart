import 'package:clipboard/clipboard.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import '../../core/base/base_stateful.dart';
import 'package:share/share.dart';
import 'qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class QrCodeScannerViewModel extends BaseStateful<QrCodeScanner> {
  bool isShowQrScanner = true;
  String qrCodeData = '';

  Future<void> openQrScanner() async {
    try {
      final qrData = await FlutterBarcodeScanner.scanBarcode('#FF0000', applicationStrings.cancel, true, ScanMode.DEFAULT);

      if (!mounted) return;

      setState(() {
        qrCodeData = qrData;
        setLocalStorage(qrCodeData, 1);
        changeScreen();
      });
    } on PlatformException {
      qrCodeData = '';
    }
  }

  /// Select which function will trigger by index
  void triggerFunction(index) {
    switch (index) {
      case 0:
        openWithBrowser();
        break;
      case 1:
        share();
        break;
      case 2:
        clipboard('data');
        break;
      case 3:
        changeScreen();
        break;
      default:
        throw ('unexpected issue');
    }
  }

//tweak: depends on status
  void openWithBrowser() async => await canLaunch(qrCodeData) ? await launch(qrCodeData) : throw 'Could not launch $qrCodeData';

  void share() => Share.share('$qrCodeData');

  void clipboard(data) => FlutterClipboard.copy(qrCodeData);
  void changeScreen() => setState(() {
        isShowQrScanner = !isShowQrScanner;
      });
}
