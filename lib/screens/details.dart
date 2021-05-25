import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:furniture_app/util/data.dart';
import 'package:furniture_app/widgets/badge.dart';
import 'package:furniture_app/widgets/product_item.dart';
import 'package:unicorndial/unicorndial.dart';
import '../util/const.dart';
import '../ar/measurement_ar.dart';
import '../ar/test_ar.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Center(
            child: IconBadge(
              icon: Feather.shopping_cart,
            ),
          ),
          SizedBox(width: 20.0),
        ],
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            children: <Widget>[
              SizedBox(height: 10.0),
              buildImage(),
              SizedBox(height: 20.0),
              Text(
                "${furnitures[0]["name"]}",
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "\$550.00",
                style: TextStyle(
                  fontSize: 27.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 30.0),
              Text(
                "Description",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "Sed porttitor lectus nibh. Cras ultricies ligula "
                "sed magna dictum porta. Praesent sapien massa, "
                "convallis a pellentesque nec, egestas non nisi. "
                "Lorem ipsum dolor sit amet, consectetur adipiscing "
                "elit. Nulla porttitor accumsan tincidunt. "
                "Curabitur arcu erat, accumsan id imperdiet et, "
                "porttitor at sem.",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                "Photos",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              buildProductList(),
              SizedBox(height: 10.0),
            ],
          ),

          //DetailButton(),
          // buildFloatingButton(),
        ],
      ),
      floatingActionButton: UnicornDialer(
          parentButtonBackground: Constants.darkAccent,
          orientation: UnicornOrientation.VERTICAL,
          parentButton: Icon(
            Icons.add,
            color: Colors.white,
          ),
          childButtons: floatingActionButtonItems()),
    );
  }

  List<UnicornButton> floatingActionButtonItems() {
    var childButtons = List<UnicornButton>();

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "Add",
        currentButton: FloatingActionButton(
          heroTag: "add",
          backgroundColor: Constants.darkAccent,
          mini: true,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () => floatingActionButtonPressed('add'),
        )));

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "Test",
        currentButton: FloatingActionButton(
          heroTag: "test",
          backgroundColor: Constants.darkAccent,
          mini: true,
          child: Icon(
            Icons.create,
            color: Colors.white,
          ),
          onPressed: () => floatingActionButtonPressed('test'),
        )));
    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "Measurement",
        currentButton: FloatingActionButton(
          heroTag: "measurement",
          backgroundColor: Constants.darkAccent,
          mini: true,
          child: Icon(
            Icons.confirmation_number,
            color: Colors.white,
          ),
          onPressed: () => floatingActionButtonPressed('measurement'),
        )));
    return childButtons;
  }

  buildProductList() {
    return Container(
      height: 100.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: furnitures.length,
        itemBuilder: (BuildContext context, int index) {
          Map furniture = furnitures.reversed.toList()[index];

          return ProductItem(
            furniture: furniture,
          );
        },
      ),
    );
  }

  void floatingActionButtonPressed(String tag) {
    switch (tag) {
      case "measurement":
        {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return MeasurePage();
              },
            ),
          );
          break;
        }
      case 'test':
        {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return TestAr();
              },
            ),
          );
          break;
        }
      default:
        {
          print("add clicked");
          //TODO: add this via database
          break;
        }
    }
  }

  buildImage() {
    return Container(
      height: 240.0,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              "${furnitures[0]["img"]}",
              height: 240.0,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: -10.0,
            bottom: 3.0,
            child: RawMaterialButton(
              onPressed: () {},
              fillColor: Colors.white,
              shape: CircleBorder(),
              elevation: 4.0,
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Icon(
                  Feather.heart,
                  color: Theme.of(context).accentColor,
                  size: 17.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
