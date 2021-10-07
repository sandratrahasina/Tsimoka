import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:tsimoka/custom_widget/app_bar_custom.dart';

import 'package:tsimoka/utils/_var.dart';


class QRScanPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  String qrCode = 'Paysan inconnue';

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBarCustom(),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text( 'Resultat', style: TextStyle( fontSize: 16, color: mainThemeColor, ), ),

          const SizedBox(height: 8),

          Center(
            child: Text( qrCode, style: TextStyle( fontSize: 28, color: mainThemeColor, ), ),
          ),

          const SizedBox(height: 100),

          TextButton( 
            child: const Text('Lancer le scan', ), 
            onPressed: () => scanQRCode(), 
          ),
        ],
      ),
    ),
  );

  Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      setState(() {
        this.qrCode = qrCode;
      });
    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }
  }
}