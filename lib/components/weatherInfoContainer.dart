import 'dart:ui';
import 'package:chat_app/style/color_manager.dart';
import 'package:chat_app/style/fonts.dart';
import 'package:flutter/material.dart';

weatherInfoContainer({
  required String degreeTemp,
  required String statusTemp,
  required BuildContext context,
}) =>
    Container(
      width: MediaQuery.sizeOf(context).width / 3.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorManager.semiTransparentWhite,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorManager.semiTransparentWhite.withOpacity(0.1),
            ),
            child: Column(
              children: [
                Text(
                  "$degreeTemp°",
                  style: mainFont,
                ),
                Text(
                  "$statusTemp",
                  style: townFont.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
