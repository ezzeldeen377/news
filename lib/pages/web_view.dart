import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';
import 'package:news_app/models/NewsResponse.dart';
import 'package:news_app/models/category.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatefulWidget {
  Articles article ;
  WebView({required this.article});

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  late final controller;
  bool isLoading=true ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url){
          setState(() {
            isLoading=false;
          });
        }
      ))
    ..loadRequest(Uri.parse(widget.article.url!));
  }
  @override
  Widget build(BuildContext context) {

    return Stack(children: [
      Image.asset(
      'assets/images/background.jpg',
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.fill,
    ),
    Scaffold(
    appBar: AppBar(
    title: Text(widget.article.title??'',
    style: Theme.of(context).textTheme.titleLarge),
    ),
    body:SafeArea(child:isLoading?Center(child: CircularProgressIndicator(color: AppColors.greenColor,)): WebViewWidget(

      controller: controller,))
    )

    ]
    );
  }
}
