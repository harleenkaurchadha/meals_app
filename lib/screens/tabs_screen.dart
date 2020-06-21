import 'package:flutter/material.dart';
import 'package:meals_app/screens/favourites_screen.dart';
import './categories_screen.dart';

class TabsScreen  extends StatefulWidget{

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen>{

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(            //automatically detects which tab is selected & then show the content
      length: 2,
      initialIndex: 0,    //by default selected tab
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(tabs: <Widget>[
            Tab(
              icon: Icon(Icons.category),
              text: 'Categories',
            ),
            Tab(
                icon: Icon(Icons.star),
                text: 'Favourites',
            ),
          ],),
        ),
        body: TabBarView(children: <Widget>[     // page view which displays widget corresponding to currently selected tab
          CategoriesScreen(),
          FavouritesScreen(),
        ],
        ),
      ),
    );
  }
}