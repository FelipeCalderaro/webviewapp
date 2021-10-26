import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/material.dart';

class BarCodeReader extends StatefulWidget {
  @override
  State<BarCodeReader> createState() => _BarCodeReaderState();
}

class _BarCodeReaderState extends State<BarCodeReader> {
  Future<void> scan() async {
    var result = await BarcodeScanner.scan();
    print("RESULT: ----->>> ${result.format}");
    print("RESULT: ----->>> ${result.formatNote}");
    print("RESULT: ----->>> ${result.rawContent}");
    print("RESULT: ----->>> ${result.type}");
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Leitor de codigo de barras"),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () => scan(),
            child: Text('a'),
          ),
        ));
  }
}
