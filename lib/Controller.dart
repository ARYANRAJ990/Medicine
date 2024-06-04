import 'dart:async';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isConnectedToInternet = false;
  StreamSubscription? _internetConnectionSubscription;

  @override
  void initState() {
    super.initState();
    _internetConnectionSubscription =
        InternetConnectionChecker().onStatusChange.listen((status) {
          setState(() {
            isConnectedToInternet = status == InternetConnectionStatus.connected;
          });
        });
  }

  @override
  void dispose() {
    _internetConnectionSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isConnectedToInternet
                ? Container()
                : Padding(
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
                              icon: Icon(Icons.bluetooth, color: Colors.white),
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
  }
}
