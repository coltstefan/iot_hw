import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:homework2/helpers/screennav.dart';
import 'package:homework2/helpers/textstyle.dart';
import 'package:homework2/models/Product.dart';
import 'package:homework2/widget/product_widdget.dart';

import 'favorites.dart';






class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  List<Product> productsList = [
    Product("Cereale", 12,1),
    Product("Salata", 9,2),
    Product("Lapte", 4,3)
  ];

  List<Product> favorites = [];

  final _key = GlobalKey<ScaffoldState>();

  void _onItemTapped(int index) {
    setState(() {
      print(_selectedIndex);
       _selectedIndex = index;

       if(_selectedIndex == 1)
         {
           changeScreen(context, Favorites(favorites: favorites,));
         }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Center(child: CustomText(text: "My Shopping List", weight: FontWeight.bold, size: 26,)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(26.0),
            child: Center(child: CustomText(text: "Products you can to buy: ", size: 28 , color: Colors.lightGreen, weight: FontWeight.bold)),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(8,8,8,10),
            child: Center(
              child: Column(
                  children: productsList.map((item) =>  Slidable(
                    child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: (){
                                return showDialog<void>(context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context){
                                      return AlertDialog(
                                        title: CustomText(text:item.name,),
                                        content: SingleChildScrollView(
                                          child: ListBody(
                                            children: [
                                              CustomText(text: "Price: ${item.price}"),
                                              CustomText(text: "Quantity: ${item.quantity}")
                                            ],
                                          ),
                                        ),
                                        actions: [
                                          TextButton(onPressed: (){
                                            Navigator.of(context).pop();
                                          }, child: CustomText(text: "back",))
                                        ],
                                      );
                                    });
                              },

                              child: Container(
                                height: 120,
                                //width: 340,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(8,37,8,8),
                                      child: Center(child: CustomText(text: item.name,weight: FontWeight.bold,size: 30,)),
                                    )

                                  ],
                                ),

                              ),
                            ),
                          ),
                    actionPane: SlidableBehindActionPane(),
                    actions: [
                      IconSlideAction(
                        caption: "Add to favorites",
                        color: Colors.green,
                        icon: Icons.favorite,
                        onTap: () {

                          setState(() {
                            favorites.add(item);
                            print(favorites);
                          });


                        },
                      ),
                    ],

                    secondaryActions: [
                      IconSlideAction(
                        caption: "Delete",
                        color: Colors.red,
                        icon: Icons.delete,
                        onTap: (){
                          setState(() {
                            productsList.remove(item);
                            favorites.remove(item);

                          });
                        },
                      ),
                      IconSlideAction(
                        caption: "Remove Favorite",
                        color: Colors.yellow,
                        icon: Icons.remove_circle_outline,
                        onTap: (){
                            setState(() {
                              favorites.remove(item);

                          });}
                      )
                    ],
                  ),
                  ).toList()
              ),
            ),
          ),


    ]
    ),
      bottomNavigationBar: BottomNavigationBar(

        items:  const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
                 icon: Icon(Icons.home),
                 label: "Home",
                 backgroundColor: Colors.lightGreen,
                 ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorites",
              backgroundColor: Colors.lightGreen
              ),


        ],
        selectedItemColor: Colors.lightGreen,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}



