import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget{
static const routeName = '/category-meals';
final List<Meal> availableMeals ;

CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
   String categoryTitle;
   List<Meal> displayedMeals;
   var _loadedInitData = false;

   @override
   void initState(){
     super.initState();
   }
   @override
   void didChangeDependencies() {       // called when widget belongs to state is fully initialised & we can tap into context
    // TODO: implement didChangeDependencies
     if(!_loadedInitData) {
       final routeArgs = ModalRoute
           .of(context)
           .settings
           .arguments as Map<String, String>; //extracting the arguments
       categoryTitle = routeArgs['title'];
       final categoryId = routeArgs['id'];
       displayedMeals = widget.availableMeals.where((
           meal) { //it receive each item as input & we have to
         // return true if we want to keep that in list
         return meal.categories.contains(categoryId);
       }).toList();
       _loadedInitData = true;
     }
       super.didChangeDependencies();
     }

//  void _removeMeal(String mealId){
//   setState(() {
//     displayedMeals.removeWhere((meal) => meal.id==mealId);
//   });
//  }
  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        ),
       body: ListView.builder(itemBuilder: (ctx, index) {
        return MealItem(
          id: displayedMeals[index].id,
          title: displayedMeals[index].title,
          imageUrl: displayedMeals[index].imageUrl,
          affordability: displayedMeals[index].affordability,
          duration: displayedMeals[index].duration,
          complexity: displayedMeals[index].complexity,
        );
       },
       itemCount: displayedMeals.length,
       ),
    );

  }
}