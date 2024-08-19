import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';

class TabItem extends StatelessWidget {

  String text;
  bool isSelected;
  TabItem({required this.text,required this.isSelected});

  @override
  Widget build(BuildContext context) {

    return  Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected? AppColors.greenColor:AppColors.whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(25),
        ),
        border: Border.all(
          color: AppColors.greenColor,
          width: 2
        ),


      ),
      child: Text(text,style:isSelected? Theme.of(context).textTheme.titleMedium
          :
      Theme.of(context).textTheme.titleMedium?.copyWith(
        color: AppColors.greenColor
      ),),
    );
  }
}
