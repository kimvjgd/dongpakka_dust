import 'package:flutter/material.dart';

class MainStat extends StatelessWidget {
  // 미세먼지 / 초미세먼지 등
  final String category;

  // 아이콘 위치 (경로)
  final String imgPath;

  // 오염 정도
  final String level;
  final String stat;
  final double width;

  const MainStat({
    required this.category,
    required this.imgPath,
    required this.level,
    required this.stat,
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(color: Colors.black);

    return SizedBox(
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            category,
            style: ts,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Image.asset(
            imgPath,
            width: 50.0,
            height: 50.0,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            level,
            style: ts,
          ),
          Text(
            stat,
            style: ts,
          ),
        ],
      ),
    );
  }
}
