// import 'package:agrichapchap/constants/Appcolors.dart';
// import 'package:agrichapchap/pages/farmer_projects.dart';
// import 'package:agrichapchap/pages/products_list.dart';
// import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
//   final List<Map<String, String>> products = [
//     {
//       'image':
//           'https://plus.unsplash.com/premium_photo-1674666545272-fa8f4acfc99b?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//       'name': 'Fresh Tomatoes',
//       'price': 'KSh 150.00',
//     },
//     {
//       'image':
//           'https://images.unsplash.com/photo-1599297914860-1ccd36987a52?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//       'name': 'Organic Potatoes',
//       'price': 'KSh 200.00',
//     },
//     {
//       'image':
//           'https://images.unsplash.com/photo-1523949538449-87dd068b65e6?q=80&w=1972&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
//       'name': 'Green Lettuce',
//       'price': 'KSh 120.00',
//     },
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _fabAnimationController = AnimationController(
//       duration: const Duration(milliseconds: 500),
//       vsync: this,
//     );
//     _borderRadiusAnimationController = AnimationController(
//       duration: const Duration(milliseconds: 500),
//       vsync: this,
//     );
//     fabCurve = CurvedAnimation(
//       parent: _fabAnimationController,
//       curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
//     );
//     borderRadiusCurve = CurvedAnimation(
//       parent: _borderRadiusAnimationController,
//       curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
//     );

//     fabAnimation = Tween<double>(begin: 0, end: 1).animate(fabCurve);
//     borderRadiusAnimation = Tween<double>(begin: 0, end: 1).animate(
//       borderRadiusCurve,
//     );

//     _hideBottomBarAnimationController = AnimationController(
//       duration: const Duration(milliseconds: 200),
//       vsync: this,
//     );

//     Future.delayed(
//       const Duration(seconds: 1),
//       () => _fabAnimationController.forward(),
//     );
//     Future.delayed(
//       const Duration(seconds: 1),
//       () => _borderRadiusAnimationController.forward(),
//     );
//   }

//   final autoSizeGroup = AutoSizeGroup();
//   var _bottomNavIndex = 0;

//   late AnimationController _fabAnimationController;
//   late AnimationController _borderRadiusAnimationController;
//   late Animation<double> fabAnimation;
//   late Animation<double> borderRadiusAnimation;
//   late CurvedAnimation fabCurve;
//   late CurvedAnimation borderRadiusCurve;
//   late AnimationController _hideBottomBarAnimationController;

//   final List<Map<String, dynamic>> iconList = [
//     {
//       'icon': Icons.local_offer_rounded,
//       'name': 'Products',
//       'page': const ProductsGrid()
//     },
//     {
//       'icon': Icons.work_history_rounded,
//       'name': 'Projects',
//       'page': const FarmerProjects()
//     },
//   ];

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
//       appBar: AppBar(
//         title: const Text('Agrichapchap'),
//         // bottom: PreferredSize(
//         //   preferredSize: const Size.fromHeight(48.0),
//         //   child: Padding(
//         //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         //     child: TextField(
//         //       onChanged: _filterProducts,
//         //       decoration: InputDecoration(
//         //         hintText: 'Search',
//         //         border: InputBorder.none,
//         //         enabledBorder: UnderlineInputBorder(
//         //           borderSide: BorderSide(
//         //             color: Colors.grey.shade400,
//         //           ),
//         //         ),
//         //         prefixIcon: const Icon(Icons.search),
//         //       ),
//         //     ),
//         //   ),
//         // ),
//       ),
//       body: NotificationListener<ScrollNotification>(
//         onNotification: onScrollNotification,
//         child: iconList[_bottomNavIndex]['page'] as Widget,
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

// GridView.builder(
//         padding: const EdgeInsets.all(16.0),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 16.0,
//           mainAxisSpacing: 16.0,
//           childAspectRatio: 0.75,
//         ),
//         itemCount: _filteredProducts.length,
//         itemBuilder: (context, index) {
//           final product = _filteredProducts[index];
//           return ProductGridItem(
//             image: product['image']!,
//             name: product['name']!,
//             price: product['price']!,
//           );
//         },
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
//           _fabAnimationController.reset();
//           _borderRadiusAnimationController.reset();
//           _borderRadiusAnimationController.forward();
//           _fabAnimationController.forward();
//         },
//       ),

import 'package:agrichapchap/constants/Appcolors.dart';
import 'package:agrichapchap/pages/farmer_news_feed.dart';
import 'package:agrichapchap/pages/farmer_projects.dart';
import 'package:agrichapchap/pages/products_list.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final List<Map<String, String>> products = [
    {
      'image':
          'https://plus.unsplash.com/premium_photo-1674666545272-fa8f4acfc99b?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'name': 'Fresh Tomatoes',
      'price': 'KSh 150.00',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1599297914860-1ccd36987a52?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'name': 'Organic Potatoes',
      'price': 'KSh 200.00',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1523949538449-87dd068b65e6?q=80&w=1972&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'name': 'Green Lettuce',
      'price': 'KSh 120.00',
    },
  ];

  @override
  void initState() {
    super.initState();
    _fabAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _borderRadiusAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    fabCurve = CurvedAnimation(
      parent: _fabAnimationController,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
    borderRadiusCurve = CurvedAnimation(
      parent: _borderRadiusAnimationController,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );

    fabAnimation = Tween<double>(begin: 0, end: 1).animate(fabCurve);
    borderRadiusAnimation = Tween<double>(begin: 0, end: 1).animate(
      borderRadiusCurve,
    );

    _hideBottomBarAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    Future.delayed(
      const Duration(seconds: 1),
      () => _fabAnimationController.forward(),
    );
    Future.delayed(
      const Duration(seconds: 1),
      () => _borderRadiusAnimationController.forward(),
    );
  }

  final autoSizeGroup = AutoSizeGroup();
  var _bottomNavIndex = 0;
  Widget _currentBody = const ProductsGrid(); // Default body

  late AnimationController _fabAnimationController;
  late AnimationController _borderRadiusAnimationController;
  late Animation<double> fabAnimation;
  late Animation<double> borderRadiusAnimation;
  late CurvedAnimation fabCurve;
  late CurvedAnimation borderRadiusCurve;
  late AnimationController _hideBottomBarAnimationController;

  final List<Map<String, dynamic>> iconList = [
    {
      'icon': Icons.local_offer_rounded,
      'name': 'Products',
      'page': const ProductsGrid(),
    },
    {
      'icon': Icons.work_history_rounded,
      'name': 'Projects',
      'page': const FarmerProjects(),
    },
  ];

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
      appBar: AppBar(
        title: const Text('Agrichapchap'),
        // bottom: PreferredSize(
        //   preferredSize: const Size.fromHeight(48.0),
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
        //     child: TextField(
        //       onChanged: _filterProducts,
        //       decoration: InputDecoration(
        //         hintText: 'Search',
        //         border: InputBorder.none,
        //         enabledBorder: UnderlineInputBorder(
        //           borderSide: BorderSide(
        //             color: Colors.grey.shade400,
        //           ),
        //         ),
        //         prefixIcon: const Icon(Icons.search),
        //       ),
        //     ),
        //   ),
        // ),
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
            _currentBody = FarmerNewsFeed();
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
          _currentBody = iconList[index]['page'] as Widget;
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
