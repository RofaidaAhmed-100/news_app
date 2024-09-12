import 'package:flutter/material.dart';
import 'package:news_app/category/Category_details_view_model.dart';
import 'package:news_app/model/Category.dart';
import 'package:provider/provider.dart';

import '../api/api_manager.dart';
import '../app_colors.dart';
//import '../model/SourceResponse.dart';
import '../tabs/tab_widget.dart';

class CategoryDetails extends StatefulWidget {
  //CategoryDetailsViewModel viewModel=CategoryDetailsViewModel();
  Category category;
  CategoryDetails({required this.category});
  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<CategoryDetailsViewModel>(
            builder: (context, viewModel, child) {
              if (viewModel.errorMessage != null) {
                Column(
                  children: [
                    Text(viewModel.errorMessage!),
                    ElevatedButton(onPressed: () {
                      ApiManager.getSources(widget.category.id);
                      setState(() {

                      });
                    }, child: Text('Try again'))
                  ],
                );
              }
              else if (viewModel.sourceList == null) {
                return Center
                  (child: CircularProgressIndicator(
                  color: AppColors.primaryLightColor,));
              } else {
                return TabWidget(sourceList: viewModel.sourceList!,);
              }
            }


        )
    );
  }

/*

      FutureBuilder<SourceResponse?>(
        future: ApiManager.getSources(widget.category.id),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center
              ( child: CircularProgressIndicator(
              color: AppColors.primaryLightColor,),
            );
          }else if(snapshot.hasError){
            return Column(
              children: [
                Text('Something went wromg'),
                ElevatedButton(onPressed: (){
                  ApiManager.getSources(widget.category.id);
                  setState(() {
      
                  });
                }, child: Text('Try again'))
              ],
            );
          }
          if(snapshot.data!.status!='ok'){
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(onPressed: (){
                  ApiManager.getSources(widget.category.id);
                  setState(() {
      
                  });
                }, child: Text('Try again'))
              ],
            );
          }
          var sourceList=snapshot.data!.sources!;
          return TabWidget(sourceList: sourceList,);
        },
      
      ),*/
  }

