import 'package:flutter/material.dart';
import './categories_screen.dart';
import './category_meals_screen.dart';

void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'DeliMeals',
      theme:ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.purple,
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
        '/' : (ctx) => CategoriesScreen(),
        CategoryMealsScreen.routeName : (ctx) => CategoryMealsScreen(),             //screen : creation function for that screen
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
