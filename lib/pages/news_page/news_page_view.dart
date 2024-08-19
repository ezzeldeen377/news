import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/app_colors.dart';
import 'package:news_app/models/category.dart';
import 'package:news_app/pages/news_page/news_page_view_model.dart';
import 'package:news_app/widgets/tabs_widget.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatefulWidget {
  Category category;
    NewsPage({required this.category});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  NewsPageViewModel viewModel = NewsPageViewModel();
  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);

  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>viewModel,
      child: Consumer<NewsPageViewModel>(

          builder:(context,viewModel,child) {
            if(viewModel.sourcesList==null) {
              return Center(
                child: CircularProgressIndicator(color: AppColors.greenColor,
                ),
              );
            }
            else if (viewModel.errorMessageSource!=null){
              return Column(
                          children: [
                            Text(viewModel.errorMessageSource??''),
                            ElevatedButton(onPressed: (){
                              viewModel.getSources(widget.category.id);
                            }, child: Text('Try Again'))
                          ],
                        );
            }else{
              return TabsWidget(list:viewModel.sourcesList!, );
            }
      }
      ),
    );

  }
}
