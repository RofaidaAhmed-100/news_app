import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';
import 'package:news_app/category/Category_details.dart';
import 'package:news_app/category/Category_fragment.dart';
import 'package:news_app/model/Category.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/settings/setting_tab.dart';
import 'package:news_app/tabs/tab_widget.dart';

import 'drawer/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName='home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.whiteColor,
          //child: Image.asset('assets/images/pattern.png',
           // fit:BoxFit.cover ,),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              selectedSideMenuItem==HomeDrawer.settings?'Settings':
                  selectedCategory==null?
                'News app':selectedCategory!.id,
                style:Theme.of(context).textTheme.titleLarge),
          ),
          drawer: Drawer(
            child: HomeDrawer(onSideMenuItemClick:onSideMenuItemClick),
          ),
          body:selectedSideMenuItem==HomeDrawer.settings?
              SettingTab()
              :
          selectedCategory==null ?
          CategoryFragment(onCategoryItemClick:onCategoryItemClick):
          CategoryDetails(category: selectedCategory!),
        )
      ],);
  }
  Category? selectedCategory;
 void onCategoryItemClick(Category newCategory){
   selectedCategory=newCategory;
   setState(() {

   });
 }
 int selectedSideMenuItem=HomeDrawer.categories;
  void onSideMenuItemClick(int newSideMenuItem){
    selectedSideMenuItem=newSideMenuItem;
    selectedCategory==null;
    //Navigator.pop(context);
    setState(() {

    });
  }
}
