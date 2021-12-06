import 'package:flutter/material.dart';
import 'package:nutritionapp/modal/foodItem.dart';
import 'detailsPage.dart';


class FoodMainScreen extends StatefulWidget {
  const FoodMainScreen({Key? key, }) : super(key: key);

  @override
  State<FoodMainScreen> createState() => _FoodMainScreenState();
}

class _FoodMainScreenState extends State<FoodMainScreen> {
  List<FoodItem> foodItemList = [
    const FoodItem(imgPath: 'assets/plate1.png', itemName: 'Salmon bowl', itemPrice: '\$22.00'),
    const FoodItem(imgPath: 'assets/plate2.png', itemName: 'Spring bowl', itemPrice: '\$24.00'),
    const FoodItem(imgPath: 'assets/plate6.png', itemName: 'Avocado bowl', itemPrice: '\$27.00'),
    const FoodItem(imgPath: 'assets/plate5.png', itemName: 'Berry bowl', itemPrice: '\$29.00'),
    //Run Time Error
  ];


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff21bfbd),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0,left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: (){},
                ),
                Container(
                  width: 125.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.filter_list),
                        color: Colors.white,
                        onPressed: (){},
                      ),
                      IconButton(
                        color: Colors.white,
                        icon: const Icon(Icons.menu),
                        onPressed: (){},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25.0),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Row(
              children: const <Widget>[
                Text('Healthy',
                  style: TextStyle(
                    fontFamily: 'Montserrat', color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25.0,
                  ),
                ),
                SizedBox(width: 10.0),
                Text('Food',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontSize: 25.0),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40.0),
          SingleChildScrollView(
            child: Container(
              height: size.height -185.0, ////note
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0),
                ),
              ),
              child: ListView(
                primary: false,
                padding: EdgeInsets.only(left: 25.0, right: 20.0),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 45.0),
                    child: Container(
                        height: size.height *0.59,   ///////notee


                      child: ListView.builder(
                        itemCount: foodItemList.length,
                        itemBuilder: (context, index) => Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildFoodItem(foodItemList[index]),
                          ],
                        ),
                      ),


                      //METHOD ONE USING LISTVIEW BUILDER
                      // child: ListView.builder(
                      //     itemCount: foodItemList.length,
                      //     itemBuilder: (context, index) => Column(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         _buildFoodItem(foodItemList[index].imgPath, foodItemList[index].itemName, foodItemList[index].itemPrice),
                      //       ],
                      //     ),
                      // ),


                      // METHOD TWO USING ONLY LISTVIEW
                        // child: ListView(children: [
                        //   Column(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       _buildFoodItem('assets/plate1.png', 'Salmon bowl', '\$24.00'),
                        //       const SizedBox(height: 10,),
                        //       _buildFoodItem('assets/plate2.png', 'Spring bowl', '\$22.00'),
                        //       const SizedBox(height: 10,),
                        //       _buildFoodItem('assets/plate6.png', 'Avocado bowl', '\$26.00'),
                        //       const SizedBox(height: 10,),
                        //       _buildFoodItem('assets/plate5.png', 'Berry bowl', '\$24.00')
                        //     ],
                        //   ),
                        // ])
                      // height: size.height -300.0,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            style: BorderStyle.solid, width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: const Center(
                          child: Icon(Icons.search, color: Colors.black),
                        ),
                      ),
                      Container(
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            style: BorderStyle.solid, width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: const Center(
                          child: Icon(Icons.shopping_basket, color: Colors.black),
                        ),
                      ),
                      Container(
                        height: 60.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              style: BorderStyle.solid, width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                            color: Color(0xFF1C1428)),
                        child: const Center(
                          child: Text('Checkout',
                            style: TextStyle(fontFamily: 'Montserrat', color: Colors.white, fontSize: 15.0),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  // receiver .. // receiver ko hameesha batana hota hai k data kis type ka aae ga

  Widget _buildFoodItem(FoodItem item) {
    print(item);
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      DetailsPage(heroTag: item.imgPath, foodName: item.itemName, foodPrice: item.itemPrice)
                     // DetailsPage_new(data: item),
              ));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    child: Row(
                        children: [
                          Hero(
                              tag: item.imgPath,
                              child: Image(image: AssetImage(item.imgPath), fit: BoxFit.cover, height: 75.0, width: 75.0,
                              )
                          ),
                          const SizedBox(width: 10.0),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[
                                Text(
                                    item.itemName,
                                    style: const TextStyle(fontFamily: 'Montserrat', fontSize: 17.0, fontWeight: FontWeight.bold,
                                    )
                                ),
                                Text(
                                  item.itemPrice,
                                  style: const TextStyle(fontFamily: 'Montserrat', fontSize: 15.0, color: Colors.grey,
                                  ),
                                )
                              ]
                          )
                        ]
                    )
                ),
                IconButton(
                    icon: Icon(Icons.add),
                    color: Colors.black,
                    onPressed: () {}
                )
              ],
            )
        ));
  }



  // Widget _buildFoodItem(String imgPath, String foodName, String price) {
  //   return Padding(
  //       padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
  //       child: InkWell(
  //           onTap: () {
  //             Navigator.of(context).push(MaterialPageRoute(
  //                 builder: (context) => DetailsPage(heroTag: imgPath, foodName: foodName, foodPrice: price)
  //             ));
  //           },
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: <Widget>[
  //               Container(
  //                   child: Row(
  //                       children: [
  //                         Hero(
  //                             tag: imgPath,
  //                             child: Image(image: AssetImage(imgPath), fit: BoxFit.cover, height: 75.0, width: 75.0,
  //                             )
  //                         ),
  //                         const SizedBox(width: 10.0),
  //                         Column(
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children:[
  //                               Text(
  //                                   foodName,
  //                                   style: const TextStyle(fontFamily: 'Montserrat', fontSize: 17.0, fontWeight: FontWeight.bold,
  //                                   )
  //                               ),
  //                               Text(
  //                                 price,
  //                                 style: const TextStyle(fontFamily: 'Montserrat', fontSize: 15.0, color: Colors.grey,
  //                                 ),
  //                               )
  //                             ]
  //                         )
  //                       ]
  //                   )
  //               ),
  //               IconButton(
  //                   icon: Icon(Icons.add),
  //                   color: Colors.black,
  //                   onPressed: () {}
  //               )
  //             ],
  //           )
  //       ));
  // }
}

