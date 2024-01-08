import 'package:chat_app/style/color_manager.dart';
import 'package:chat_app/style/fonts.dart';
import 'package:flutter/material.dart';

weatherInfoContainer({
  required String degreeTemp,
  required String statusTemp,
}) =>
    Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorManager.semiTransparentWhite,
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
                fontWeight: FontWeight.w600, color: Colors.grey[700]),
          ),
        ],
      ),
    );
