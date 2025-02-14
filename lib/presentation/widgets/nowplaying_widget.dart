import 'package:flutter/material.dart';

class NowplayingWidget extends StatelessWidget {
  const NowplayingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// LAYER 1
        Image.asset(
          "assets/images/test_nowplaying.png",
          width: double.infinity,
          fit: BoxFit.cover,
        ),

        /// Layer 2
        Positioned(
          top: 350,
          left: 120,
          child: Row(
            children: [
              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(100)
                ),

              ),
              SizedBox(width: 16,),
              Text("Now Playing",style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w100,
                color: Colors.white
              ),)
            ],
          ),
        ),
      ],

    );
  }
}
