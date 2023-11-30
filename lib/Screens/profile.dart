import 'dart:io';
import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../colors.dart';
import '../textstyle.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {


  Uint8List? _image;
  File? selectedIMage;
  //Gallery
  Future _pickImageFromGallery() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop(); //close the model sheet
  }

//Camera
  Future _pickImageFromCamera() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Color(0xff65006E),
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4.5,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromGallery();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.image,
                              size: 70,
                              color: Colors.white,
                            ),
                            Text("Gallery",
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromCamera();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 70,
                              color: Colors.white,
                            ),
                            Text("Camera",
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [gradient1,gradient2],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 50),
                Stack(
                  children: [
                    _image != null
                        ? CircleAvatar(
                        radius: 60,
                        backgroundImage: MemoryImage(_image!))
                        : const CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                          "https://t4.ftcdn.net/jpg/00/65/77/27/360_F_65772719_A1UV5kLi5nCEWI0BNLLiFaBPEkUbv5Fv.jpg"),
                    ),
                    Positioned(
                        bottom: -10,
                        left: 80,
                        child: IconButton(
                            onPressed: () {
                              showImagePickerOption(context);
                            },
                            icon:  Icon(Icons.add_a_photo,
                              color: Colors.grey.shade600,
                              size: 30,
                            )))
                  ],
                ),
                SizedBox(height: 20),
                Text("Saran",
                    style: homePageHeading
                ),
                ListTile(
                  leading: Icon(Icons.settings_outlined,
                    color: Colors.white,
                  ),
                  title: Text("General Settings",
                    style: categoryCardText,
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.language,
                    color: Colors.white,
                  ),
                  title: Text("App Language",
                    style: categoryCardText,
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),

                ),
                ListTile(
                  leading: Icon(Icons.music_video,
                    color: Colors.white,
                  ),
                  title: Text("Audio Language",
                    style: categoryCardText,
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.privacy_tip,
                    color: Colors.white,
                  ),
                  title: Text("Privacy Settings",
                    style: categoryCardText,
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.notifications_active,
                    color: Colors.white,
                  ),
                  title: Text("Notification",
                    style: categoryCardText,
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.audiotrack,
                    color: Colors.white,
                  ),
                  title: Text("Audio Settings",
                    style: categoryCardText,
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.contact_mail_sharp,
                    color: Colors.white,
                  ),
                  title: Text("Contact Us",
                    style: categoryCardText,
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.help_center,
                    color: Colors.white,
                  ),
                  title: Text("Help Center",
                    style: categoryCardText,
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.contact_page,
                    color: Colors.white,
                  ),
                  title: Text("About Us",
                    style: categoryCardText,
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.logout,
                    color: Colors.white,
                  ),
                  title: Text("Logout",
                    style: categoryCardText,
                  ),

                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}