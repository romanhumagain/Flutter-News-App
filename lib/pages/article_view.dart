import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String articleUrl;
  const ArticleView({super.key, required this.articleUrl});

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "News",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
            ),
            Text(
              "Flash",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Colors.blue),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.articleUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onPageStarted: (start) {
              setState(() {
                _isLoading = true;
              });
            },
            onPageFinished: (finish) {
              setState(() {
                _isLoading = false;
              });
            },
          ),
          _isLoading
              ?  Center(
            child: LoadingAnimationWidget.inkDrop(color: Colors.blue, size: 45.0),
          )
              : Container(),
        ],
      ),
    );
  }
}
