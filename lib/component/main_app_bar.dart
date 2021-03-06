import 'package:dongpakka_dust/const/colors.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(
      color: Colors.white,
      fontSize: 30.0,
    );
    return SliverAppBar(
      backgroundColor: primaryColor,
      expandedHeight: 500,
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: kToolbarHeight),
            child: Column(
              children: [
                Text(
                  '서울',
                  style: ts.copyWith(
                      fontSize: 40.0, fontWeight: FontWeight.w700),
                ),
                Text(
                  DateTime.now().toString(),
                  style: ts.copyWith(fontSize: 20.0),
                ),
                SizedBox(height: 20.0,),
                Image.asset('asset/img/middle_image.png',height: MediaQuery.of(context).size.height/4,),
                SizedBox(height: 20.0,),
                Text('보통',style: ts.copyWith(fontSize: 40.0,fontWeight: FontWeight.w700),),
                SizedBox(height: 8.0,),
                Text('나쁘지 않네요!',style: ts.copyWith(fontSize: 20.0,fontWeight: FontWeight.w700),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
