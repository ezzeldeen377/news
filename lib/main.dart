import 'package:flutter/material.dart';
import 'package:news_app/my_theme.dart';
import 'package:news_app/pages/Settings.dart';
import 'package:news_app/pages/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/pages/view_full_article.dart';
import 'package:news_app/provider/app_provider.dart';
import 'package:provider/provider.dart';

void main (){
  runApp(
      ChangeNotifierProvider(
        create: (_)=>AppProvider(),
      child: MyApp()
  )
  );
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:HomeScreen.routeName ,
      routes: {
        HomeScreen.routeName:(context)=>HomeScreen(),
        Settings.routeName:(context)=>Settings(),
        ViewFullArticle.routeName:(context)=>ViewFullArticle()
      },
      theme: MyTheme.theme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),


    );
  }

}