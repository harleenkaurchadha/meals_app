import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget{
  static const routeName = '/meal-detail';

    Widget buildSectionTitle(BuildContext context, String text) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 8,),
        child: Text(text,
          // ignore: deprecated_member_use
          style: Theme.of(context).textTheme.title,
        ),
      );
    }

    Widget buildContainer(Widget child) {
    return Container(
         height: 150,
         width: 300,
         margin: EdgeInsets.all(10),
         padding: EdgeInsets.all(10),
         decoration: BoxDecoration(
         border: Border.all(
         color: Colors.grey,
          ),
         borderRadius: BorderRadius.circular(10),
         color: Colors.white,
      ),
      child: child,
    );
    }

  @override
  Widget build(BuildContext context){
    final mealId= ModalRoute.of(context).settings.arguments as String;
    final selectedMeal= DUMMY_MEALS.firstWhere((meal) => meal.id== mealId);     // on searching for first meal search is done

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(selectedMeal.imageUrl,
            fit : BoxFit.cover,
          ),
          ),
        buildSectionTitle(context,'ingredients'),
        buildContainer(ListView.builder(itemBuilder: (context, index) {
          return Card(
            color: Theme.of(context).accentColor,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical:5 ,
                horizontal: 10,
              ),
              child: Text(selectedMeal.ingredients[index]),
            ),
          );
        },
          itemCount: selectedMeal.ingredients.length,
        ),
         ),
          buildSectionTitle(context,'Steps'),
          buildContainer(ListView.builder(itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                leading: CircleAvatar(
                  child: Text('# ${index + 1}'),
                ),
                title: Text(selectedMeal.steps[index]),
              ),
                Divider(),                                // to draw fine horizontal lines as divider
            ],
            );
          },
            itemCount: selectedMeal.steps.length,
          )
          ),
        ],
        ),
      ),

    );
    }
}