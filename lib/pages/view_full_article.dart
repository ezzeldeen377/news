import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';
import 'package:news_app/models/NewsResponse.dart';
import 'package:news_app/pages/web_view.dart';
import 'package:news_app/widgets/article_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ViewFullArticle extends StatelessWidget {
  static const String routeName='viewfullarticle';
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Articles;
    return Stack(children: [
      Image.asset(
        'assets/images/background.jpg',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
        appBar: AppBar(
          title: Text(args.title ?? '',
              style: Theme.of(context).textTheme.titleLarge),
        ),
        body:Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children:[ SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 5,),
                ArticleWidget(article: args),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(
                    right: 25,
                    bottom: 25,
                    left: 25
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(20)
                    
                  ),
                  child: Text(args.description??'',style: Theme.of(context).textTheme.bodyLarge,),
                ),

                    
                    
              ],
            ),
          ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => WebView(article: args,),
                ),);
              },
              child: Container(
                margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width*.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppLocalizations.of(context)!.view_full_article,style: Theme.of(context).textTheme.labelLarge,),
                    Icon(Icons.arrow_forward_outlined),
                  ],
                ),
              ),
            )
            ]
        )
      ),
    ]);
  }
}
