import 'package:flutter/material.dart';
import 'package:flutter_login_ui/screens/CustomAppBar.dart';
import './custom_shape_clipper.dart';
import 'package:intl/intl.dart';
import './CustomAppBar.dart';
import 'package:validators/validators.dart';


//  void main() => runApp(MaterialApp(
//     title: 'Property View',
//     debugShowCheckedModeBanner: false,
//     home: HomeScreen(),

//  ));
 Color firstColor = Color(0xFF73AEF5);
 Color secondColor = Color(0xFF61A4F1);

ThemeData appTheme = ThemeData(
  primaryColor: Color(0xFF398AE5),
  fontFamily: 'Oxygen'
);

List<String> locations = ['Ntinda', 'Kampala (KLA)'];

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      bottomNavigationBar: CustomAppBar(),
      body: SingleChildScrollView(
              child: Column(
           children: <Widget>[
             HomeScreenTopPart(),
             homeScreenBottomPart,

           ],
        ),
      ),
    );
  }
}
const TextStyle dropDownLabelStyle = TextStyle(color: Colors.white, fontSize: 16.0);
const TextStyle dropDownMenuItemStyle = TextStyle(color: Colors.blueAccent, fontSize: 16.0);

class HomeScreenTopPart extends StatefulWidget {
  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {
  var selectedLocationIndex = 0; 
  var isRentalSelected = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(clipper: CustomShapeClipper(),
        child: Container(
          height: 400, /*this cld have been the error */ decoration: BoxDecoration(gradient: LinearGradient(colors: [
          firstColor,
          secondColor
        ],),),
        child:Column(
          children: <Widget>[
            SizedBox(height: 50.0,),
            Padding(
              padding:const EdgeInsets.all(16.0),
              child:Row(
                children: <Widget>[
              Icon(Icons.location_on, color: Colors.white,),
              SizedBox(width: 16.0,),
              PopupMenuButton(
                onSelected: (index){
                  setState(() {
                    selectedLocationIndex = index;
                  });
                },
                child: Row(
                  children: <Widget>[
                    Text(locations[selectedLocationIndex], style: TextStyle(color: Colors.white, fontSize: 16.0),),
                    Icon(Icons.keyboard_arrow_down, color: Colors.white, )
                  ],
                ),
                itemBuilder: (BuildContext context)=> <PopupMenuItem<int>>[
                  PopupMenuItem(
                    child: Text(locations[0], style:dropDownMenuItemStyle,),
                    value: 0,
                  )
                ],
              ),
              Spacer(),
              Icon(Icons.settings, color: Colors.white,),
          ],
          ),
          ),
          SizedBox(height: 50.0,),
          Text('its possible to find a home!', style: TextStyle(fontSize: 24.0, color: Colors.white), textAlign: TextAlign.center,),
          SizedBox(height: 30.0,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.all(Radius.circular(38.0),),
              child: TextField(
                controller: TextEditingController(text: locations[1]),
                style: dropDownMenuItemStyle,
                cursorColor: appTheme.primaryColor,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 13.0),
                  suffix: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.all(Radius.circular(30.0),),
                    child: Icon(Icons.search, color:Colors.black),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0,),
          Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
              InkWell(
    
              child: ChoiceChip(
                Icons.home, 'Rentals', isRentalSelected),
              onTap: (){
                  setState((){
                    isRentalSelected = true;
                  });
                }
              ),
                
                SizedBox(width: 28.0),
                ChoiceChip(Icons.school, 'Apartments', !isRentalSelected ),
                ChoiceChip(Icons.hotel, 'Hostels', !isRentalSelected ),
              
            ],)
        ],)
        
        ),)

      ],
    );
  }
} 

class ChoiceChip extends StatefulWidget {

  final IconData icon;
  final String text;
  final bool isSelected;

  ChoiceChip(this.icon, this.text, this.isSelected);

  @override
  __ChoiceChipState createState() => __ChoiceChipState();
}

class __ChoiceChipState extends State<ChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(horizontal: 18.0, vertical:8.0),

      decoration: widget.isSelected ? BoxDecoration(
      color: Colors.white.withOpacity(0.15),
      borderRadius: BorderRadius.all(
      Radius.circular(20.0),
      ),
      ):null, 
      child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
      Icon(
        widget.icon,
        size: 20.0,
        color: Colors.white,
        ),
        SizedBox(
          width: 4.0,
        ),
      Text(
        widget.text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14.0,
           ),

      ),
      ]
    ),
    );
  }
}


var viewAllStyle = TextStyle(fontSize: 14.0, color: appTheme.primaryColor);

var homeScreenBottomPart = Column(
  children: <Widget>[
    Padding (
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child:Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(width: 16.0,),
        Text("Currently Watched Items", style: dropDownMenuItemStyle,),
        Spacer(),
        Text(" VIEW ALL", style: viewAllStyle,),
      ],
      ),
    ),

    Container(height:210.0,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children:cityCards,
        
      ),
    ),
    Container(height:210.0,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children:cityCards2,
        
      ),
    ),
    ],
   );


   List<CityCard> cityCards = [
    CityCard("assets/images/img1.jpg", "kampala", "feb 2020", "5", 400000, 550000),  
    CityCard("assets/images/img2.jpg", "kololo", "feb 2020", "18", 450000, 750000),  
    CityCard("assets/images/img4.jpg", "kawempe", "feb 2020", "10", 500000, 650000) 
   ];

    List<CityCard> cityCards2 = [
    CityCard("assets/images/img1.jpg", "kampala", "feb 2020", "5", 400000, 550000),  
    CityCard("assets/images/img2.jpg", "kololo", "feb 2020", "5", 400000, 550000),  
    CityCard("assets/images/img4.jpg", "kawempe", "feb 2020", "5", 400000, 550000) 
   ];
   
  final formatCurrency =  NumberFormat.simpleCurrency();

  class CityCard extends StatelessWidget{
  final String imagePath, cityName, monthYear, discount;
  final int oldPrice, newPrice;
    CityCard(this.imagePath, this.cityName, this.monthYear, this.discount, this.oldPrice, this.newPrice);

  @override
  Widget build(BuildContext context){
    return Padding(
      padding:const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column( 
        children: <Widget>[
      
      ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      child:Stack(
      children: <Widget>[
          Container(
            height: 160.0,
            width: 180.0,
            child:Image.asset(imagePath,  fit: BoxFit.cover,),
          ),
          Positioned(
            left:0.0,
            bottom: 0.0,
            width:160.0,
            height:70,
            child: Container(
              decoration: BoxDecoration(
               gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              
                colors: [
                Colors.black, Colors.black.withOpacity(0.1),
              ],
              ),
              ),
            ),
          ),
          Positioned(
            left:10.0,
            bottom: 10.0,
            right: 10.0,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(cityName, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18.0),),
                  Text(monthYear, style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white, fontSize: 18.0),),

                ],
              ), 
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                decoration: BoxDecoration(
                color:Colors.white, //this is where the error was....
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(10.0),),
              ),
                
                child:Text("$discount%", style: TextStyle(fontSize: 14.0, color: Colors.black),),),
            ],
            ),
          ),
      ],
      ),
      ),
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
        SizedBox(width:5.0,),
        Text('${formatCurrency.format(newPrice)}', style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold, fontSize: 14.0),),
        SizedBox(width:5.0,),
        Text('${formatCurrency.format(oldPrice)}', style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold, fontSize: 14.0),),

      ],)
      ],
      ),
    );
  }
}