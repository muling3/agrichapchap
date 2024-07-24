// import 'dart:async';

// import 'package:agrichapchap/constants/Appcolors.dart';
// import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:circular_reveal_animation/circular_reveal_animation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

// class BottomNavPage extends StatefulWidget {
//   BottomNavPage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _BottomNavPageState createState() => _BottomNavPageState();
// }

// class _BottomNavPageState extends State<BottomNavPage>
//     with TickerProviderStateMixin {
//   final autoSizeGroup = AutoSizeGroup();
//   var _bottomNavIndex = 0; //default index of a first screen

//   late AnimationController _fabAnimationController;
//   late AnimationController _borderRadiusAnimationController;
//   late Animation<double> fabAnimation;
//   late Animation<double> borderRadiusAnimation;
//   late CurvedAnimation fabCurve;
//   late CurvedAnimation borderRadiusCurve;
//   late AnimationController _hideBottomBarAnimationController;

//   final List<Map<String, dynamic>> iconList = [
//     {'icon': Icons.feed_rounded, 'name': 'Feed'},
//     {'icon': Icons.local_offer_rounded, 'name': 'Products'},
//     {'icon': Icons.agriculture_rounded, 'name': 'Inputs'},
//     {'icon': Icons.work_history_rounded, 'name': 'Projects'},
//     // {'icon': Icons.receipt, 'name': 'Purchases'},
//   ];

//   // Widget _currentBody = NavigationScreen(iconList[0]['icon']);

//   @override
//   void initState() {
//     super.initState();

//     _fabAnimationController = AnimationController(
//       duration: Duration(milliseconds: 500),
//       vsync: this,
//     );
//     _borderRadiusAnimationController = AnimationController(
//       duration: Duration(milliseconds: 500),
//       vsync: this,
//     );
//     fabCurve = CurvedAnimation(
//       parent: _fabAnimationController,
//       curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
//     );
//     borderRadiusCurve = CurvedAnimation(
//       parent: _borderRadiusAnimationController,
//       curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
//     );

//     fabAnimation = Tween<double>(begin: 0, end: 1).animate(fabCurve);
//     borderRadiusAnimation = Tween<double>(begin: 0, end: 1).animate(
//       borderRadiusCurve,
//     );

//     _hideBottomBarAnimationController = AnimationController(
//       duration: Duration(milliseconds: 200),
//       vsync: this,
//     );

//     Future.delayed(
//       Duration(seconds: 1),
//       () => _fabAnimationController.forward(),
//     );
//     Future.delayed(
//       Duration(seconds: 1),
//       () => _borderRadiusAnimationController.forward(),
//     );
//   }

//   bool onScrollNotification(ScrollNotification notification) {
//     if (notification is UserScrollNotification &&
//         notification.metrics.axis == Axis.vertical) {
//       switch (notification.direction) {
//         case ScrollDirection.forward:
//           _hideBottomBarAnimationController.reverse();
//           _fabAnimationController.forward(from: 0);
//           break;
//         case ScrollDirection.reverse:
//           _hideBottomBarAnimationController.forward();
//           _fabAnimationController.reverse(from: 1);
//           break;
//         case ScrollDirection.idle:
//           break;
//       }
//     }
//     return false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBody: true,
//       appBar: AppBar(
//         title: Text(
//           widget.title,
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: NotificationListener<ScrollNotification>(
//         onNotification: onScrollNotification,
//         child: NavigationScreen(iconList[_bottomNavIndex]['icon']),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: AppColors.darkGreen,
//         shape: const CircleBorder(
//           eccentricity: 0,
//         ),
//         child: const Icon(
//           Icons.feed_rounded,
//           color: AppColors.white,
//         ),
//         onPressed: () {
//           _bottomNavIndex = 2;
//           _fabAnimationController.reset();
//           _borderRadiusAnimationController.reset();
//           _borderRadiusAnimationController.forward();
//           _fabAnimationController.forward();
//         },
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: AnimatedBottomNavigationBar.builder(
//         itemCount: iconList.length,
//         tabBuilder: (int index, bool isActive) {
//           final color =
//               isActive ? AppColors.primaryGreen : AppColors.lightGreen;
//           return Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(
//                 iconList[index]["icon"],
//                 size: 24,
//                 color: color,
//               ),
//               const SizedBox(height: 4),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8),
//                 child: AutoSizeText(
//                   iconList[index]["name"],
//                   maxLines: 1,
//                   style: TextStyle(color: color),
//                   group: autoSizeGroup,
//                 ),
//               )
//             ],
//           );
//         },
//         backgroundColor: AppColors.white,
//         activeIndex: _bottomNavIndex,
//         splashColor: AppColors.emeraldGreen,
//         notchAndCornersAnimation: borderRadiusAnimation,
//         splashSpeedInMilliseconds: 300,
//         notchSmoothness: NotchSmoothness.defaultEdge,
//         gapLocation: GapLocation.center,
//         leftCornerRadius: 32,
//         rightCornerRadius: 32,
//         onTap: (index) => setState(() => _bottomNavIndex = index),
//         hideAnimationController: _hideBottomBarAnimationController,
//         shadow: const BoxShadow(
//           offset: Offset(0, 1),
//           blurRadius: 4,
//           spreadRadius: 0.9,
//           color: AppColors.mintGreen,
//         ),
//       ),
//     );
//   }
// }

// class NavigationScreen extends StatefulWidget {
//   final IconData iconData;

//   NavigationScreen(this.iconData) : super();

//   @override
//   _NavigationScreenState createState() => _NavigationScreenState();
// }

// class _NavigationScreenState extends State<NavigationScreen>
//     with TickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> animation;

//   @override
//   void didUpdateWidget(NavigationScreen oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (oldWidget.iconData != widget.iconData) {
//       _startAnimation();
//     }
//   }

//   @override
//   void initState() {
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1000),
//     );
//     animation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeIn,
//     );
//     _controller.forward();
//     super.initState();
//   }

//   _startAnimation() {
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1000),
//     );
//     animation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeIn,
//     );
//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       child: ListView(
//         children: [
//           const SizedBox(height: 64),
//           Center(
//             child: CircularRevealAnimation(
//               animation: animation,
//               centerOffset: const Offset(80, 80),
//               maxRadius: MediaQuery.of(context).size.longestSide * 1.1,
//               child: Icon(
//                 widget.iconData,
//                 color: AppColors.mintGreen,
//                 size: 160,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'dart:async';
import 'package:agrichapchap/constants/Appcolors.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// New Body Content Widget
class NewBodyContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('This is the new content!'),
    );
  }
}

