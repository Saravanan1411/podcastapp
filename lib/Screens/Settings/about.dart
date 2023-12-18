import 'package:flutter/material.dart';


import '../../colors.dart';
import '../../textstyle.dart';
class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
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
              SizedBox(height: 10),
              Text("About",
                style: homePageHeading,
              ),
              SizedBox(height: 40,),
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
              ),
              SizedBox(height: 10),
              Text("Podcast",
                style: categoryCardText,
              ),
              SizedBox(height: 5),
              Text("Version 2.0125",
                style: categoryCardText,
              ),
              Divider(
                height: 60,
                thickness: 0.5,
                color: Colors.grey,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text("Rate us",
                  style: categoryCardText,
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: Text("Share to friends",
                  style: categoryCardText,
                ),
              ),
              Divider(
                height: 60,
                thickness: 0.5,
                color: Colors.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Our Website",
                    style: categoryCardText,
                  ),
                  Text("podcast.in",
                    style: TextStyle(
                        fontSize: 16,color: Colors.white60
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Twitter",
                    style: categoryCardText,
                  ),
                  Text("@podcast",
                    style: TextStyle(
                        fontSize: 16,color: Colors.white60
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Facebook",
                    style: categoryCardText,
                  ),
                  Text("podcast.facebook",
                    style: TextStyle(
                        fontSize: 16,color: Colors.white60
                    ),
                  )
                ],
              ),
              Divider(
                height: 60,
                thickness: 0.5,
                color: Colors.grey,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text("Contact us",
                  style: categoryCardText,
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: Text("Privacy & policy",
                  style: categoryCardText,
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: Text("Terms & Conditions",
                  style: categoryCardText,
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: Text("Report an issue",
                  style: categoryCardText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}