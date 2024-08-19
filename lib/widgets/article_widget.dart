import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/NewsResponse.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../app_colors.dart';

class ArticleWidget extends StatelessWidget {
  Articles article ;
  ArticleWidget({required this.article});
  @override
  Widget build(BuildContext context) {
    DateTime datatime=DateTime.parse(article.publishedAt!);



    return Container(

      child: Column(

        children: [
          CachedNetworkImage(
            width:double.infinity,
            height: MediaQuery.of(context).size.height*.3,
            fit: BoxFit.fill,
            imageUrl: article.urlToImage??'',
            placeholder: (context, url) => Center(child: CircularProgressIndicator(color:AppColors.greenColor)),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),

             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(article.author??'',style: Theme.of(context).textTheme.labelSmall,textAlign: TextAlign.start,),
                  Text(article.title??'',style: Theme.of(context).textTheme.labelLarge),
                  Text(timeago.format(datatime),style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.end,)
                ],
                           ),

          ),


        ],
      ),
    );
  }
}
