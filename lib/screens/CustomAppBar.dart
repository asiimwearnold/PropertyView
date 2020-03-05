import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {

  List<BottomNavigationBarItem> bottomBarItems = [];  

  final bottomNavigationBarItemStyle = TextStyle(fontStyle: FontStyle.normal, color: Colors.black);
  CustomAppBar(){
    bottomBarItems.add(
    BottomNavigationBarItem(
      
      icon: Icon (Icons.home, color: Colors.black,),
      title: Text("Home", style: TextStyle(color: Colors.black),),
     )
    );
    bottomBarItems.add(
      new BottomNavigationBarItem(
        icon: new Icon(
          Icons.favorite,
          color: Colors.black,
        ), 
        title: Text("watchlist", style:bottomNavigationBarItemStyle),
        ),
    );
    bottomBarItems.add(
     new BottomNavigationBarItem(
       icon: new Icon(
         Icons.local_offer,
         color: Colors.black,
       ), 
       title: Text(
          "Deals",
          style: bottomNavigationBarItemStyle,
       ),
       ) ,
    );
    bottomBarItems.add(
      new BottomNavigationBarItem(
        icon: new Icon(
          Icons.notifications,
          color: Colors.black,
        ),
      title: Text(
        "Notifications",
        ),  
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Material(
      elevation: 15.0,
      child: BottomNavigationBar(
         items: bottomBarItems,
         type: BottomNavigationBarType.shifting,
      
      ),

    ); 
    
  }
}