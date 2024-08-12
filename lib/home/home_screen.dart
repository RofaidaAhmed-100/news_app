import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName='home_screen';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.whiteColor,
          child: Image.asset('name'),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('News app',
                style:Theme.of(context).textTheme.titleLarge),
          ),

        )
      ],
    );
  }
}
