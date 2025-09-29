import 'dart:io';

import 'package:contact/models/user_date.dart';
import 'package:contact/pages/add_new_contact.dart';
import 'package:contact/pages/details_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<UserDate> userData = [];

  void _openAddContactSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        // Return an instance of our separate sheet widget
        return ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),

          child: Container(
            decoration: BoxDecoration(color: Colors.white),

            height: MediaQuery.of(context).size.height * 0.9,
            child: AddContactSheet(),
          ),
        );
      },
    ).then((result) {
      if (result != null && result is UserDate) {
        setState(() {
          userData.add(result);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          'Contacts',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () => _openAddContactSheet(context),
            icon: Icon(CupertinoIcons.add, size: 30, color: Color(0xFF3578F7)),
          ),
        ],
      ),
      body: userData.isEmpty
          ? Center(
              child: Text(
                'No contacts yet. Tap + to add a new contact.',
                style: TextStyle(color: Colors.grey[600], fontSize: 16),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final contact = userData[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        ListTile(
                          leading: contact.imagePath != null
                              ? ClipOval(
                                  child: Image.file(
                                    File(contact.imagePath!),
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : ClipOval(
                                  child: Image.asset(
                                    'assets/images/profile_placeholder.png',
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),

                          title: Text(
                            '${contact.firstName} ${contact.lastName}',
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (contact.phone.isNotEmpty) Text(contact.phone),
                            ],
                          ),
                          trailing: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return DetailsPage(contact: contact);
                                  },
                                ),
                              );
                            },
                            child: Icon(
                              CupertinoIcons.info_circle,
                              size: 25,
                              color: Color(0xFF3578F7),
                            ),
                          ),
                        ),
                        Divider(),
                      ],
                    ),
                  );
                },
                itemCount: userData.length,
              ),
            ),
    );
  }
}
