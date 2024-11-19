import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MobilePage extends StatefulWidget {
  const MobilePage({super.key});

  @override
  State<MobilePage> createState() => _MobilePageState();
}

class _MobilePageState extends State<MobilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Responsive"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          color: Colors.black,
          // 자식 위젯이 Expanded이므로 부모 위젯을 따라 무한히 커지는 것을 막기 위해 최대 크기 지정
          constraints: BoxConstraints(maxWidth: 600,),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 한 행에 2개의 아이템
                crossAxisSpacing: 20, // 아이템 간 가로 간격
                mainAxisSpacing: 20, // 아이템 간 세로 간격
                childAspectRatio: 0.6, // 아이템의 가로/세로 비율
              ),
              itemCount: 8, // 총 아이템 개수
              itemBuilder: (context, index) {
                return Container(
                  height: 200, // 부모가 무한한 높이를 가져서 높이 지정은 필수
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                            height: 200,
                            child: Image.asset(kIsWeb ? "images/sample.png" : "assets/images/sample.png",
                              fit: BoxFit.fitWidth,
                            )),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
