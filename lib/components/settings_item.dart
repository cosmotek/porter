
import 'package:flutter/material.dart';

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
