import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget{
final String categoryId;
final String categoryTitle;

CategoryMealsScreen(this.categoryId,this.categoryTitle);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        ),
       body: Center(
         child: Text('The Receipes for the Category!',
         // ignore: deprecated_member_use
         style: Theme.of(context).textTheme.title,),
    ),);

  }
}