import 'package:flutter/material.dart';
import 'package:homework2/helpers/textstyle.dart';
import 'package:homework2/models/Product.dart';

class Favorites extends StatefulWidget {

  List<Product> favorites;

  Favorites({this.favorites});

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.lightGreen,
        title: Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomText(text: "Favorites", weight: FontWeight.bold, size: 26,),
        ),

      ),
      body: Column(
        children: [
          Center(
            child: Column(
                children: widget.favorites.map((item) => GestureDetector(
                    onTap : () async{

                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:  GestureDetector(
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
                    ))).toList()
            ),
          )
        ],
      ),
    );
  }
}
