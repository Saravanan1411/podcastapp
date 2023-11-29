


import 'package:flutter/material.dart';

import '../datamodel/languageDataModel.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF231d1f),Color(0xFF5f0176)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )
        ),
        child: Column(
          children: [
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Listen Audio in:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              height: 700,
              width: 400,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.1,
                    crossAxisCount: 2,
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 10.0,
                  ),
                  itemCount: lis.length,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 50,
                        width: 60,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white,width: 3),
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.transparent
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                              child: Text(lis[index].text,
                                style: TextStyle(
                                    fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white
                                ),
                              ),
                            ),
                            Center(
                              child: Text(lis[index].text1,
                                style: TextStyle(
                                    fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}