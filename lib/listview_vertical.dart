import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobilePage3 extends StatefulWidget {
  const MobilePage3({super.key});

  @override
  State<MobilePage3> createState() => _MobilePage3State();
}

class _MobilePage3State extends State<MobilePage3> {
  @override
  Widget build(BuildContext context) {
    // 화면의 가로 길이와 세로 길이 가져오기
    double screenWidth = MediaQuery.of(context).size.width;
    if(screenWidth >=600){
      screenWidth = 600;
    }

    double itemWidth = screenWidth-40; // 화면의 60% 크기

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
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 8,
              itemBuilder:(context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 16),
                  height: itemWidth*0.25,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Image.asset(kIsWeb ? "images/sample.png" : "assets/images/sample.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16,),
                      // 상품 정보 -> 폰트 크기 때문에 사진이 더 세로로 축소
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
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
                                SizedBox(width: 4),
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
                          ],
                        ),
                      ),
                      SizedBox(width: 16,),
                      Column(
                        children: [
                          SizedBox(height: 8,),
                          Icon(
                            Icons.heart_broken,
                            color: Colors.red,
                            size: 20,
                          ),
                          Spacer(),
                          Icon(
                            Icons.card_travel,
                            color: Colors.black26,
                            size: 20,
                          ),
                          SizedBox(height: 8,),
                        ],
                      )
                    ],
                  ),
                );
              },
            )
          ),
        ),
      ),
    );
  }
}