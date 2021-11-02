class BarcodeModel {
  int? id;
  String? data;

  /// type == 1 scanned, type == 0 generated
  int? type;

  BarcodeModel(this.data, this.type);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['data'] = data;
    map['type'] = type;
    return map;
  }

  BarcodeModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    data = map['data'];
    type = map['type'];
  }
}
