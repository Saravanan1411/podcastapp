import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../colors.dart';
import '../../textstyle.dart';

class AudioLanguages extends StatefulWidget {
  const AudioLanguages({super.key});

  @override
  State<AudioLanguages> createState() => _AudioLanguagesState();
}

class _AudioLanguagesState extends State<AudioLanguages> {

  bool _switchValue = true;
  bool _switchValue1 = true;
  bool _switchValue2 = false;
  bool _switchValue3 = false;
  bool _switchValue4 = false;
  bool _switchValue5 = false;
  bool _switchValue6 = false;




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: gradient1,
          leading: InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
              child: Icon(Icons.arrow_back_ios)
          ),
          title: Text("Audio Languages", style: homePageHeading,),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [gradient1,gradient2],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
          ),
          child: Column(
            children: [

              SizedBox(height: 30),
              Align(
                alignment: Alignment.topLeft,
                child: Text("Choose your Audio Language",
                  style: sideHeading,
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                title: Text("English",
                  style: categoryCardText,
                ),
                trailing: CupertinoSwitch(
                  value: _switchValue,
                  onChanged: (value) {
                    setState(() {
                      _switchValue = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                title: Text("Tamil",
                  style: categoryCardText,
                ),
                trailing: CupertinoSwitch(
                  value: _switchValue1,
                  onChanged: (value) {
                    setState(() {
                      _switchValue1 = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                title: Text("Hindi",
                  style: categoryCardText,
                ),
                trailing: CupertinoSwitch(
                  value: _switchValue2,
                  onChanged: (value) {
                    setState(() {
                      _switchValue2 = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                title: Text("Telugu",
                  style: categoryCardText,
                ),
                trailing: CupertinoSwitch(
                  value: _switchValue3,
                  onChanged: (value) {
                    setState(() {
                      _switchValue3 = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                title: Text("Kanada",
                  style: categoryCardText,
                ),
                trailing: CupertinoSwitch(
                  value: _switchValue4,
                  onChanged: (value) {
                    setState(() {
                      _switchValue4 = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                title: Text("Malayalam",
                  style: categoryCardText,
                ),
                trailing: CupertinoSwitch(
                  value: _switchValue5,
                  onChanged: (value) {
                    setState(() {
                      _switchValue5 = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                title: Text("Marathi",
                  style: categoryCardText,
                ),
                trailing: CupertinoSwitch(
                  value: _switchValue6,
                  onChanged: (value) {
                    setState(() {
                      _switchValue6 = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}