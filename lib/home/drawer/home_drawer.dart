import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';

class HomeDrawer extends StatelessWidget {
  static const int categories=1;
  static const int settings=2;
  Function onSideMenuItemClick;
  HomeDrawer({required this.onSideMenuItemClick});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height*0.1, ),
            width: double.infinity,
            //height: MediaQuery.of(context).size.height*0.2,
            color: AppColors.primaryLightColor,
            child: Text('News APP!',
              textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,),
          ),
          Padding(
            padding:EdgeInsets.all(10.0) ,
            child: InkWell(
              onTap: (){
                onSideMenuItemClick(categories);
              },
              child: Row(
                children: [
                  Icon(Icons.list),
                  SizedBox(width: 5,),
                  Text('categories', style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(10.0),
            child: InkWell(
              onTap: (){
                onSideMenuItemClick(HomeDrawer.settings);
              },
              child: Row(
                children: [
                  Icon(Icons.settings),
                  SizedBox(width: 5,),
                  Text('settings',
                    style: Theme.of(context).textTheme.titleMedium,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
