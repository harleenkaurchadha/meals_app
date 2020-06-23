import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget{
  Widget buildListTile(String title,IconData icon,Function tapHandler){
    return ListTile(
      leading: Icon(icon, size: 26,),
      title: Text(title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed',
          )),
      onTap: tapHandler,
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
          buildListTile(
            'Meals',
            Icons.restaurant,
            (){
             Navigator.of(context).pushReplacementNamed('/');     // to replace existing page on stack with new page to clear stack
              }),
          buildListTile(
              'Filters',
              Icons.settings,
              (){
              Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
              }),

        ],
      ),
    ) ;
  }
}