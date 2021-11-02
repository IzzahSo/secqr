import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/base_scaffold_widget.dart';
import '../../components/qr_image_creator.dart';
import 'qr_code_scanner_view_model.dart';

class QrCodeScannerView extends QrCodeScannerViewModel {
  @override
  Widget build(BuildContext context) {
    return BaseScaffoldWidget(
      title: applicationStrings.scanQr,
      body: isShowQrScanner ? buildOpenScannerButton() : buildQrResult(context),
    );
  }

  Column buildQrResult(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 1, child: QrImageCreator(data: qrCodeData, type: 0)),
        Expanded(flex: 1, child: buildQrResultDataCard(context)),
        Expanded(flex: 2, child: buildButtons()),
      ],
    );
  }

  Container buildQrResultDataCard(BuildContext context) {
    return Container(
      width: dynamicWidth(1),
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.02),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(applicationStrings.qrResult),
            Text(qrCodeData),
          ],
        ),
      ),
    );
  }

  Column buildButtons() {
    return Column(
      children: [
        buildElevatedButtonIcon(0, Icon(Icons.language), applicationStrings.openWithBrowser),
        buildElevatedButtonIcon(1, Icon(Icons.share), applicationStrings.share),
        buildElevatedButtonIcon(2, Icon(Icons.copy), applicationStrings.copy),
        buildElevatedButtonIcon(3, Icon(Icons.qr_code_scanner_rounded), applicationStrings.backToQrScanner),
      ],
    );
  }

  SizedBox buildElevatedButtonIcon(int index, Widget icon, String label) {
    return SizedBox(
      width: dynamicWidth(1),
      child: ElevatedButton.icon(
        onPressed: () {
          triggerFunction(index);
        },
        icon: icon,
        label: Text(label),
      ),
    );
  }
  //build text 'Scan your QR code here'
  InkWell buildOpenScannerButton() {
    return InkWell(
      onTap: () {
        openQrScanner();
      },
      child: SvgPicture.asset(
        imageConstants.barcodeImage,
        width: dynamicWidth(0.5),
      ),
    );
  }
}
