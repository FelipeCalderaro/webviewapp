import 'package:flutter/material.dart';
import 'package:webviewapp/core/values.dart';
import 'package:webviewapp/ui/webview_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void confirmDialog(String url, String title, BuildContext context) =>
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            "Deseja mesmo continuar para $title?",
            textAlign: TextAlign.center,
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextButton(
              style: TextButton.styleFrom(primary: const Color(0xffeec504)),
              onPressed: () => Navigator.pop(context),
              child: const Text("Voltar"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: const Color(0xfffed605)),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WebviewPage(
                      title: title,
                      initialUrl: url,
                    ),
                  ),
                );
              },
              child: const Text(
                "Continuar",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfffed605),
        centerTitle: true,
        title: const Text(
          'Empório Express',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        color: const Color(0xfffed605).withAlpha(40),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Escolha a unidade",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xfffed605),
                ),
                onPressed: () => confirmDialog(
                  BASE_URL,
                  "Sítio dos Rosarinhos",
                  context,
                ),
                child: const Text(
                  "Sítio dos Rosarinhos",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xfffed605),
                ),
                onPressed: () => confirmDialog(
                  "$BASE_URL/varanda",
                  "Varanda Paiva",
                  context,
                ),
                child: const Text(
                  "Varanda Paiva",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xfffed605),
                ),
                onPressed: () => confirmDialog(
                  "$BASE_URL/viacapibaribe/",
                  "Via Capibaribe",
                  context,
                ),
                child: const Text(
                  "Via Capibaribe",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
