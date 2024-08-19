import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/app_colors.dart';
import 'package:news_app/models/category.dart';
import 'package:news_app/pages/Settings.dart';
import 'package:news_app/pages/categories_page.dart';
import 'package:news_app/pages/news_page/news_page_view.dart';
import 'package:news_app/pages/search_page.dart';
import 'package:news_app/widgets/drawer_body.dart';
import 'package:news_app/widgets/drawer_head.dart';
import 'package:news_app/widgets/tab_item.dart';
import 'package:news_app/widgets/tabs_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget{
  static const String routeName='homescreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Stack(
        children: [
          Image.asset('assets/images/background.jpg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Scaffold(
            appBar: AppBar(
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 13),
                  child: AnimSearchBar(
                    width: MediaQuery.of(context).size.width*.8,
                    textController: searchController,
                    onSuffixTap: (){
                      searchController.clear();
                      print("suffix");
                    },
                    onSubmitted: (string ) {
                      search(string);
                      print("submit");
                    },
                    rtl: true,
                  ),
                )
              ],

              title: Text(selectedQuery!=null?selectedQuery!:
                  check==1?AppLocalizations.of(context)!.settings:
                      selectedCategory==null?AppLocalizations.of(context)!.apptitle:
                          AppLocalizations.of(context)!.translate(selectedCategory!.id)
                  ,style:Theme.of(context).textTheme.titleLarge),
            ),
            body:selectedQuery!=null?SearchPage(query:selectedQuery! ,):
            check==1?Settings():
            selectedCategory==null?CategoriesPage(onChosenCategoryClick: onChosenCategoryClick,):
            NewsPage(category: selectedCategory!,),

            drawer:Drawer(
              child: Column(
                children: [
                  DrawerHead(),
                  DrawerBody(onClick: onClick,)
                ],
              ),

            ) ,
          )
        ],
      ) ,
    );
  }

  int check =0;

  void onClick(int newcheck){
    check=newcheck;
    selectedCategory=null;
    selectedQuery=null;
    Navigator.of(context).pop();
    setState(() {

    });
  }
  Category? selectedCategory=null;
  void onChosenCategoryClick(Category newCategory){
    selectedCategory =newCategory;
    selectedQuery=null;
    setState(() {

    });

  }
  String? selectedQuery=null;
  void search(String query){
    selectedQuery=query;
    setState(() {

    });


  }
}
extension AppLocalizationsX on AppLocalizations {
  String translate(String key) {
    return {
      'sports': sports,
      'general': general,
      'health': health,
      'business':business,
      'entertainment':entertainment,
      'science':science
    }[key] ?? key;
  }

}