import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/widgets/category_item.dart';
import 'package:news_app/models/category.dart';

class CategoriesPage extends StatelessWidget {
  Function onChosenCategoryClick;
  CategoriesPage({required this.onChosenCategoryClick});

  @override
  Widget build(BuildContext context) {
    List<Category> categoryList=Category.getList(context);
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.pick_category,style: Theme.of(context).textTheme.bodyMedium,),
          SizedBox(height: 20,),
          Expanded(
            child: GridView.builder(
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                    mainAxisExtent: 150
                ),
              itemBuilder: (context, index) => InkWell(
                onTap: (){
                  onChosenCategoryClick(categoryList[index]);
                },
                  child: CategoryItem(category: categoryList[index], index: index)),
              itemCount:categoryList.length
                  
            ),
          )
        ],
      ),
    );
  }
}
