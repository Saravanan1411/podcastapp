import 'dart:convert';

import 'package:flutter/material.dart';
import '../ApiModel/LanguageGet.dart';
import '/Screens/bottomNavigation.dart';
import '../colors.dart';
import '../textstyle.dart';
import 'package:http/http.dart'as http;
import '../datamodel/languageDataModel.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  Set<int> selectedIndices = {};
  Future<List<LanguageGet>> LanguageGetApi() async{
    var audioResponse = await http.get(Uri.parse("http://localhost:4000/api/languagemasterget"));
    var audioData =jsonDecode(audioResponse.body);
    return (audioData as List).map((e) => LanguageGet.fromJson(e)).toList();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LanguageGetApi();
  }
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
                child: FutureBuilder(
                  future: LanguageGetApi(),
                  builder: (BuildContext context,snapshot) {
                    return GridView.builder(
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
                                if (selectedIndices.contains(index)) {
                                  selectedIndices.remove(index);
                                } else {
                                  selectedIndices.add(index);
                                }
                              });
                            },
                            child: Container(
                              height: 30,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                  image: DecorationImage(
                                      image: NetworkImage("http://localhost:4000/api${snapshot.data![index].languageImage}"),
                                      fit: BoxFit.fill
                                  ),
                                color: selectedIndices.contains(index) ? Colors.white : Colors.transparent,
                              ),
                              child:
                                  Center(child: Text(snapshot.data![index].languageName.toString(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),))


                            ),
                          );
                        }
                    );
                  },

                ),
              ),
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