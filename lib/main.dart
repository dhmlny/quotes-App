// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:application_3/widgets/Card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: Quotes(),
    );
  }
}

class Quotes extends StatefulWidget {
  const Quotes({super.key});

  @override
  State<Quotes> createState() => _QuotesState();
}

class Quotation {
  String title;
  String person;
  Quotation({required this.title, required this.person});
}

class _QuotesState extends State<Quotes> {
  //List for all quotes
  List allQuotes = [
    Quotation(
      title: "Your positive thoughts can create a positive reality",
      person: "dhmlny",
    ),
    Quotation(
      title: "Change is scary , but change is growth",
      person: "dhmlny",
    ),
    Quotation(
      title: "Even the darkest night will end and the sun will rise",
      person: "dhmlny",
    ),
  ];
//to delete
  deleteQuotes(item) {
    setState(() {
      allQuotes.remove(item);
    });
  }

  final myController = TextEditingController(); //for add text
  final myController1 = TextEditingController(); //for add text

  //add quotes
  addQuotes() {
    setState(() {
      allQuotes.add(
        Quotation(title: myController.text, person: myController1.text),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.brown,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          onPressed: () {
            showModalBottomSheet(
              
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                context: context,
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: myController,
                          maxLength: 40,
                          decoration:
                              InputDecoration(
                                hintText: "Add new quote :",
                                hintStyle: TextStyle(color: Colors.brown),
                                ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: myController1,
                          maxLength: 10,
                          decoration:
                              InputDecoration(
                                hintText: "Add author:", 
                                hintStyle: TextStyle(color: Colors.white54),
                              ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextButton(
                            onPressed: () {
                              addQuotes();
                              Navigator.pop(context);
                            },
                            child: Text(
                              "ADD",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            )),
                      ],
                    ),
                  );
                },
                isScrollControlled: true);
          },
          child: Icon(
            Icons.add,
            size: 25,
            color: Colors.white54,
          ),
        ),
        backgroundColor: Colors.white12,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Best Quotes",
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ...allQuotes
                  .map((item) => Cardq(
                        item: item,
                        deleteQuotes: deleteQuotes,
                      ))
                  .toList(),
            ],
          ),
        ));
  }
}
