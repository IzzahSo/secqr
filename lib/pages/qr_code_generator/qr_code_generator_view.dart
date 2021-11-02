import 'package:flutter/material.dart';
import '../../components/base_scaffold_widget.dart';
import '../../components/qr_image_creator.dart';
import 'qr_code_generator_view_model.dart';

class QrCodeGeneratorView extends QrCodeGeneratorViewModel {
  @override
  Widget build(BuildContext context) {
    return BaseScaffoldWidget(
      title: applicationStrings.createQr,
      body: buildColumn(),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isShowQrGenerator ? buildQrCodeEditor() : buildQrCodeImageCreator(),
        buildElevatedButton(),
      ],
    );
  }

  ElevatedButton buildElevatedButton() {
    return ElevatedButton(
      onPressed: () {
        if (qrData.text.isNotEmpty) changeScreen();
      },
      child: buildElevatedButtonText(),
    );
  }

  Text buildElevatedButtonText() => Text(isShowQrGenerator ? applicationStrings.createQr : applicationStrings.backToQrGenerator);

  Widget buildQrCodeImageCreator() => QrImageCreator(data: qrData.text, type: 1);

  Widget buildQrCodeEditor() => TextField(controller: qrData);
}
