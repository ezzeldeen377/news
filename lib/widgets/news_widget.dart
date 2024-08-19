import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/app_colors.dart';
import 'package:news_app/models/NewsResponse.dart';
import 'package:news_app/models/SourceResponse.dart';
import 'package:news_app/pages/news_page/news_page_view_model.dart';
import 'package:news_app/pages/view_full_article.dart';
import 'package:news_app/provider/app_provider.dart';
import 'package:news_app/widgets/article_widget.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:provider/provider.dart';

class NewsWidget extends StatefulWidget {
  final Sources source;
  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsPageViewModel viewModel =NewsPageViewModel();
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<bool> _showPagination = ValueNotifier(false);
  int pageNumber=1;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    viewModel.getNewsBySource(widget.source.id!);
    print(widget.source.id);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels==_scrollController.position.maxScrollExtent) {

      _showPagination.value = true;
    }else{
      _showPagination.value=false;
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _showPagination.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create:(context)=>viewModel,
      child: Consumer<NewsPageViewModel>(
          builder:(context,viewModel,child){
            if(viewModel.newsList==null){
              return Center(
                          child: CircularProgressIndicator(color: AppColors.greenColor),
                        );
            }else if (viewModel.errorMessageNews!=null){
              return Column(
                          children: [
                            Text(viewModel.errorMessageNews!),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('Try Again'),
                            ),
                          ],
                        );


            }else{
              return Column(
                          children: [
                            Expanded(
                              child: ListView.separated(
                                controller: _scrollController,
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: 10),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                          ViewFullArticle.routeName,
                                          arguments: viewModel.newsList?[index]);
                                    },
                                    child: ArticleWidget(article: viewModel.newsList![index]),
                                  );
                                },
                                itemCount: viewModel.newsList!.length,
                              ),
                            ),
                            AnimatedBuilder(
                              animation: _showPagination,
                              builder: (context, child) {
                                return _showPagination.value
                                    ? NumberPaginator(
                                  config: NumberPaginatorUIConfig(
                                    buttonSelectedBackgroundColor: AppColors.greenColor,
                                    buttonUnselectedForegroundColor: AppColors.greenColor,

                                  ),
                                  // by default, the paginator shows numbers as center content
                                  numberPages: viewModel.newsNumber!~/10,
                                  initialPage: pageNumber-1,
                                  onPageChange: (int index) {
                                    setState(() {
                                      pageNumber = index+1;
                                    });
                                  },
                                )
                                    : SizedBox.shrink(); // Hide widget when not at the bottom
                              },
                            ),
                          ],
                        );
            }
          }
      ),
    );
      // FutureBuilder(
      //   future: ApiManager.getAllNews(widget.source.id ?? '',pageNumber),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(
      //         child: CircularProgressIndicator(color: AppColors.greenColor),
      //       );
      //     } else if (snapshot.hasError) {
      //       return Column(
      //         children: [
      //           Text('Something went wrong'),
      //           ElevatedButton(
      //             onPressed: () {},
      //             child: Text('Try Again'),
      //           ),
      //         ],
      //       );
      //     } else if (snapshot.data?.status == 'error') {
      //       return Column(
      //         children: [
      //           Text(snapshot.data?.message ?? ''),
      //           ElevatedButton(
      //             onPressed: () {},
      //             child: Text('Try Again'),
      //           ),
      //         ],
      //       );
      //     }
      //
      //     var newsList = snapshot.data?.articles;
      //     if (newsList!.isEmpty) {
      //       return Center(
      //         child: Text(
      //           'No Data To Show!',
      //           style: Theme.of(context)
      //               .textTheme
      //               .titleLarge
      //               ?.copyWith(color: AppColors.blackColor),
      //         ),
      //       );
      //     } else {
      //       return Column(
      //         children: [
      //           Expanded(
      //             child: ListView.separated(
      //               controller: _scrollController,
      //               separatorBuilder: (context, index) =>
      //                   SizedBox(height: 10),
      //               itemBuilder: (context, index) {
      //                 return InkWell(
      //                   onTap: () {
      //                     Navigator.of(context).pushNamed(
      //                         ViewFullArticle.routeName,
      //                         arguments: newsList[index]);
      //                   },
      //                   child: ArticleWidget(article: newsList[index]),
      //                 );
      //               },
      //               itemCount: newsList.length,
      //             ),
      //           ),
      //           AnimatedBuilder(
      //             animation: _showPagination,
      //             builder: (context, child) {
      //               return _showPagination.value
      //                   ? NumberPaginator(
      //                 config: NumberPaginatorUIConfig(
      //                   buttonSelectedBackgroundColor: AppColors.greenColor,
      //                   buttonUnselectedForegroundColor: AppColors.greenColor,
      //
      //                 ),
      //                 // by default, the paginator shows numbers as center content
      //                 numberPages: snapshot.data!.totalResults!~/10,
      //                 initialPage: pageNumber-1,
      //                 onPageChange: (int index) {
      //                   setState(() {
      //                     pageNumber = index+1;
      //                   });
      //                 },
      //               )
      //                   : SizedBox.shrink(); // Hide widget when not at the bottom
      //             },
      //           ),
      //         ],
      //       );
      //     }
      //   });
  }



}
