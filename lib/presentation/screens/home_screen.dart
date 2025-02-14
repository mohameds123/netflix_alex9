import 'package:flutter/material.dart';
import 'package:untitled18/presentation/widgets/nowplaying_widget.dart';
import 'package:untitled18/presentation/widgets/top_rated_widget.dart';

import '../widgets/popular_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          SizedBox(
            height: 370,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,

              itemBuilder: (context, index)=> NowplayingWidget()

                ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text("Popular on netflix",style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),),
          ),
          SizedBox(
            height: 16,
          ),

          SizedBox(
            height: 161,
            child: ListView.builder(
              itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder:(context, index) => PopularWidget(),
               ),
          ),
          SizedBox(
            height: 16,
          ),

          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text("Top Rated",style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),),
          ),
          SizedBox(
            height: 16,
          ),

          SizedBox(
            height: 161,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder:(context, index) => TopRatedWidget(),
            ),
          ),

        ],
      )
    );
  }
}
