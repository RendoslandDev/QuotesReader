// ignore_for_file: file_names, prefer_const_constructors, non_constant_identifier_names, sized_box_for_whitespace

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? quotes, author;
  bool business = true, amazing = false, education = false, fitness = true;

  Future<void> fetchquote(String Category) async {
    final response = await http.get(
        Uri.parse('https://api.api-ninjas.com/v1/quotes?category=$Category'),
        headers: {
          'Content-Type': 'application/json',
          'X-Api-Key': 'P/oXqlUJgg6mUrd0IW5LLw==9e3rIvcXVCNMa480',
        });

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      if (jsonData.isNotEmpty) {
        Map<String, dynamic> quotedata = jsonData[0];
        quotes = quotedata["quote"];
        author = quotedata["author"];
        setState(() {});
      }
    }
  }

  @override
  void initState() {
    fetchquote('business');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'images/woodenimage.jpeg',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          Container(
            padding: EdgeInsets.only(top: 50.0),
            child: Column(
              children: [
                Center(
                  child: const Text(
                    "Quotify",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  height: 30,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                      business
                          ? Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 5),
                                decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  "Business",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: () async {
                                business = true;
                                amazing = false;
                                fitness = false;
                                education = false;
                                await fetchquote('business');
                                setState(() {});
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 5),
                                margin: EdgeInsets.only(left: 20),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(
                                  "Business",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                      amazing
                          ? Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 5),
                                decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  "Amazing",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: () async {
                                business = false;
                                amazing = true;
                                fitness = false;
                                education = false;
                                await fetchquote('amazing');
                                setState(() {});
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 5),
                                margin: EdgeInsets.only(left: 20),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(
                                  "Amazing",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                      education
                          ? Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 5),
                                decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  "Education",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: () async {
                                business = false;
                                amazing = false;
                                fitness = false;
                                education = true;
                                await fetchquote('education');

                                setState(() {});
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 5),
                                margin: EdgeInsets.only(left: 20),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(
                                  "Education",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                      fitness
                          ? Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 5),
                                decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  "Fitness",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: () async {
                                business = false;
                                amazing = false;
                                fitness = true;
                                education = false;
                                await fetchquote('fitness');
                                setState(() {});
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 5),
                                margin: EdgeInsets.only(left: 20),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(
                                  "Fitness",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
                SizedBox(height: 60),
                Container(
                  padding: EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 30, bottom: 40),
                  margin: EdgeInsets.only(left: 10.0, right: 10.0),
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        quotes!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 60.0),
                      Text(
                        "-${author!}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
