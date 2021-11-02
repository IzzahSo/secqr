class ApplicationStrings {
  static ApplicationStrings? _instace;
  static ApplicationStrings get instance {
    if (_instace != null) return _instace!;
    _instace = ApplicationStrings._init();
    return _instace!;
  }

  ApplicationStrings._init();

  //tukar image secqr
  static const String embeddedImageUrl = 'assets/images/secqr.png';

  /// Qr Code Generator
  final String createQr = 'Qr Generator';
  final String backToQrGenerator = 'Return to generate QR ';

  /// Qr Code Scanner
  final String scanQr = 'QR Scanner';
  final String qrResult = 'Result';
  final String barcodeType = 'Barode Type';
  final String openWithBrowser = 'Open URL';
  final String share = 'Share';
  final String copy = 'Copy';
  final String backToQrScanner = 'Return to scan QR';
  final String cancel = 'Cancel';
  // final String status = 'Status'

  /// History
  final String history = 'History';
  final String noData = 'No Data Found';
  final String scanned = 'Scanned QR code';
  final String generated = 'Generated QR code';

  /// Database
  static const String database = 'secqr.db';
  static const String databaseTable = 'Barcodes';
  static const String databaseCreateQuery = 'CREATE TABLE $databaseTable(id INTEGER PRIMARY KEY, data INTEGER, type INTEGER)';
}
