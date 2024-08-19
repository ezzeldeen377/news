import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';
import 'package:news_app/pages/Settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrawerBody extends StatelessWidget {
  static const int setting = 1;
  static const int category = 2;
  Function onClick;
  DrawerBody({required this.onClick});
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 5,
        child: Container(
          child: Column(
            children: [
              ListTile(
                titleTextStyle: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: AppColors.blackColor, fontSize: 20),
                leading: Icon(
                  Icons.list,
                  size: 30,
                ),
                title: Text(AppLocalizations.of(context)!.categories),
                onTap: (){
                  onClick(category);
                },
              ),
              ListTile(
                titleTextStyle: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: AppColors.blackColor, fontSize: 20),
                leading: Icon(Icons.settings, size: 30),
                title: Text(AppLocalizations.of(context)!.settings),
                onTap: () {
                  onClick(setting);
                },
              ),
            ],
          ),
        ));
  }
}
