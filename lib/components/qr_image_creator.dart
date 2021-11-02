import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../core/localization/application_strings.dart';

class QrImageCreator extends StatelessWidget {
  final String data;
  final int type;
  static const historySize = Size(5, 5);
  static const otherSize = Size(20, 20);

  const QrImageCreator({required this.data, required this.type});

  //tambah encrypted
  @override
  Widget build(BuildContext context) {
    return QrImage(
      data: data,
      version: QrVersions.auto,
      size: type == 0
          ? MediaQuery.of(context).size.width * 0.4
          : type == 1
              ? MediaQuery.of(context).size.width * 0.5
              : MediaQuery.of(context).size.width * 0.2,
      gapless: true,
      embeddedImage: AssetImage(ApplicationStrings.embeddedImageUrl),
      embeddedImageStyle: QrEmbeddedImageStyle(
        size: (type == 0 || type == 1) ? otherSize : historySize,
      ),
    );
  }
}
