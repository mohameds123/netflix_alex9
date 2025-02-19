import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled18/logic/now_playing/cubit.dart';
import 'package:untitled18/logic/top_rated/cubit.dart';
import 'package:untitled18/presentation/widgets/nowplaying_widget.dart';
import 'package:untitled18/presentation/widgets/top_rated_widget.dart';

import '../../logic/popular/cubit.dart';
import '../widgets/popular_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> NowPlayingCubit(Dio())..getNowPlayingData()),
        BlocProvider(create: (context)=> PopularCubit(Dio())..getPopularDate()),
        BlocProvider(create: (context)=> TopRatedCubit(Dio())..getTopRatedData()),

      ],
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                
            children: [
              NowplayingWidget(),
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
              PopularWidget(),
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
              TopRatedWidget(),
                
                
            ],
          ),
        )
      ),
    );
  }
}
