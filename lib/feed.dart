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

  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected && isAlertSet == false) {
            showDialogBox();
            setState(() => isAlertSet = true);
          }
        },
      );

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

  showDialogBox() {
    return (BuildContext context) {
      return Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      title: Center(
                        child: Text(
                          'Your device is not connected',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 22,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('images/signalr.png'),
                          SizedBox(height: 10),
                          Text(
                            'Connect your device with',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 110,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color(0xFF665CF5),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: IconButton(
                                icon:
                                    Icon(Icons.bluetooth, color: Colors.white),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  // Add your onPressed code here
                                },
                              ),
                            ),
                            Container(
                              width: 110,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color(0xFF665CF5),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: IconButton(
                                icon: Icon(Icons.wifi, color: Colors.white),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  // Add your onPressed code here
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    };
  }
}

//void main() {
//  runApp(Add());
//  Get.put(InternetController());
//}

