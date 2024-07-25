import 'package:agrichapchap/constants/app_colors.dart';
import 'package:agrichapchap/pages/farmer_news_feed.dart';
import 'package:agrichapchap/pages/farmer_projects.dart';
import 'package:agrichapchap/pages/products_grid.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ionicons/ionicons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
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
  Widget _currentBody = const ProductsGrid();

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

  final List<MarqueeItemData> marqueeItems = [
    MarqueeItemData(
      title: 'COFFEE',
      content: 'Content for item 1',
      price: 123.32,
      val: 0.12,
      iconType: MarqueeIconType.up,
      iconColor: Colors.green,
    ),
    MarqueeItemData(
      title: 'TEA',
      content: 'Content for item 2',
      price: 54.89,
      val: 1.45,
      iconType: MarqueeIconType.down,
      iconColor: Colors.red,
    ),
    MarqueeItemData(
      title: 'MAIZE',
      content: 'Content for item 3',
      price: 3200.67,
      val: 3.78,
      iconType: MarqueeIconType.up,
      iconColor: Colors.green,
    ),
    MarqueeItemData(
      title: 'SORGHUM',
      content: 'Content for item 4',
      price: 200.32,
      val: 0.99,
      iconType: MarqueeIconType.down,
      iconColor: Colors.red,
    ),
    MarqueeItemData(
      title: 'POTATOES',
      content: 'Content for item 5',
      price: 123.45,
      val: 2.50,
      iconType: MarqueeIconType.up,
      iconColor: Colors.green,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AgriChapchap',
          // style: TextStyle(color: AppColors.white),
        ),
        // backgroundColor: AppColors.darkGreen,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.lightGreen,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.grey,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: Image.network(
                        'https://images.unsplash.com/photo-1500595046743-cd271d694d30?q=80&w=2074&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      ).image,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Mkulima Nyumbani',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
            ExpansionTile(
              leading: const Icon(Icons.input_rounded),
              iconColor: AppColors.black,
              collapsedIconColor: AppColors.black,
              title: const Text('Farm Inputs'),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ListTile(
                    title: const Text('Bio Fertilisers'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ListTile(
                    title: const Text('Organic Fertilisers'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ListTile(
                    title: const Text('Pesticides'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ListTile(
                    title: const Text('Seeds'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ListTile(
                    title: const Text('Farm Machinery'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            ExpansionTile(
              leading: const Icon(Icons.school_rounded),
              title: const Text('Learning Hub'),
              iconColor: AppColors.black,
              collapsedIconColor: AppColors.black,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ListTile(
                    title: const Text('Videos'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ListTile(
                    title: const Text('Articles'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            ExpansionTile(
              leading: const Icon(Icons.pest_control_rodent_rounded),
              title: const Text('Pest Control'),
              iconColor: AppColors.black,
              collapsedIconColor: AppColors.black,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ListTile(
                    title: const Text('Pest Control AI'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            ExpansionTile(
              leading: const Icon(Icons.monetization_on_rounded),
              title: const Text('Financial Services'),
              iconColor: AppColors.black,
              collapsedIconColor: AppColors.black,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ListTile(
                    title: const Text('Loans'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            ExpansionTile(
              leading: const Icon(Icons.report_sharp),
              title: const Text('Reports'),
              iconColor: AppColors.black,
              collapsedIconColor: AppColors.black,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ListTile(
                    title: const Text('Monthly Report'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ListTile(
                    title: const Text('Annual Report'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ListTile(
                    title: const Text('ML Statistics'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: onScrollNotification,
        child: Column(
          children: [
            Container(
              height: 50,
              color: Colors.black,
              child: MarqueeText(
                items: marqueeItems,
                scrollDuration: 10,
              ),
            ),
            Expanded(
              child: _currentBody,
            ),
          ],
        ),
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

// class MarqueeText extends StatefulWidget {
//   final String text;
//   final TextStyle style;
//   final double duration;

//   const MarqueeText({
//     Key? key,
//     required this.text,
//     required this.style,
//     this.duration = 10.0,
//   }) : super(key: key);

//   @override
//   _MarqueeTextState createState() => _MarqueeTextState();
// }

// class _MarqueeTextState extends State<MarqueeText> {
//   late final ScrollController _scrollController;

//   @override
//   void initState() {
//     super.initState();
//     _scrollController = ScrollController();
//     _startScrolling();
//   }

//   void _startScrolling() {
//     Future.delayed(const Duration(milliseconds: 500), () {
//       _scrollController
//           .animateTo(
//         _scrollController.position.maxScrollExtent,
//         duration: Duration(seconds: widget.duration.toInt()),
//         curve: Curves.linear,
//       )
//           .whenComplete(() {
//         _scrollController.jumpTo(_scrollController.position.minScrollExtent);
//         _startScrolling(); // Loop the scrolling
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       controller: _scrollController,
//       child: Container(
//         color: Colors.blueGrey[300],
//         child: Center(
//           child: Text(
//             widget.text,
//             style: widget.style,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MarqueeText extends StatefulWidget {
//   final List<MarqueeItemData> items;
//   final double scrollDuration;

//   const MarqueeText({
//     Key? key,
//     required this.items,
//     this.scrollDuration = 10.0,
//   }) : super(key: key);

//   @override
//   _MarqueeTextState createState() => _MarqueeTextState();
// }

// class _MarqueeTextState extends State<MarqueeText> {
//   late final ScrollController _scrollController;

//   @override
//   void initState() {
//     super.initState();
//     _scrollController = ScrollController();
//     _startScrolling();
//   }

//   void _startScrolling() {
//     Future.delayed(const Duration(milliseconds: 500), () {
//       _scrollController
//           .animateTo(
//         _scrollController.position.maxScrollExtent,
//         duration: Duration(seconds: widget.scrollDuration.toInt()),
//         curve: Curves.linear,
//       )
//           .whenComplete(() {
//         _scrollController.jumpTo(_scrollController.position.minScrollExtent);
//         _startScrolling(); // Loop the scrolling
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 200, // Adjust height as needed
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         controller: _scrollController,
//         itemCount: widget.items.length,
//         itemBuilder: (context, index) {
//           final item = widget.items[index];
//           return SizedBox(
//             width: 200,
//             child: Container(
//               margin: const EdgeInsets.symmetric(horizontal: 8.0),
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey),
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//               child: ListTile(
//                 title: Text(item.title),
//                 subtitle: Text(item.content),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class MarqueeItemData {
//   final String title;
//   final String content;

//   MarqueeItemData({
//     required this.title,
//     required this.content,
//   });
// }

// Define a custom type for the icon
enum MarqueeIconType { up, down }

class MarqueeText extends StatefulWidget {
  final List<MarqueeItemData> items;
  final double scrollDuration;

  const MarqueeText({
    Key? key,
    required this.items,
    this.scrollDuration = 10.0,
  }) : super(key: key);

  @override
  _MarqueeTextState createState() => _MarqueeTextState();
}

class _MarqueeTextState extends State<MarqueeText> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _startScrolling();
  }

  void _startScrolling() {
    Future.delayed(const Duration(milliseconds: 500), () {
      _scrollController
          .animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(seconds: widget.scrollDuration.toInt()),
        curve: Curves.linear,
      )
          .whenComplete(() {
        _scrollController.jumpTo(_scrollController.position.minScrollExtent);
        _startScrolling();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          final item = widget.items[index];
          final icon = item.iconType == MarqueeIconType.up
              ? Ionicons.caret_up_outline
              : Ionicons.caret_down_outline;
          final iconColor = item.iconColor;

          return SizedBox(
            width: 290,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white),
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    item.price.toStringAsFixed(2),
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white),
                  ),
                  const SizedBox(width: 8.0),
                  Icon(icon, color: iconColor, size: 24),
                  const SizedBox(width: 8.0),
                  Text(
                    item.val.toStringAsFixed(2),
                    style: TextStyle(
                      color: iconColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class MarqueeItemData {
  final String title;
  final String content;
  final double price;
  final double val;
  final MarqueeIconType iconType;
  final Color iconColor;

  MarqueeItemData({
    required this.title,
    required this.content,
    required this.price,
    required this.val,
    required this.iconType,
    required this.iconColor,
  });
}
