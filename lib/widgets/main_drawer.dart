import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget{
  Widget buildListTile(String title,IconData icon){
    return ListTile(
      leading: Icon(icon, size: 26,),
      title: Text(title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed',
          )),
    );
  }

  @override
  Widget build(BuildContext context){
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(15),
            color: Theme.of(context).accentColor,
            child: Text('Cooking Up!',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Theme.of(context).primaryColor,
              fontSize: 30,
            ),
            ),
          ),
          SizedBox(height: 20,),
          buildListTile('Meals',Icons.restaurant),
          buildListTile('Filters',Icons.settings),
        ],
      ),
    ) ;
  }
}