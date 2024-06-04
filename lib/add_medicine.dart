import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:medicine/snackbar.dart';

class Medicine extends StatefulWidget {
  const Medicine({super.key});

  @override
  State<Medicine> createState() => _MedicineState();
}

class _MedicineState extends State<Medicine> {
  int selectedIndexRect = -1;
  int selectedIndexCircle = -1;
  int selectedSquareIndex = -1;
  int height = 180;
  double _counter = 0.0;
  int index=1;

  String selectedFrequency = "Everyday";
  String selectedTimesPerDay = "Once a day";
  String selectedTimesPerDayy = "Dose 1";
  List<String> timesPerDayy = [
    "Dose 1",
    "Dose 2",
    "Dose 3",
  ];

  List<String> frequencies = [
    "Everyday",
    "Alternate",
    "Once in a week",
  ];

  List<String> timesPerDay = [
    "Once a day",
    "Twice a day",
    "Three times a day",
  ];

  final List<Color> colors = [
    const Color(0xFFffe6ff),
    const Color(0xFFccccff),
    const Color(0xFFccffcc),
    const Color(0xFFffddcc),
    const Color(0xFFfff2cc),
    const Color(0xFFffccff),
    const Color(0xFFccffff),
    const Color(0xFFffb3d1),
    const Color(0xFFccffff),
    const Color(0xFFffcce0),
  ];

  final List<IconData> icons = [
    Icons.vaccines,
    Icons.healing,
    Icons.bloodtype_outlined,
    Icons.safety_check,
    Icons.sanitizer,
    Icons.mediation_outlined,
  ];

  final List<String> iconNames = [
    'Vaccines',
    'Healing',
    'Blood Type',
    'Safety',
    'Sanitizer',
    'Mediation',
  ];

  void _incrementCounter() {
    setState(() {
      _counter += 0.5;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter >= 0.5) {
        _counter -= 0.5;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          'Add Medicines',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Center(
                child: SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 15,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF665CF5)),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      prefixIcon: const Icon(Icons.search, color: Color(0xFFABABAB)),
                      hintText: 'Search Medicine Name',
                      hintStyle: const TextStyle(
                        color: Color(0xFFABABAB),
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                      suffixIcon: const Icon(Icons.mic, color: Color(0xFFABABAB)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(color: Color(0xFFF7F7F7)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Compartment',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndexRect = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: selectedIndexRect == index ? const Color(0xFFe9e7fd) : Colors.white70,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Colour',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: colors.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndexCircle = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: colors[index],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Type',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: icons.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSquareIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.all(8.0),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                              color: selectedSquareIndex == index
                                  ? Colors.grey[200]
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Center(
                              child: Icon(
                                icons[index],
                                color: const Color(0xFF665CF5),
                                size: 45,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          iconNames[index],
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 13),
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Quantity',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 2,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        ' Take $_counter Pill',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                FloatingActionButton(
                  onPressed: _decrementCounter,
                  tooltip: 'Decrement',
                  heroTag: "btn1",
                  backgroundColor: const Color(0xFFe6e6ff),
                  child: const Icon(Icons.remove, color: Color(0xFF665CF5)),
                ),
                const SizedBox(width: 16),
                FloatingActionButton(
                  onPressed: _incrementCounter,
                  tooltip: 'Increment',
                  heroTag: "btn2",
                  backgroundColor: const Color(0xFFe6e6ff),
                  child: const Icon(Icons.add, color: Color(0xFF665CF5)),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.only(left: 14.0, right: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'Total Count',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    width: 40,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          ' 01',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.white,
                inactiveTrackColor: const Color(0xFFe6e6ff),
                overlayColor: Colors.pink,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 30),
              ),
              child: Slider(
                value: height.toDouble(),
                min: 120.0,
                max: 220.0,
                activeColor: const Color(0xFF665CF5),
                inactiveColor: Colors.grey[300],
                onChanged: (double newValue) {
                  setState(() {
                    height = newValue.round();
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    '1',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '100',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Frequency of Days',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey[400]!),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: selectedFrequency,
                  icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                  borderRadius: BorderRadius.circular(7),
                  dropdownColor: Colors.grey[200],
                  underline: Container(),
                  items: frequencies.map((String frequency) {
                    return DropdownMenuItem(
                      value: frequency,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          frequency,
                          style: const TextStyle(
                            color: Color(0xFF343434),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedFrequency = newValue!;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'How many times a Day',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey[400]!),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: selectedTimesPerDay,
                  icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                  borderRadius: BorderRadius.circular(7),
                  dropdownColor: Colors.grey[200],
                  underline: Container(),
                  items: timesPerDay.map((String time) {
                    return DropdownMenuItem(
                      value: time,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          time,
                          style: const TextStyle(
                            color: Color(0xFF343434),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedTimesPerDay = newValue!;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(color: Colors.black, width: 4.0), // Black bottom border
                  ),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Icon(Icons.access_time, color: Colors.black), // Prefix Icon
                    ),
                    Expanded(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: selectedTimesPerDayy,
                          icon: const Icon(Icons.keyboard_arrow_right, color: Colors.black),
                          borderRadius: BorderRadius.circular(7),
                          dropdownColor: Colors.grey[200],
                          items: timesPerDayy.map((String time) {
                            return DropdownMenuItem(
                              value: time,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  time,
                                  style: const TextStyle(
                                    color: Color(0xFF343434),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedTimesPerDayy = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25),
            GestureDetector(
              onTap: () {
                // Handle tap event here
              },
              child: Container(
                decoration: BoxDecoration(
                  color: selectedSquareIndex == index ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 110,
                      height: 40,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFe6e6ff),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            'Before Food',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 110,
                      height: 40,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFe6e6ff),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            'After Food',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 110,
                      height: 40,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFe6e6ff),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            'Before Sleep',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35.0,left: 20,right: 20,bottom: 38),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: const Color(0xFF665CF5),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      onPressed: (){
                        showSnackBar(context: context, message: "medicine added");
                        },
                      child: Text('Add',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),))),
            )
          ],
        ),
      ),
    );
  }
}

void main() => runApp(const MaterialApp(home: Medicine()));
