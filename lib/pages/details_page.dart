import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:flutter_news_app/providers/articles.dart';

class DetailsPage extends StatelessWidget {
  static const routeName = '/details';
  WebViewController _contentWebViewCtrl;

  void _renderHtml(String htmlContent, WebViewController controller) {
    String content = Uri.dataFromString(
      htmlContent,
      mimeType: 'text/html',
      encoding: Encoding.getByName('utf-8'),
    ).toString();
    controller.loadUrl(content);
  }

  @override
  Widget build(BuildContext context) {
    var articlesProvider = Provider.of<ArticlesProvider>(context);
    int articleId = ModalRoute.of(context).settings.arguments;
    var article = articlesProvider.findById(articleId);
    return Scaffold(
      appBar: AppBar(title: Text('Détails')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: 'about:blank',
          onWebViewCreated: (webViewController) {
            _contentWebViewCtrl = webViewController;
            _renderHtml(article.htmlContent, _contentWebViewCtrl);
          },
        ),
      ),
    );
  }
}
