import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:markus/Objects/itemclass.dart';
import 'package:markus/values.dart';
import 'package:markus/Screens/itemDetails.dart';

class OfferItem extends StatelessWidget {
  final Item item;
  OfferItem(this.item);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return ItemDetail(item);
            },
          ));
        },
        // child: Card(
        //   // color: ,
        child: Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: [colors[0], colors[2], colors[3]]),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                      Text(
                        item.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: colors[5], fontSize: 18),
                      ),
                      Text(
                        '${(((item.cost - item.price) / item.cost) * 100).ceil()}% Off',
                        style:
                            TextStyle(color: Colors.green[800], fontSize: 18),
                      ),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: '₹${(item.cost).ceil()}',
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: colors[5],
                              fontSize: 23),
                        ),
                        TextSpan(
                          text: '   ₹${item.price.floor()}  ',
                          style: TextStyle(fontSize: 25, color: colors[5]),
                        ),
                      ])),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient:
                                LinearGradient(colors: [colors[4], colors[3]])),
                        child: FlatButton(
                          onPressed: () {},
                          child: Text(
                            'Buy Now',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                      )
                    ])),
                Expanded(child: Image.network(item.image)),
              ],
            ) //),
            ));
  }
}