class BottomNavPage extends StatefulWidget {
  BottomNavPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage>
    with TickerProviderStateMixin {
  final autoSizeGroup = AutoSizeGroup();
  var _bottomNavIndex = 0; // Default index of the first screen
  Widget _currentBody = NavigationScreen(iconList[0]['icon']); // Default body

  late AnimationController _fabAnimationController;
  late AnimationController _borderRadiusAnimationController;
  late Animation<double> fabAnimation;
  late Animation<double> borderRadiusAnimation;
  late CurvedAnimation fabCurve;
  late CurvedAnimation borderRadiusCurve;
  late AnimationController _hideBottomBarAnimationController;

  static final List<Map<String, dynamic>> iconList = [
    {'icon': Icons.feed_rounded, 'name': 'Feed'},
    {'icon': Icons.local_offer_rounded, 'name': 'Products'},
    {'icon': Icons.agriculture_rounded, 'name': 'Inputs'},
    {'icon': Icons.work_history_rounded, 'name': 'Projects'},
  ];

  @override
  void initState() {
    super.initState();

    _fabAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _borderRadiusAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    fabCurve = CurvedAnimation(
      parent: _fabAnimationController,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
    borderRadiusCurve = CurvedAnimation(
      parent: _borderRadiusAnimationController,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );

    fabAnimation = Tween<double>(begin: 0, end: 1).animate(fabCurve);
    borderRadiusAnimation = Tween<double>(begin: 0, end: 1).animate(
      borderRadiusCurve,
    );

    _hideBottomBarAnimationController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    Future.delayed(
      Duration(seconds: 1),
      () => _fabAnimationController.forward(),
    );
    Future.delayed(
      Duration(seconds: 1),
      () => _borderRadiusAnimationController.forward(),
    );
  }

  bool onScrollNotification(ScrollNotification notification) {
    if (notification is UserScrollNotification &&
        notification.metrics.axis == Axis.vertical) {
      switch (notification.direction) {
        case ScrollDirection.forward:
          _hideBottomBarAnimationController.reverse();
          _fabAnimationController.forward(from: 0);
          break;
        case ScrollDirection.reverse:
          _hideBottomBarAnimationController.forward();
          _fabAnimationController.reverse(from: 1);
          break;
        case ScrollDirection.idle:
          break;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: onScrollNotification,
        child: _currentBody, // Use the current body content
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.darkGreen,
        shape: const CircleBorder(
          eccentricity: 0,
        ),
        child: const Icon(
          Icons.feed_rounded,
          color: AppColors.white,
        ),
        onPressed: () {
          setState(() {
            _currentBody = NewBodyContent(); // Update the body content
          });
          _fabAnimationController.reset();
          _borderRadiusAnimationController.reset();
          _borderRadiusAnimationController.forward();
          _fabAnimationController.forward();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          final color =
              isActive ? AppColors.primaryGreen : AppColors.lightGreen;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconList[index]["icon"],
                size: 24,
                color: color,
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: AutoSizeText(
                  iconList[index]["name"],
                  maxLines: 1,
                  style: TextStyle(color: color),
                  group: autoSizeGroup,
                ),
              )
            ],
          );
        },
        backgroundColor: AppColors.white,
        activeIndex: _bottomNavIndex,
        splashColor: AppColors.emeraldGreen,
        notchAndCornersAnimation: borderRadiusAnimation,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.defaultEdge,
        gapLocation: GapLocation.center,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) => setState(() {
          _bottomNavIndex = index;
          _currentBody = NavigationScreen(iconList[index]['icon']);
        }),
        hideAnimationController: _hideBottomBarAnimationController,
        shadow: const BoxShadow(
          offset: Offset(0, 1),
          blurRadius: 4,
          spreadRadius: 0.9,
          color: AppColors.mintGreen,
        ),
      ),
    );
  }
}

class NavigationScreen extends StatefulWidget {
  final IconData iconData;

  NavigationScreen(this.iconData) : super();

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;

  @override
  void didUpdateWidget(NavigationScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.iconData != widget.iconData) {
      _startAnimation();
    }
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
    super.initState();
  }

  _startAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          const SizedBox(height: 64),
          Center(
            child: CircularRevealAnimation(
              animation: animation,
              centerOffset: const Offset(80, 80),
              maxRadius: MediaQuery.of(context).size.longestSide * 1.1,
              child: Icon(
                widget.iconData,
                color: AppColors.mintGreen,
                size: 160,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
