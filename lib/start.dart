import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicine/Signup.dart';
import 'package:medicine/auth_view_model.dart';
import 'package:medicine/snackbar.dart';
import 'package:provider/provider.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class Start extends StatefulWidget {
  static const String routeName = '/start';
  const Start({Key? key}) : super(key: key);

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  String _emailError = '';
  String _passwordError = '';
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

  @override
  void initState() {
    super.initState();
    final authVM = Provider.of<AuthViewModel>(context, listen: false);
    authVM.emailText.clear();
    authVM.passwordText.clear();
  }

  bool _isEmailValid(String email) {
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    return regex.hasMatch(email);
  }

  bool _isPasswordValid(String password) {
    final regex =
        RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    return regex.hasMatch(password);
  }

  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    final authVM = Provider.of<AuthViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  height: 85,
                  child: Image.asset('images/medicine.jpg'),
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 39,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.alternate_email,
                          color: Color(0xFF00BFA6),
                          size: 30,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            controller: authVM.emailText,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              alignLabelWithHint: true,
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey[400]!,
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey[600]!,
                                  width: 2.0,
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0), // Remove extra padding
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (_emailError.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          _emailError,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.lock_open_outlined,
                          color: Color(0xFF00BFA6),
                          size: 30,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            obscureText: !passwordVisible,
                            keyboardType: TextInputType.text,
                            controller: authVM.passwordText,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                },
                              ),
                              hintText: 'Enter your password',
                              alignLabelWithHint: true,
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey[400]!,
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey[600]!,
                                  width: 2.0,
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0), // Remove extra padding
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (_passwordError.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          _passwordError,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 236.0),
                child: TextButton(
                  onPressed: () {
                    //  Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const forget()),
                    //  );
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF665CF5),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: SizedBox(
                  height: 55,
                  width: 290,
                  child: ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        _emailError = _isEmailValid(authVM.emailText.text)
                            ? ''
                            : 'Please enter a valid email address';
                        _passwordError =
                            _isPasswordValid(authVM.passwordText.text)
                                ? ''
                                : 'Please enter a correct password';
                      });

                      if (_emailError.isEmpty && _passwordError.isEmpty) {
                        if (authVM.emailText.text.isNotEmpty &&
                            authVM.passwordText.text.isNotEmpty) {
                          final loginResult = await authVM.login(context);
                          if (!loginResult) {
                            setState(() {
                              _emailError = 'This email does not exist';
                            });
                          }
                        } else {
                          showSnackBar(
                              context: context, message: 'Fill all fields');
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: const Color(0xFF665CF5),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 2,
                      color: Colors.grey[400],
                      indent: 20.0,
                      endIndent: 10.0,
                    ),
                  ),
                  Text('OR',
                      style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 15,
                          fontWeight: FontWeight.normal)),
                  Expanded(
                    child: Divider(
                      thickness: 2,
                      color: Colors.grey[400],
                      indent: 10.0,
                      endIndent: 20.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Center(
                child: SizedBox(
                  height: 55,
                  width: 290,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: const Color(0xFF665CF5),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'images/finalbg.png', // Make sure to add your Google logo image in the assets folder
                          height: 24.0, // Adjust the height as needed
                        ),
                        SizedBox(
                            width:
                                15.0), // Adjust the space between the image and text
                        Text(
                          'Continue with Google',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'New to Adhicine?',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF343434),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Signup()),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF665CF5),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
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
