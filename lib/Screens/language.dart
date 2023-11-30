import 'package:flutter/material.dart';
import '/Screens/bottomNavigation.dart';
import '../colors.dart';
import '../textstyle.dart';

import '../datamodel/languageDataModel.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  int selectedIndex = -1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [gradient1,gradient2],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Listen Audio in:", style: homePageHeading,),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.81,
                width: MediaQuery.of(context).size.width*1,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                    ),
                    itemCount: lis.length,
                    itemBuilder: (context, index){
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                  color: selectedIndex == index ? Colors.black : Colors.white, width: 1
                              ),
                              color: selectedIndex == index ? Colors.white : Colors.transparent,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(lis[index].text,style: selectedIndex == index ? selectedCategoryCardText :categoryCardText),
                              Text(lis[index].text1, style: selectedIndex == index ? selectedCategoryCardText :categoryCardText),

                            ],
                          ),
                        ),
                      );
                    }
                ),
              ),
              if (selectedIndex != -1)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff2F2D30),
                  ),
                onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>BottomNavigation()), (route) => false);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 100),
                  child: Text("Continue",style: buttonText,),
                ),
                ),

            ],
          ),
        ),
      ),
    );
  }
}