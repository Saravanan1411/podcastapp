import 'package:flutter/material.dart';


//styles
import '../colors.dart';
import '../textstyle.dart';

//data models
import '../datamodel/podcastdetails.dart';


class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  //importing the list
  List<PodcastDetailsDataModel> allPodcasts = podcastDataModelList;

  //adding filtered data in the list
  List<PodcastDetailsDataModel> filteredPodcasts = [];


  //function for filtering data for the search
  void filterPodcasts(String query) {
    filteredPodcasts = allPodcasts
        .where((podcast) =>
    podcast.title!.toLowerCase().contains(query.toLowerCase()) ||
        podcast.author!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        //background image
        body: Container(
          height: MediaQuery.of(context).size.height*1,
          width: MediaQuery.of(context).size.width*1,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [gradient1,gradient2],
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
              )
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),

                    //search text field
                    child: TextFormField(
                      onChanged: (value) {
                        filterPodcasts(value);
                      },

                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search_rounded,color: Color(0xff000000),),
                          hintText: "Search....",
                          hintStyle: placeholderText,
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          )
                      ),
                    ),
                  ),

                //search list
                filteredPodcasts.isNotEmpty
                    ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: filteredPodcasts.length,
                  itemBuilder: (context, index) {
                    PodcastDetailsDataModel podcast = filteredPodcasts[index];
                    return ListTile(
                      title: Text(podcast.title!),
                      subtitle: Text(podcast.author!),
                      // You can customize the appearance of each item
                    );
                  },
                )
                    : Center(
                  child: Text("No results found."),
                ),
              ],
            ),
          ),
        )
      )
    );
  }
}

