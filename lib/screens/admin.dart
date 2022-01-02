// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nbb/const.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);
  static const String id = 'admin_screen';

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30).copyWith(top: 0),
            child: SizedBox(
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
              child: Card(
                color: blackColor,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: const Icon(
                      Icons.image,
                      size: 80,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {},
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 20,
                    spreadRadius: 5,
                  )
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 0, color: Colors.transparent),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 0, color: Colors.transparent),
                  ),
                  hintText: 'Product Name',
                  hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                ),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                cursorColor: blackColor,
                onChanged: (value) {},
                onSubmitted: (value) {},
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: GestureDetector(
              onTap: () => setState(() => isSwitched = !isSwitched),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 20,
                      spreadRadius: 5,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Shoe',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: isSwitched ? Colors.grey : blackColor,
                        ),
                      ),
                      Transform.scale(
                        scale: 1.6,
                        child: CupertinoSwitch(
                          value: isSwitched,
                          onChanged: (value) => setState(() => isSwitched = !isSwitched),
                          activeColor: Colors.grey[200],
                          thumbColor: blackColor,
                          trackColor: Colors.grey[200],
                        ),
                      ),
                      Text(
                        'Cloth',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: isSwitched ? blackColor : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30).copyWith(bottom: 30),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 20,
                    spreadRadius: 5,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Text(
                      'Size',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: blackColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50).copyWith(bottom: 20),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'From',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: blackColor,
                          ),
                        ),
                        SizedBox(
                          width: 70,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            cursorColor: blackColor,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(width: 1, color: blackColor),
                              ),
                            ),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Text(
                          'To',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: blackColor,
                          ),
                        ),
                        SizedBox(
                          width: 70,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            cursorColor: blackColor,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(width: 1, color: blackColor),
                              ),
                            ),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 20,
                    spreadRadius: 5,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Text(
                      'Colors',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: blackColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: Card(
                            shape: const CircleBorder(),
                            color: Colors.pink[600],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: Card(
                            shape: const CircleBorder(),
                            color: Colors.blue,
                            child: Icon(Icons.check, color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: Card(
                            shape: const CircleBorder(),
                            color: Colors.green,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: Card(
                            shape: const CircleBorder(),
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: Card(
                            shape: const CircleBorder(),
                            color: Colors.black,
                            child: Icon(Icons.check, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 20,
                    spreadRadius: 5,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: blackColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30).copyWith(bottom: 30),
                    child: TextField(
                      decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: blackColor),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.grey),
                        ),
                        hintText: 'Description',
                        hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      maxLines: 4,
                      cursorColor: blackColor,
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 30),
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              margin: EdgeInsets.zero,
              shape:
                  const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
              color: blackColor,
              child: InkWell(
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    'Submit',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
