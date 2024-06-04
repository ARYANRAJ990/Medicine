import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:medicine/Reports.dart';
import 'package:medicine/add_medicine.dart';
import 'package:medicine/profile.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'Controller.dart';
import '';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  int _selectedIndex = 1; // Changed default index to '1'
  int Index = 1;
  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;

  final List<Widget> _screens = [
    const Center(child: Text('Home Screen')),
    const Center(child: Text('Add Medicine')),
    const Center(child: Text('Profile')),
  ];

  List<String> days = [
    "Sunday Sep 17",
    "Monday Sep 18",
    "Tuesday Sep 19",
    "Wednesday Sep 20",
    "Thursday Sep 21",
    "Friday Sep 22",
    "Saturday Sep 23",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Hi Harry!',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '5 medicines left',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Icon(Icons.medical_services, color: Color(0xFF665CF5), size: 45),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Account()));
              },
              child: ClipOval(
                child: Image.asset(
                  'images/dp.jpg',
                  fit: BoxFit.cover,
                  width: 45,
                  height: 45,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              height: 45,
              width: MediaQuery.of(context).size.width,
              child: ScrollSnapList(
                scrollDirection: Axis.horizontal,
                itemSize: 150,
                itemCount: days.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFF004d4d),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          days[index],
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                onItemFocus: (int) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 9.0, right: 9, top: 23),
              child: SizedBox(
                height: 120,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2), // Shadow color
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 10),
                        child: Text(
                          "Today's Report",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                '5',
                                style: TextStyle(
                                  color: Color(0xFF665CF5),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                ),
                              ),
                              Text(
                                'Total',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '3',
                                style: TextStyle(
                                  color: Color(0xFF665CF5),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                ),
                              ),
                              Text(
                                'Taken',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '1',
                                style: TextStyle(
                                  color: Color(0xFF665CF5),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                ),
                              ),
                              Text(
                                'Missed',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '1',
                                style: TextStyle(
                                  color: Color(0xFF665CF5),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                ),
                              ),
                              Text(
                                'Snoozed',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(right: 12.0, left: 12),
              child: SizedBox(
                height: 130,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2), // Shadow color
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 10),
                        child: Text(
                          "Check Dashboard",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Here you will find everything related to your active and past medicines.',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                              width:
                                  2), // Add some spacing between text and image if needed
                          ClipOval(
                            child: Image.asset(
                              'images/data.png',
                              fit: BoxFit.cover,
                              width: 90,
                              height: 88,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 150),
              child: Text(
                'Morning 08:00 am',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8, left: 8),
              child: SizedBox(
                height: 120,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xFFe6e6ff),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 8, right: 8),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF665CF5),
                                ),
                                child:
                                    Icon(Icons.water_drop_outlined, size: 50),
                              ),
                              SizedBox(
                                  width:
                                      15), // Adjust spacing between icon and text
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Calpol 500mg Tablet',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Before Breakfast',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 18),
                                      Text(
                                        'Day 01',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: 25.0), // Adjust right padding if necessary
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.notifications_outlined,
                                  color: Colors.green, size: 35),
                              Text(
                                'Taken',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Color(0xFFF7F7F7),
        buttonBackgroundColor: Colors.black,
        index: Index,
        animationDuration: Duration(milliseconds: 250),
        onTap: (index) {
          setState(() {
            Index = index;
            _selectedIndex = index; // Added to update the index correctly

            switch (Index) {
              case 0:
                // Navigate to home page
                break;
              case 1:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Medicine())); // Corrected indentation
                break;
              case 2:
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Report()));
                break;
            }
          });
        },
        items: [
          CurvedNavigationBarItem(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home_rounded,
                    size: 32,
                    color: Color(0xFF665CF5)), // Corrected indentation
                Text('Home', style: TextStyle(color: Colors.grey[600])),
              ],
            ),
          ),
          CurvedNavigationBarItem(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add, size: 38, color: Color(0xFF665CF5)),
              ],
            ),
          ),
          CurvedNavigationBarItem(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.signal_cellular_alt,
                    size: 30, color: Color(0xFF665CF5)),
                Text('Report', style: TextStyle(color: Colors.grey[600])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//void main() {
//  runApp(Add());
//  Get.put(InternetController());
//}

