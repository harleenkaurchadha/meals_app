import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget{
//final String categoryId;
//final String categoryTitle;
static const routeName = '/category-meals';
//CategoryMealsScreen(this.categoryId,this.categoryTitle);

  @override
  Widget build(BuildContext context){
    final routeArgs= ModalRoute.of(context).settings.arguments as Map<String, String>;     //extracting the arguments
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
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