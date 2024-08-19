import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/provider/app_provider.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  static const String routeName='settings';
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppProvider>(context);
    List<String> language=[
      AppLocalizations.of(context)!.english,
      AppLocalizations.of(context)!.arabic,
    ];
    List<String> languageCode=[
      'en','ar'
    ];
    return Container(
      child: Center(

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppLocalizations.of(context)!.language,style: Theme.of(context).textTheme.bodySmall,),
                    SizedBox(height: 10,),
                    DropdownMenu(
                      width: MediaQuery.of(context).size.width*.77,
                        initialSelection:language[languageCode.indexOf(provider.appLanguage)],
                        textStyle:  Theme.of(context).textTheme.labelLarge?.copyWith(color: AppColors.greenColor),
                        onSelected: ((value){
                          if(value!=null) {
                            provider.changeLanguage(
                                languageCode[language.indexOf(value)]);

                          }
                        }),

                        dropdownMenuEntries:language.map((lang){
                          return DropdownMenuEntry(value: lang, label: lang);
                        }).toList()
                    )
                  ],
                ),
              ),
            )
    );




  }
}
