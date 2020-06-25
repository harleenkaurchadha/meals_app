import 'package:flutter/material.dart';
import './dummy_data.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import 'screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/filters_screen.dart';
import './models/meal.dart';
void main()
{
  runApp(MyApp());
}
class MyApp extends StatefulWidget{

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters= {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals= DUMMY_MEALS;
//  List<Meal> _favouriteMeals = [];

  void _setFilters(Map<String, bool> filterData){
   setState(() {
     _filters= filterData;

     _availableMeals= DUMMY_MEALS.where((meal){
      if(_filters['gluten'] && !meal.isGlutenFree)    //check for gluten free switch set & if yes then check for meal
        {
          return false;             // we return false in where methd if we don't want item in new generated list
      }
      if(_filters['lactose'] && (!meal.isLactoseFree) )    //check for gluten free switch set & if yes then check for meal
          {
        return false;             // we return false in where methd if we don't want item in new generated list
      }
      if(_filters['vegan'] && (!meal.isVegan) )    //check for gluten free switch set & if yes then check for meal
          {
        return false;             // we return false in where methd if we don't want item in new generated list
      }
      if(_filters['vegetarian'] && (!meal.isVegetarian) )    //check for gluten free switch set & if yes then check for meal
          {
        return false;             // we return false in where methd if we don't want item in new generated list
      }
      return true;
     }).toList();
   });
  }
   
//  void _toggleFavourite(String mealId){    // to turn a meal into fav or unfav it & add it to list
//    final existingIndex= _favouriteMeals.indexWhere(());   // check if element is part of list & returns index
//  }
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'DeliMeals',
      theme:ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),    // background color
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          // ignore: deprecated_member_use
          body1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          // ignore: deprecated_member_use
          body2: TextStyle(
            color: Color.fromRGBO(20,51,51,1),
          ),
          // ignore: deprecated_member_use
          title: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      initialRoute: '/',   // to make sure by default is home route
//      home: CategoriesScreen(),
      routes: {                   //list of all available page routing for lean code
        '/' : (ctx) => TabsScreen(),
        CategoryMealsScreen.routeName : (ctx) => CategoryMealsScreen(_availableMeals),             //screen : creation function for that screen
        MealDetailScreen.routeName : (ctx) => MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters,_setFilters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget{

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeals'),
      ),
      body: CategoriesScreen(),
     );

  }
}
