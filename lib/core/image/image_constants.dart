class ImageConstants {
  static ImageConstants? _instace;
  static ImageConstants get instance {
    if (_instace != null) return _instace!;
    _instace = ImageConstants._init();
    return _instace!;
  }

  ImageConstants._init();

//tukar logo secqr
  final secqrLogo = 'secqr'.toPng;
  final barcodeImage = 'barcode'.toSvg;
  final qrCodeImage = 'qrcode'.toSvg;
}

extension _ImageExtension on String {
  // Add to png path on image string
  String get toPng => 'assets/images/$this.png';
  String get toSvg => 'assets/images/$this.svg';
}
