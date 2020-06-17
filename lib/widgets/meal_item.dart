import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget{
  final String title;
  final String imageUrl;
  final Affordability affordability;
  final int duration;
  final Complexity complexity;

  MealItem({
    @required this.title,
    @required this.imageUrl,
    @required this.affordability,
    @required this.duration,
    @required this.complexity,
  });

  void selectMeal(){

  }
  @override
  Widget build(BuildContext context){
    return InkWell(
        onTap: selectMeal,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
          ),
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                 ClipRRect(                                       //widget to clip img to have rounded corners
                   borderRadius: BorderRadius.only(
                     topLeft: Radius.circular(15),
                     topRight: Radius.circular(15),
                   ),
                   child: Image.network(imageUrl,
                     height: 250,
                     width: double.infinity,
                     fit: BoxFit.cover,
                   ),
                 ),
                ],
              ),                                  //to show overlapping of img & title

            ],
          ),
        ),
    );
  }
}