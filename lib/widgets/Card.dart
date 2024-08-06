// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:application_3/main.dart';

class Cardq extends StatelessWidget {
  final Quotation item;
  final Function deleteQuotes;

  Cardq(
      {required this.deleteQuotes , required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.5,
      shadowColor: Colors.white,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.black,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              item.title,
              style: TextStyle(
                fontSize: 25,
                color: Colors.brown[600],
                fontWeight: FontWeight.w400,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.person,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white54,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    deleteQuotes(item);
                  },
                  icon: Icon(Icons.delete),
                  iconSize: 25,
                  color: Colors.white54,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
