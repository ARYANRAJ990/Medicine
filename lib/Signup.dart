import 'package:flutter/material.dart';
import 'package:medicine/start.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _loginState();
}

class _loginState extends State<signup> {
  bool passwordVisible = false;
  bool passwordVisible2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 150, left: 30),
              child: Row(
                children: [
                  Text(
                    'Sign',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                    ),
                  ),
                  Text(
                    'up',
                    style: TextStyle(
                      color:Color(0xFF665CF5),
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 18),
            const SizedBox(
              height: 55,
              width: 295,
              child: TextField(
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.alternate_email_rounded,
                    color: Colors.grey,
                    size: 20,
                  ),
                  hintText: 'Email',
                  alignLabelWithHint: true,
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                ),
              ),
            ),
            SizedBox(height: 17),
            SizedBox(
              height: 55,
              width: 295,
              child: TextField(
                obscureText: !passwordVisible,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    icon: Icon(
                      passwordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                  ),
                  hintText: 'Password',
                  alignLabelWithHint: true,
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                ),
              ),
            ),
            SizedBox(height: 17),
            SizedBox(
              height: 55,
              width: 295,
              child: TextField(
                obscureText: !passwordVisible2,
                keyboardType: TextInputType.text,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    icon: Icon(
                      passwordVisible2 ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        passwordVisible2 = !passwordVisible2;
                      });
                    },
                  ),
                  hintText: 'Confirm Password',
                  alignLabelWithHint: true,
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 55,
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  //  Navigator.push(context,
                  //      MaterialPageRoute(builder: (context) => createAccount()));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: const Color(0xFF665CF5), // text color
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(23), // button's shape
                  ),
                ),
                child: const Text(
                  'Create Account',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF343434),
                  ),
                ),
                TextButton(
                  onPressed: () {
                     Navigator.push(context,
                         MaterialPageRoute(builder: (context) => const Start()));
                  },
                  child: const Text(
                    'Sign in',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF665CF5),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
