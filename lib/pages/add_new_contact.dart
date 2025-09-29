import 'dart:io';

import 'package:contact/models/user_date.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddContactSheet extends StatefulWidget {
  const AddContactSheet({super.key});

  @override
  State<AddContactSheet> createState() => _AddContactSheetState();
}

class _AddContactSheetState extends State<AddContactSheet> {
  XFile? _pickedImageFile;

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: source,
      // Optional: Set maximum width
    );

    if (pickedFile != null) {
      setState(() {
        _pickedImageFile = pickedFile;
      });
    }
  }

  void _saveData() {
    if (_formKey.currentState!.validate()) {
      final userDate = UserDate(
        firstName: _firstName.text,
        lastName: _lastName.text,

        phone: _phone.text,
        imagePath: _pickedImageFile?.path,
      );
      Navigator.pop(context, userDate);
    }
  }

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstName = TextEditingController();

  final TextEditingController _lastName = TextEditingController();

  final TextEditingController _phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 100,
        actionsPadding: const EdgeInsets.only(right: 16),

        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          'New Contact',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Center(
            child: Text(
              'Cancel',
              style: TextStyle(fontSize: 20, color: Color(0xFF3578F7)),
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: _saveData,
            child: Center(
              child: Text(
                'Done',
                style: TextStyle(fontSize: 20, color: Color(0xFF3578F7)),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipOval(
              child: _pickedImageFile == null
                  ? Image.asset(
                      'assets/images/profile_placeholder.png',
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    )
                  : Image.file(
                      File(_pickedImageFile!.path),
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          GestureDetector(
            onTap: () => _pickImage(ImageSource.gallery),
            child: Container(
              height: 40,
              width: 140,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  'Add Photo',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),

          Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20),

                //First Name
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter first name';
                      }
                      return null;
                    },
                    controller: _firstName,
                    cursorColor: Color(0xFF3578F7),
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),

                      labelText: 'First name',
                      hintText: 'First name',
                    ),
                  ),
                ),

                //Last Name
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _lastName,
                    cursorColor: Color(0xFF3578F7),
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),

                      labelText: 'Last name',
                      hintText: 'Last name',
                    ),
                  ),
                ),

                // Add Phone Number
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 10) {
                        return 'Please enter phone number';
                      }
                      return null;
                    },
                    controller: _phone,
                    cursorColor: Color(0xFF3578F7),
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),

                      labelText: 'Add Phone',
                      hintText: 'Add Phone',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
