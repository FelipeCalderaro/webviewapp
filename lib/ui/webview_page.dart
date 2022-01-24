import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webviewapp/core/cubit/products_cubit.dart';
import 'package:webviewapp/core/values.dart';
import 'package:webviewapp/ui/bar_code_reader.dart';

class WebviewPage extends StatefulWidget {
  final String initialUrl;
  final String title;

  WebviewPage({
    this.initialUrl = BASE_URL,
    required this.title,
  });
  @override
  State<WebviewPage> createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  late WebViewController _webViewController;
  Future<void> scan(BuildContext context) async {
    final scanResult = await BarcodeScanner.scan();
    var url = BlocProvider.of<ProductsCubit>(context)
        .productList
        .listaProdutos
        .where((element) => element.cod == scanResult.rawContent);
    if (url.isNotEmpty) {
      await _webViewController.loadUrl('https://${url.first.url}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state.when(
          loading: () => const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          loaded: () => Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xfffed605),
              centerTitle: true,
              title: Text(
                widget.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: widget.initialUrl,
              navigationDelegate: (navigation) {
                if (navigation.url.contains(widget.initialUrl)) {
                  return NavigationDecision.navigate;
                } else {
                  return NavigationDecision.prevent;
                }
              },
              onWebViewCreated: (controller) {
                setState(() => _webViewController = controller);
              },
            ),
            floatingActionButton: widget.initialUrl == BASE_URL
                ? FloatingActionButton(
                    backgroundColor: const Color(0xfffed605),
                    child: const Icon(
                      Icons.qr_code_scanner,
                      color: Colors.black,
                    ),
                    onPressed: () => scan(context),
                  )
                : Container(),
          ),
          noInternet: () => const Scaffold(
            body: Center(
              child: Text('Conecte-se a internet primeiro'),
            ),
          ),
        );
      },
    );
  }
}
