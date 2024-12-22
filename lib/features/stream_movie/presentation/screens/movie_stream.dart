import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MovieStreamPage extends StatefulWidget {
  final String streamUrl;
  const MovieStreamPage({super.key, required this.streamUrl});

  @override
  State<MovieStreamPage> createState() => _MovieStreamPageState();
}

class _MovieStreamPageState extends State<MovieStreamPage> {
  late final WebViewController _controller;

  @override
  void dispose() {
    // Mengembalikan orientasi dan status bar ke pengaturan semula
    _exitFullscreen();
    super.dispose();
  }

  void _enterFullscreen() {
    // Sembunyikan status bar dan navigasi, ubah orientasi ke landscape
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  void _exitFullscreen() {
    // Tampilkan kembali status bar dan navigasi, ubah orientasi ke default
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void initState() {
    super.initState();

    _enterFullscreen();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // Nonaktifkan JavaScript
      ..setNavigationDelegate(NavigationDelegate(
        onNavigationRequest: (navigation) {
          // Cek jika URL berbeda dari initialUrl, tolak redirect
          if (navigation.url != widget.streamUrl) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ))
      ..loadRequest(Uri.parse(widget.streamUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparan
        elevation: 0, // Hilangkan bayangan
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
          color: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
