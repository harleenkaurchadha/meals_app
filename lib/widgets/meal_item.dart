import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget{
  final String id;
  final String title;
  final String imageUrl;
  final Affordability affordability;
  final int duration;
  final Complexity complexity;

  MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.affordability,
    @required this.duration,
    @required this.complexity,
  });

  String get complexityText{                  //to return enum text
  switch(complexity){
    case Complexity.Simple :
      return 'Simple';
      break;
    case Complexity.Challenging :
      return 'Challenging';
      break;
    case Complexity.Hard :
      return 'Hard';
      break;
    default:
      return 'Unknown';
  }
  }
  String get affordabilityText{                  //to return enum text
    switch(affordability){
      case Affordability.Affordable :
        return 'Affordable';
        break;
      case Affordability.Pricey :
        return 'Pricey';
        break;
      case Affordability.Luxurious :
        return 'Luxurious';
        break;
      default:
        return 'Unknown';
    }
  }

  void selectMeal(BuildContext context){
   Navigator.of(context).pushNamed(MealDetailScreen.routeName, arguments: id,);
  }

  @override
  Widget build(BuildContext context){
    return InkWell(
        onTap: () => selectMeal(context),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
          ),
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(                                              //to show overlapping of img & title
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
                  Positioned(                         // allows to position text in absolute coordinate space
                    bottom: 20, 
                    right:10,
                    child: Container(
                      width: 350,
                      color: Colors.black54,
                      padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 15,
                      ) ,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        ),
                       softWrap: true,
                       overflow: TextOverflow.fade,
                    ),
                    ),
                  ),
                ],
              ),
              Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                 Row(children: [
                  Icon(Icons.schedule,),
                  SizedBox(width: 6,),
                  Text('$duration mins'),
                 ],
                 ),
                  Row(children: [
                    Icon(Icons.work,),
                    SizedBox(width: 6,),
                    Text(complexityText),
                  ],
                  ),
                  Row(children: [
                    Icon(Icons.attach_money,),
                    SizedBox(width: 6,),
                    Text(affordabilityText),
                  ],
                  ),
                ],
              ),
              ),
            ],
          ),
        ),
    );
  }
}