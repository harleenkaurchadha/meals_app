import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';

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
    final categoryMeals= DUMMY_MEALS.where((meal){      //it receive each item as input & we have to
                                                        // return true if we want to keep that in list
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        ),
       body: ListView.builder(itemBuilder: (ctx, index) {
        return MealItem(
          id: categoryMeals[index].id,
          title: categoryMeals[index].title,
          imageUrl: categoryMeals[index].imageUrl,
          affordability: categoryMeals[index].affordability,
          duration: categoryMeals[index].duration,
          complexity: categoryMeals[index].complexity,
        );
       },
       itemCount: categoryMeals.length,
       ),
    );

  }
}