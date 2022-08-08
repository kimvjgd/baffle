import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_painting_tools/flutter_painting_tools.dart';
import 'package:get/get.dart';

class DrawingScreen extends StatefulWidget {
  const DrawingScreen({Key? key}) : super(key: key);

  @override
  State<DrawingScreen> createState() => _DrawingScreenState();
}

class _DrawingScreenState extends State<DrawingScreen> {
  late final PaintingBoardController penController;
  late final PaintingBoardController eraseController;

  // 오늘 하루는 어떠셨나요? 그쪽 그 박스... 이름을 뭐로하지 ㅋㅋㅋ
  double introduction_height = Get.height / 4;

  // 색, 두께, 지우개, 완전사게(휴지통) 그 박스의 높이
  double selectMode_height = Get.height / 15;

  bool changeColor = false;

  @override
  void initState() {
    penController = PaintingBoardController();
    eraseController = PaintingBoardController();
    super.initState();
  }

  @override
  void dispose() {
    penController.dispose();
    eraseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.yellow[300],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Icon(
                        Icons.cancel_outlined,
                        size: 45,
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      '오늘 하루는 어떠셨나요?',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      '나의 감정의 온도를 선택해주세요.',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
              width: Get.width,
              height: introduction_height,
            ),
            Expanded(
              child: Stack(
                children: [
                  Row(
                    children: [
                      Container(
                        color: Colors.red,
                      ),
                      Container(
                        child: IconButton(
                            onPressed: () {},
                            icon: IconButton(
                              onPressed: () {},
                              icon: IconButton(
                                onPressed: () {},
                                icon: Icon(CupertinoIcons.app_badge),
                              ),
                            )),
                      ),
                    ],
                  ),
                  // 여기가 밑에 그림 그리는 캔버스
                  PaintingBoard(
                    boardHeight: Get.height -
                        MediaQuery.of(context).padding.top -
                        introduction_height,
                    boardWidth: Get.width,
                    controller: penController, // use here the controller
                  ),
                  // selectColor(),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: Colors.blue,
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Container(
                          color: Colors.green,
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Container(
                          color: Colors.black,
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Container(
                          color: Colors.pink,
                          width: 30,
                          height: 30,
                        ),
                      ],
                    ),
                    height: selectMode_height,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              //setState()
                              setState(() {
                                changeColor = !changeColor;
                              });
                            },
                            child: Container(
                              color: Colors.blue,
                              width: 30,
                              height: 30,
                              child: Center(child: Text('색')),
                            )), // 색고르기
                        SizedBox(
                          width: 25,
                        ),
                        Container(
                          color: Colors.green,
                          width: 30,
                          height: 30,
                          child: Center(child: Text('두께')),
                        ), // 두께고르기
                        SizedBox(
                          width: 25,
                        ),
                        Container(
                          color: Colors.black,
                          width: 30,
                          height: 30,
                          child: Center(child: Text('획')),
                        ), // 지우개
                        SizedBox(
                          width: 25,
                        ),
                        Container(
                          color: Colors.pink,
                          width: 30,
                          height: 30,
                          child: Center(child: Text('all')),
                        ), // 휴지통
                      ],
                    ),
                    height: selectMode_height,
                  ),
                  changeColor == true
                      ? Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: selectColor(),
                        )
                      : SizedBox()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 색깔 고르는 부분
  Widget selectColor() {
    return PaintingColorBar(
      controller: penController,
      // use here the controller defined before
      paintingColorBarMargin: const EdgeInsets.symmetric(horizontal: 6),
      colorsType: ColorsType.material,
      onTap: (Color color) {
        // do your logic here with the pressed color, for example change the color of the brush
        print('tapped color: $color');
        penController.changeBrushColor(color);
      },
    );
  }
  Widget selectThickness() {
    return Slider(onChanged: (double value) {  }, value: 0,);
  }

}
