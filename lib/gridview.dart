import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        backgroundColor: Colors.white,
        title: Text("Responsive"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          // 자식 위젯이 Expanded이므로 부모 위젯을 따라 무한히 커지는 것을 막기 위해 최대 크기 지정
          constraints: BoxConstraints(maxWidth: 600,),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 한 행에 2개의 아이템
                crossAxisSpacing: 20, // 아이템 간 가로 간격
                //mainAxisSpacing: 20, // 아이템 간 세로 간격
                childAspectRatio: 0.43, // 아이템의 가로/세로 비율
              ),
              itemCount: 8, // 총 아이템 개수
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          width: double.maxFinite,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: AspectRatio(
                              aspectRatio: 0.73,
                              child: Image.asset(kIsWeb ? "images/sample.png" : "assets/images/sample.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                      ),
                      // 상품 정보 -> 폰트 크기 때문에 사진이 더 세로로 축소
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "우희 공작소",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "NEURADERM 완전 수분 가득 촉촉하게 물광 토너 1+1 100ml",
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 4),
                            Text(
                              "100,000",
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,  // 줄 그기
                                  decorationColor: Colors.grey,  // 줄 색상
                                  decorationThickness: 2,  // 줄 두께olor: Colors.grey,
                                  fontSize: 10,
                                  color: Colors.grey
                              ),
                            ),
                            SizedBox(height: 2),
                            Row(
                              children: [
                                Text(
                                  "25%",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(width: 4),
                                Text(
                                  "75,000원",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 14,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  "4.8 (1,580)",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(
                                  Icons.heart_broken,
                                  color: Colors.red,
                                  size: 14,
                                ),
                                SizedBox(width:12),
                                Icon(
                                  Icons.card_travel,
                                  color: Colors.black26,
                                  size: 14,
                                ),
                              ],
                            ),
                          ],
                        ),
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