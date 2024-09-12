
import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';
import 'package:news_app/model/SourceResponse.dart';

class TabItem extends StatelessWidget {
  Source source;
  bool isSelected;
  TabItem({required this.source, required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 6),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isSelected?AppColors.primaryLightColor:Colors.transparent,
        borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: AppColors.primaryLightColor,
                  width: 2
            )
      ),
      child: Text(source.name??"",
          style: Theme.of(context).textTheme.titleLarge?.
          copyWith(color: isSelected?AppColors.whiteColor:AppColors.primaryLightColor)),
    );
  }
}
