import 'package:flutter/material.dart';
import '../../components/base_scaffold_widget.dart';
import '../../components/qr_image_creator.dart';
import '../../model/barcode_model.dart';
import 'history_view_model.dart';

class HistoryView extends HistoryViewModel {
  @override
  Widget build(BuildContext context) {
    return BaseScaffoldWidget(
      title: applicationStrings.history,
      body: FutureBuilder(
        future: databaseHelper.get(),
        builder: (BuildContext context, AsyncSnapshot<List<BarcodeModel>> snapshot) {
          if (!snapshot.hasData) {
            return buildCenterCircularProgressIndicator();
          }
          if (snapshot.data!.isEmpty) {
            return buildNoDataCenterText();
          }
          return buildListViewWithHistoryData(snapshot);
        },
      ),
    );
  }

  ListView buildListViewWithHistoryData(snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, int index) {
        var barcode = snapshot.data[index];
        return GestureDetector(
          onLongPress: () {
            setState(() {
              deleteBarcode(barcode.id);
            });
          },
          child: buildCardListTile(barcode),
        );
      },
    );
  }

  Card buildCardListTile(barcode) {
    return Card(
      child: ListTile(
        leading: QrImageCreator(data: barcode.data.toString(), type: 2),
        title: Text(barcode.data),
        subtitle: Text(barcode.type == 0 ? applicationStrings.generated : applicationStrings.scanned),
      ),
    );
  }

  Center buildCenterCircularProgressIndicator() => Center(child: CircularProgressIndicator());
  Center buildNoDataCenterText() => Center(child: Text(applicationStrings.noData));
}
