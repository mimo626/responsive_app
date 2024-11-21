import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobilePage2 extends StatefulWidget {
  const MobilePage2({super.key});

  @override
  State<MobilePage2> createState() => _MobilePage2State();
}

class _MobilePage2State extends State<MobilePage2> {
  @override
  Widget build(BuildContext context) {
    // 화면의 가로 길이와 세로 길이 가져오기
    final double screenWidth = MediaQuery.of(context).size.width;

    // childAspectRatio 계산
    final double childAspectRatio = screenWidth > 600 // 가로 길이로 웹/모바일 구분
        ? 0.6 // 웹의 비율
        : 0.49; // 모바일의 비율

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Responsive"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black,
        // 자식 위젯이 Expanded이므로 부모 위젯을 따라 무한히 커지는 것을 막기 위해 최대 크기 지정
        constraints: BoxConstraints(maxWidth: 600,),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 제목과 더보기 버튼
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "최근 본 연관 추천 상품",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      // "더보기" 클릭 시 동작
                    },
                    child: Text("더보기"),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // 상품 리스트 (가로 스크롤)
              SizedBox(
                height: 210.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 8, // 총 아이템 개수
                  itemBuilder: (context, index) {
                    return Container(
                      width: 96.w,
                      margin: EdgeInsets.only(right: 8),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: kIsWeb ? 3 : 3,
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Image.asset(kIsWeb ? "images/sample.png" : "assets/images/sample.png",
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          ),
                          // 상품 정보 -> 폰트 크기 때문에 사진이 더 세로로 축소
                          Expanded(
                            flex: kIsWeb ? 4 : 4 ,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 16),
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}