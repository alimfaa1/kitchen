import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VideoWebViewScreen extends StatefulWidget {
  final String videoUrl;

  const VideoWebViewScreen({super.key, required this.videoUrl});

  @override
  State<VideoWebViewScreen> createState() => _VideoWebViewScreenState();
}

class _VideoWebViewScreenState extends State<VideoWebViewScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..loadRequest(Uri.parse(widget.videoUrl))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('مشاهدة الفيديو')),
      body: WebViewWidget(controller: _controller),
    );
  }
}
