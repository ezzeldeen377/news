import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/app_colors.dart';

class MyTheme{

  static ThemeData theme=ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: AppColors.whiteColor
      ),
      color: AppColors.greenColor,
      centerTitle: true,
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50)
        )
      )
      ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.exo(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: AppColors.whiteColor
      ),
      titleSmall: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: AppColors.whiteColor
      ),
      titleMedium: GoogleFonts.exo(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.whiteColor
      ),
      labelSmall: GoogleFonts.poppins(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: const Color((0xff79828B))
    ),
      labelLarge: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: const Color((0xff42505C))
      ),
      labelMedium: GoogleFonts.inter(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: const Color((0xffA3A3A3))
      ),
      bodySmall: GoogleFonts.poppins(
        fontWeight: FontWeight.w700,
        fontSize: 14,
        color :Color(0xff303030)
      ),
      bodyLarge: GoogleFonts.poppins(
          fontSize: 13,
          fontWeight: FontWeight.w300,
          color: const Color((0xff42505C))
      ),
      bodyMedium: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: AppColors.blackColor
      ),
  ),
    drawerTheme: DrawerThemeData(

    ),


    dropdownMenuTheme: DropdownMenuThemeData(

      inputDecorationTheme: InputDecorationTheme(

        filled: true,
        fillColor: AppColors.whiteColor,
        enabledBorder: OutlineInputBorder(
         borderSide: BorderSide(
           color: AppColors.greenColor,
           width: 1,

         )
        ),
        focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.greenColor,
              width: 1,

            )
        )
      )
    )

    

  );
}