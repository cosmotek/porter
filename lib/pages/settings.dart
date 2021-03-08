import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:porter/components/custom_switch.dart';

Widget SettingsItem({ String title, String description, List<Widget> elements }) {
  return Builder(
    builder: (context) => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 5),
              // Flexible(
              //   child: Text(
              //     description,
              //     style: TextStyle(
              //       fontSize: 16,
              //       fontWeight: FontWeight.w500,
              //     ),
              //   ),
              // ),
              // Container(
              //   width: MediaQuery.of(context).size.width * .45,
              //   child: Flexible(
              //     child: Text(
              //       description,
              //       style: TextStyle(
              //         fontSize: 16,
              //         fontWeight: FontWeight.w500,
              //       ),
              //     ),
              //   ),
              // ),
              Text(
                description,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(width: MediaQuery.of(context).size.width/20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: elements.asMap().entries.map((entry) => Container(
              child: entry.value,
              margin: EdgeInsets.only(right: elements.length > entry.key ? 30 : 0),
            )).toList(),
          ),
        ],
      ),
    ),
  );
}

Widget SettingsPage() {
  int dimInterval = 10;
  int syncInterval = 5;
  double brightnessValue = 0.75;
  bool darkModeEnabled = false;

  return StatefulBuilder(
    builder: (context, setState) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(
              top: 20,
              left: 10,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[200],
                    ),
                    padding: EdgeInsets.all(5),
                    // margin: EdgeInsets.all(10),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 45,
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width/20),
                Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SettingsItem(
                title: "Host Sync Interval (Seconds)",
                description: "The interval in which to sync with the host server.",
                elements: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.lightBlue[50],
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: NumberPicker(
                      value: syncInterval,
                      minValue: 1,
                      maxValue: 60,
                      step: 1,
                      haptics: true,
                      axis: Axis.horizontal,
                      itemWidth: 60,
                      onChanged: (value) => setState(() => syncInterval = value),
                    ),
                  ),
                  // GestureDetector(
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       color: Colors.blue[200],
                  //     ),
                  //     padding: EdgeInsets.all(5),
                  //     // margin: EdgeInsets.all(10),
                  //     child: Icon(
                  //       Icons.refresh,
                  //       color: Colors.black,
                  //       size: 45,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              SettingsItem(
                title: "Dim After Interactivity Interval (Minutes)",
                description: "The interval in which to dim the display after inactivity.",
                elements: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.lightBlue[50],
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: NumberPicker(
                      value: dimInterval,
                      minValue: 2,
                      maxValue: 120,
                      step: 2,
                      haptics: true,
                      axis: Axis.horizontal,
                      itemWidth: 60,
                      onChanged: (value) => setState(() => dimInterval = value),
                    ),
                  ),
                ]
              ),
              SettingsItem(
                title: "Dark Mode",
                description: "Enable dark (or light) UI",
                elements: [
                  Icon(Icons.wb_sunny, color: Colors.yellow),
                  CustomSwitch(
                    value: darkModeEnabled,
                    activeColor: Colors.purple,
                    inactiveColor: Colors.yellow,
                    activeTextColor: Colors.transparent,
                    inactiveTextColor: Colors.transparent,
                    activeText: 'On',
                    inactiveText: 'On',
                  ),
                  Icon(Icons.nightlight_round, color: Colors.purple),
                ]
              ),
              SettingsItem(
                title: "Screen Brightness",
                description: "Set the display brightness",
                elements: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.lightBlue[50],
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Slider(
                      min: 0.1,
                      max: 1.0,
                      value: brightnessValue,
                      activeColor: Colors.lightBlue[200],
                      onChanged: (value) => setState(() => brightnessValue = value),
                    ),
                  ),
                  Text(
                    "${(brightnessValue * 100).toInt()}%",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ]
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(
            right: 100,
            bottom: 40,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.lightBlue[200],
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: Text(
                  "Sync with Host",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 40),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: Text(
                  "Restore Defaults",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}