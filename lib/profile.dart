

import 'package:flutter/material.dart';
class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 25),
              child: Row(
                children: [
                  imageProfile(context ),
                // ClipOval(
                //   child: Image.asset(
                //     'images/dp.jpg',
                //     fit: BoxFit.cover,
                //     width: 100,
                //     height: 100,
                //   ),
                // ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Take Care!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'Richa Bose',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 23,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 18),
            Divider(color: Colors.grey[400], thickness: 2),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.only(right: 267.0),
              child: Text(
                'Settings',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 6),
            ListTile(
              leading: Icon(
                Icons.notifications_outlined,
                color: Colors.grey,
                size: 35,
              ),
              titleAlignment: ListTileTitleAlignment.center,
              title: Text(
                'Notification',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                'Check your medicine notification',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onTap: () {
                // Handle tap
              },
            ),
            SizedBox(height: 3),
            ListTile(
              leading: Icon(
                Icons.volume_down_outlined,
                color: Colors.grey,
                size: 45,
              ),
              titleAlignment: ListTileTitleAlignment.center,
              title: Text(
                'Sound',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                'Ring, Silent, Vibrate',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onTap: () {
                // Handle tap
              },
            ),
            SizedBox(height: 3),
            ListTile(
              leading: Icon(
                Icons.person_2_outlined,
                color: Colors.grey,
                size: 35,
              ),
              titleAlignment: ListTileTitleAlignment.center,
              title: Text(
                'Manage Your Account',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                'Password, Email ID, Phone number',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onTap: () {
                // Handle tap
              },
            ),
            SizedBox(height: 6),
            Padding(
              padding: EdgeInsets.only(right: 267.0),
              child: Text(
                'Device',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.0, right: 12.0),
              child: SizedBox(
                height: 180,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFFe6e6ff),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.volume_down_outlined,
                          color: Colors.grey,
                          size: 45,
                        ),
                        titleAlignment: ListTileTitleAlignment.center,
                        title: Text(
                          'Connect',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        subtitle: Text(
                          'Bluetooth, Wifi',
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        onTap: () {
                          // Handle tap
                        },
                      ),
                      Container(
                        margin: EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.only(top: 8.0),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Icon(Icons.volume_down_outlined,color: Colors.grey,size: 35,),
                              titleAlignment: ListTileTitleAlignment.center,
                              title:  Text(' Sound Options',style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),),
                              //tileColor: isSelected ? Colors.grey : null,
                              onTap: () {
                                // Navigator.push(
                                //  context,
                                //  MaterialPageRoute(builder: (context) =>   setPrice()), // Assuming Feed is the widget you want to navigate to
                                // );
                              },
                              subtitle: Text('Vibrate,Silent',style: TextStyle(color: Colors.grey[400],fontSize: 15,fontWeight: FontWeight.normal),),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 240.0,top: 20),
              child: Text(
                'Caretakers',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(right: 12.0, left: 12.0),
              child: SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFFe6e6ff),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ClipOval(
                            child: Image.asset(
                              'images/dp.jpg',
                              fit: BoxFit.cover,
                              width: 55,
                              height: 55,
                            ),
                          ),
                          Text('Dipa Luna',style: TextStyle(color: Colors.grey,fontSize: 15),),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ClipOval(
                            child: Image.asset(
                              'images/medicine.jpg',
                              fit: BoxFit.cover,
                              width: 55,
                              height: 55,
                            ),
                          ),
                          Text('Roza',style: TextStyle(color: Colors.grey,fontSize: 15)),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ClipOval(
                            child: Image.asset(
                              'images/dp.jpg',
                              fit: BoxFit.cover,
                              width: 55,
                              height: 55,
                            ),
                          ),
                          Text('Lipsa',style: TextStyle(color: Colors.grey,fontSize: 15)),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: TextButton(
                              onPressed: () {
                                // Handle button press
                              },
                              child: Icon(Icons.add,color: Colors.grey,size: 34,),
                            ),
                          ),
                          Text(
                            'Add',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 267.0,top: 20),
              child: Text(
                'Doctor',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(right: 12.0, left: 12.0),
              child: SizedBox(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFFe6e6ff),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF665CF5),
                            ),
                            child: TextButton(
                              onPressed: () {
                                // Handle button press
                              },
                              child: Icon(Icons.add,color: Colors.white,size: 50,),
                            ),
                          ),
                          Text(
                            'Add Your Doctors',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 3),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 16.0,

                                fontWeight: FontWeight.bold,
                                color: Colors.black, // Default color for other text
                              ),
                              children: <TextSpan>[
                                TextSpan(text: 'or use '),
                                TextSpan(
                                  text: 'Invitle Link',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color(0xFFffb84d), // Color for 'Invitle Link'
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding:  EdgeInsets.only(right: 240.0),
              child: TextButton(onPressed: (){}, child: Text('Privacy Policy',
              style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),)),
            ),
            SizedBox(height: 15),
            Padding(
              padding:  EdgeInsets.only(right: 240.0),
              child: TextButton(onPressed: (){}, child: Text('Terms of Use ',
                style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),)),
            ),
            SizedBox(height: 15),
            Padding(
              padding:  EdgeInsets.only(right: 277.0),
              child: TextButton(onPressed: (){}, child: Text('Rate Us ',
                style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),)),
            ),
            SizedBox(height: 15),
            Padding(
              padding:  EdgeInsets.only(right: 288.0),
              child: TextButton(onPressed: (){}, child: Text('Share ',
                style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),)),
            ),
            Padding(
              padding:  EdgeInsets.all(20.0),
              child: Center(
                child: SizedBox(
                  height: 55,
                  width: 315,
                  child: ElevatedButton(
                    onPressed: () {
                     // Navigator.push(context, MaterialPageRoute(builder: (context) => Add()));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.transparent, // Inner color transparent
                      elevation: 0, // Remove elevation shadow
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color:  Color(0xFF665CF5), width: 2), // Outer line in blue color
                      ),
                    ),
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.black, // Text color to match the border, if desired
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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
Widget bottomSheet() {
  return SingleChildScrollView(
    child: Container(
      height: 120,
      width: 100, // Use the full width available
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text(
            'Choose Profile Photo',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // To space out the icons
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.camera_alt,
                      color: Colors.black,
                      size: 27,
                    ),
                  ),
                  Text('Camera'),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.photo,
                      color: Colors.black,
                      size: 27,
                    ),
                  ),
                  Text('Gallery'),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget imageProfile(BuildContext context) {
  return SingleChildScrollView(
    child: Stack(
      children: [
        CircleAvatar(
          radius: 80,
          backgroundImage: AssetImage("images/dp.jpg"),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: InkWell(
            onTap: () {
             // showModalBottomSheet(
             //   context: context,
             //   builder: (builder) => bottomSheet(),
             // );
            },
            child: Icon(
              Icons.camera_alt,
              color: Color(0xFF665CF5),
              size: 28,
            ),
          ),
        ),
      ],
    ),
  );
}
