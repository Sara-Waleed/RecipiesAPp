import 'package:flutter/material.dart';
import 'HomePage.dart';


// class Splash extends StatelessWidget {
//   const Splash({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Center(child: Image.asset("assets/splash3.png",fit: BoxFit.cover,height: double.infinity,width: double.infinity,)),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Align(
//                 alignment: AlignmentDirectional.bottomCenter,
//                 child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.green.shade600,
//                     ),
//                     onPressed: (){
//                       Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeListScreen(),));
//                     },
//                     child: Text("Welcom",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)),
//               ),
//               SizedBox(height: 50,),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final List<String> imagePaths = [
    'assets/pablo-merchan-montes-hyIE90CN6b0-unsplash.jpg',
    'assets/bon-vivant-qom5MPOER-I-unsplash.jpg',
    'assets/lindsay-cotter-9J7sHieVFi0-unsplash.jpg',
    'assets/mekht-GuvimT4IFok-unsplash.jpg',

  ];

  late PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentPage);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> dots = [];

    for (int i = 0; i < imagePaths.length; i++) {
      dots.add(
        Container(
          width: 10,
          height: 10,
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (currentPage == i) ? Colors.black : Colors.grey,
          ),
        ),
      );
    }

    return Scaffold(
      body: GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (details.primaryDelta! > 0) {
            _pageController.previousPage(
              duration: Duration(milliseconds: 100),
              curve: Curves.easeOut,
            );
          } else if (details.primaryDelta! < 0) {
            _pageController.nextPage(
              duration: Duration(milliseconds: 100),
              curve: Curves.easeOut,
            );
          }
        },
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: imagePaths.length,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    imagePaths[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                );
              },
            ),
            Positioned(
              top: 550.0,
              left: 20.0,
              right: 20.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    getImageText(currentPage),
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow,
                      ),
                      onPressed: () {
                        if (currentPage == imagePaths.length - 1) {
                          // Navigate to a specific page when the last button is pressed
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>RecipeListScreen(),
                            ),
                          );
                        } else {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                          );
                        }
                      },
                      child: Text(
                        getButtonText(currentPage),
                        style:
                        TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: dots,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getImageText(int index) {
    switch (index) {
      case 0:
        return 'Browse';
      case 1:
        return 'order';
      case 2:
        return 'Enjoy';
      case 3:
        return 'Find Best Recipes ';
      default:
        return '';
    }
  }

  String getButtonText(int index) {
    switch (index) {
      case 0:
        return 'Next ';
      case 1:
        return 'Next ';
      case 2:
        return 'Next ';
      case 3:
        return 'Order Now';
      default:
        return '';
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}




