import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrawerHead extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding:EdgeInsets.symmetric(vertical: 40) ,
        color: AppColors.greenColor,
        child: Text(AppLocalizations.of(context)!.apptitle,style: Theme.of(context).textTheme.titleSmall,textAlign: TextAlign.center,),
      ),
    );
  }
}
