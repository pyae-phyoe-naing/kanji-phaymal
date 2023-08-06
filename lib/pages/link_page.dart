import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LinkPage extends StatefulWidget {
  const LinkPage({super.key});

  @override
  State<LinkPage> createState() => _LinkPageState();
}

class _LinkPageState extends State<LinkPage> {
  late WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(Uri.parse("https://jlptsensei.com/"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
