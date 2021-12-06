import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {

  final String heroTag;
  final String foodName;
  final String foodPrice;

  const DetailsPage({Key? key,
    required this.heroTag,
    required this.foodName,
    required this.foodPrice,
  }) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var selectedCard = 'WEIGHT';
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xFF7A9BEE),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: const Text('Details',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 18.0, color: Colors.white),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {},
              color: Colors.white,
            )
          ],
        ),
        body: ListView(children: [
          Stack(children: [
            Container(
                height: MediaQuery.of(context).size.height - 82.0,   //////note
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent),
            Positioned(
                top: 75.0,
                child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(45.0), topRight: Radius.circular(45.0),
                        ),
                        color: Colors.white,
                    ),
                    height: size.height - 100.0,
                    width: size.width),
            ),
            Positioned(
                top: 30.0,
                left: (MediaQuery.of(context).size.width / 2) - 100.0,
                child: Hero(
                    tag: widget.heroTag,
                    child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(widget.heroTag),
                                fit: BoxFit.cover)),
                        height: 200.0,
                        width: 200.0))),
            Positioned(
                top: 250.0,
                left: 25.0,
                right: 25.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.foodName,
                        style: const TextStyle(
                            fontFamily: 'Montserrat', fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(widget.foodPrice,
                            style: const TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20.0,
                                color: Colors.grey)),
                        Container(height: 25.0, color: Colors.grey, width: 1.0),
                        Container(
                          width: 125.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17.0),
                              color: const Color(0xFF7A9BEE)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 25.0,
                                  width: 25.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7.0),
                                      color: Color(0xFF7A9BEE)),
                                  child: const Center(
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                              const Text('2',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Montserrat',
                                      fontSize: 15.0)),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 25.0,
                                  width: 25.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7.0),
                                      color: Colors.white),
                                  child: const Center(
                                    child: Icon(
                                      Icons.add,
                                      color: Color(0xFF7A9BEE),
                                      size: 20.0,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                        height: 150.0,
                        // color: Colors.grey,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          children: <Widget>[
                            _buildInfoCard('WEIGHT', '300', 'G'),
                            SizedBox(width: 10.0),
                            _buildInfoCard('CALORIES', '267', 'CAL'),
                            SizedBox(width: 10.0),
                            _buildInfoCard('VITAMINS', 'A, B6', 'VIT'),
                            SizedBox(width: 10.0),
                            _buildInfoCard('AVAIL', 'NO', 'AV')
                          ],
                        )
                    ),
                    const SizedBox(height: 50.0),
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0), bottomLeft: Radius.circular(25.0), bottomRight: Radius.circular(25.0)),
                          color: Colors.black
                      ),
                      height: 50.0,
                      child: const Center(
                        child: Text(
                            '\$52.00',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat'
                            )
                        ),
                      ),
                    ),
                    const SizedBox(height: 0.5),
                  ],
                ))
          ])
        ]));
  }

  Widget _buildInfoCard(String cardTitle, String info, String unit) {
    return InkWell(
        onTap: () {
          selectCard(cardTitle);
        },
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: cardTitle == selectedCard ? const Color(0xFF7A9BEE) : Colors.white,
              border: Border.all(
                  color: cardTitle == selectedCard ? Colors.transparent : Colors.grey.withOpacity(0.3),
                style: BorderStyle.solid,
                  width: 2,
              ),

            ),
            height: 100.0,   ////note
            width: 100.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(cardTitle,
                        style: TextStyle(fontFamily: 'Montserrat', fontSize: 12.0,
                          color: cardTitle == selectedCard ? Colors.white : Colors.grey.withOpacity(0.7),
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(info,
                            style: TextStyle(fontFamily: 'Montserrat',
                                fontSize: 14.0, color: cardTitle == selectedCard ? Colors.white : Colors.black,
                                fontWeight: FontWeight.bold)),
                        Text(unit,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12.0,
                              color: cardTitle == selectedCard ? Colors.white : Colors.black,
                            ))
                      ],
                    )
                  ]
              ),
            )
        )
    );
  }

  selectCard(cardTitle) {
    setState(() {
      selectedCard = cardTitle;
    });
  }
}
