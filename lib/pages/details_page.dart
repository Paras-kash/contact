import 'dart:io';

import 'package:contact/models/user_date.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatelessWidget {
  final UserDate contact;
  const DetailsPage({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                color: Colors.grey,
                child: contact.imagePath != null
                    ? Image.file(File(contact.imagePath!), fit: BoxFit.cover)
                    : Center(
                        child: CircleAvatar(
                          radius: 90,
                          backgroundColor: Colors.grey[400],
                          child: Text(
                            '${contact.firstName[0]}${contact.lastName[0]}',
                            style: TextStyle(
                              fontSize: 100,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
              ),
              Positioned(
                top: 40,
                left: 10,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 20,
                child: Center(
                  child: Text(
                    '${contact.firstName} ${contact.lastName}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 40),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // message icon
                  Padding(
                    padding: const EdgeInsets.only(left: 9.0, bottom: 8),
                    child: Container(
                      height: 60,
                      width: 60, // Add width to make it visible
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                      ),
                      child: Icon(
                        CupertinoIcons.chat_bubble,
                        size: 30,
                        color: Color(0xFF3578F7),
                      ),
                    ),
                  ),
                  // phone icon
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                    child: Container(
                      height: 60,
                      width: 60, // Add width to make it visible
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                      ),
                      child: Icon(
                        CupertinoIcons.phone,
                        size: 30,
                        color: Color(0xFF3578F7),
                      ),
                    ),
                  ),
                  // video call icon
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                    child: Container(
                      height: 60,
                      width: 60, // Add width to make it visible
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                      ),
                      child: Icon(
                        CupertinoIcons.video_camera,
                        size: 35,
                        color: Color(0xFF3578F7),
                      ),
                    ),
                  ),
                  //mail icon
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                    child: Container(
                      height: 60,
                      width: 60, // Add width to make it visible
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                      ),
                      child: Icon(
                        CupertinoIcons.mail,
                        size: 30,
                        color: Color(0xFF3578F7),
                      ),
                    ),
                  ),
                  // pay
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      bottom: 8,
                      right: 9,
                    ),
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                      ),
                      child: Icon(
                        CupertinoIcons.money_dollar,
                        size: 30,
                        color: Color(0xFF3578F7),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: 70,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade300),
                    ),
                    color: Colors.grey[200],
                  ),
                  child: Text(
                    ' +91 ${contact.phone} ',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF3578F7),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
