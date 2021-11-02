import 'package:flutter/material.dart';
import 'package:qrcookie_v2/components/config/pallete.dart';
import '../../pages/qr_code_generator/qr_code_generator.dart';
import '../../pages/qr_code_scanner/qr_code_scanner.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text('SecQR'),
      centerTitle: true,
    ),
    body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/secqr.png'),
            flatButton('Scan QR CODE', QrCodeScanner()),
            SizedBox(height: 20.0),
            flatButton('Generate QR CODE', QrCodeGenerator()),
          ],
        ),
      ),
    );
  }

  Widget flatButton(String text, Widget widget) {
    // ignore: deprecated_member_use
    return FlatButton(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        focusColor: kPrimaryColor,
        highlightColor: kSecondaryColor,
        hoverColor: kSecondaryLight,
        splashColor: Colors.blueGrey,
        onPressed: () async {
          await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => widget));
        },
        // ignore: sort_child_properties_last
        child: Text(
          text,
          style: TextStyle(
              color: kPrimaryDark, fontSize: 15, fontWeight: FontWeight.bold),
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: kSecondaryDark, width: 3.0),
          borderRadius: BorderRadius.circular(15.0),
        ));
  }

}