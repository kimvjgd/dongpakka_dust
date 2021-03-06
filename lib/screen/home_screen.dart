import 'package:dio/dio.dart';
import 'package:dongpakka_dust/component/category_card.dart';
import 'package:dongpakka_dust/component/hourly_card.dart';
import 'package:dongpakka_dust/component/main_app_bar.dart';
import 'package:dongpakka_dust/component/main_drawer.dart';
import 'package:dongpakka_dust/const/colors.dart';
import 'package:dongpakka_dust/const/data.dart';
import 'package:dongpakka_dust/model/stat_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() async {
    final response = await Dio().get(
      'http://apis.data.go.kr/B552584/ArpltnStatsSvc/getCtprvnMesureLIst',
      queryParameters: {
        'serviceKey': serviceKey,
        'returnType': 'json',
        'numOfRows': 30,
        'pageNo': 1,
        'itemCode': 'PM10',
        'dataGubun': 'HOUR',
        'searchCondition': 'WEEK',
      }
    );
    print(response.data['response']['body']['items'].map(
        (item)=> StatModel.fromJson(json: item),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        drawer: MainDrawer(),
        body: CustomScrollView(
          slivers: [
            MainAppBar(),
            SliverToBoxAdapter(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CategoryCard(),
                SizedBox(
                  height: 16.0,
                ),
                HourlyCard(),
              ],
            )),
          ],
        ));
  }
}
