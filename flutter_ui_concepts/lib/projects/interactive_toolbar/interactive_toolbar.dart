import 'package:flutter/material.dart';

class InteractiveToolbar extends StatefulWidget {
  const InteractiveToolbar({
    Key? key,
  }) : super(key: key);

  static const String routeName = '/interactive-toolbar';

  @override
  State<InteractiveToolbar> createState() => _InteractiveToolbarState();
}

class _InteractiveToolbarState extends State<InteractiveToolbar> {
  final ScrollController _scrollController = ScrollController();

  List<MenuItems> menuItems = [
    MenuItems(
        name: 'draw',
        backgroundColor: Colors.deepPurple.shade400,
        icon: 'https://cdn-icons-png.flaticon.com/512/7693/7693434.png'),
    const MenuItems(
        name: 'lasso',
        backgroundColor: Colors.green,
        icon: 'https://cdn-icons-png.flaticon.com/512/7236/7236522.png'),
    const MenuItems(
        name: 'comment',
        backgroundColor: Colors.blue,
        icon: 'https://cdn-icons-png.flaticon.com/512/7519/7519475.png'),
    const MenuItems(
        name: 'enhance',
        backgroundColor: Colors.amber,
        icon: 'https://cdn-icons-png.flaticon.com/512/4898/4898250.png'),
    const MenuItems(
        name: 'picker',
        backgroundColor: Colors.redAccent,
        icon: 'https://cdn-icons-png.flaticon.com/512/4329/4329079.png'),
    const MenuItems(
        name: 'rotation',
        backgroundColor: Colors.purple,
        icon: 'https://cdn-icons-png.flaticon.com/512/7355/7355511.png'),
    const MenuItems(
        name: 'brightness',
        backgroundColor: Colors.yellow,
        icon: 'https://cdn-icons-png.flaticon.com/512/606/606795.png'),
    const MenuItems(
        name: 'cut',
        backgroundColor: Colors.blueGrey,
        icon: 'https://cdn-icons-png.flaticon.com/512/2927/2927563.png'),
    MenuItems(
        name: 'shapes',
        backgroundColor: Colors.tealAccent.shade400,
        icon: 'https://cdn-icons-png.flaticon.com/512/983/983915.png'),
    const MenuItems(
        name: 'paint',
        backgroundColor: Colors.pinkAccent,
        icon: 'https://cdn-icons-png.flaticon.com/512/3597/3597168.png'),
    const MenuItems(
        name: 'vector',
        backgroundColor: Colors.indigoAccent,
        icon: 'https://cdn-icons-png.flaticon.com/512/6695/6695143.png'),
    const MenuItems(
        name: 'measure',
        backgroundColor: Colors.deepOrange,
        icon: 'https://cdn-icons-png.flaticon.com/512/3789/3789856.png'),
    MenuItems(
        name: 'transform',
        backgroundColor: Colors.blue.shade200,
        icon: 'https://cdn-icons-png.flaticon.com/512/6695/6695320.png'),
    const MenuItems(
        name: 'layers',
        backgroundColor: Colors.brown,
        icon: 'https://cdn-icons-png.flaticon.com/512/481/481865.png'),
  ];

  double h = 8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // /*
          Padding(
        padding: const EdgeInsets.only(top: 48, left: 48),
        child: Stack(
          clipBehavior: Clip.none,

          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 86,
              height: 420,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(16)),
              // */

              /*
                child: ListWheelScrollView(
// renderChildrenOutsideViewport: true,
// clipBehavior: Clip.none,

                  itemExtent: 72,
                  physics: const BouncingScrollPhysics(),
                  children: menuItems,
                )
                */
            ),
            Container(
              height: 420,
              alignment: Alignment.center,
              child: NotificationListener<ScrollNotification>(
                onNotification: (scrollNotification) {
                  /*
                  print('inside the onNotification');
                  if (_scrollController.position.userScrollDirection ==
                      ScrollDirection.reverse) {
                    debugPrint('scrolled down');
                    //the setState function
                  } else if (_scrollController.position.userScrollDirection ==
                      ScrollDirection.forward) {
                    debugPrint('scrolled up');
                    //setState function
                  } else
                  */
                  if (_scrollController.position.isScrollingNotifier.value ==
                      true) {
                    debugPrint('scrolling current');
                    if (h == 8.0) {
                      setState(() {
                        h = 16;
                      });
                    }
                  } else {
                    if (h == 16) {
                      setState(() {
                        h = 8;
                      });
                    }
                    debugPrint('scrolling stoPPed');
                  }
                  return true;
                },
                child: ListView.separated(
                  controller: _scrollController,
                  // clipBehavior: Clip.none,
                  // itemExtent: 72,

                  shrinkWrap: true,
                  itemCount: menuItems.length,
                  padding: const EdgeInsets.all(0),
                  physics: const BouncingScrollPhysics(),

                  itemBuilder: (context, index) {
                    // print('currently showing $index');
                    return Row(
                      children: [
                        menuItems[index],
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      height: h,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItems extends StatefulWidget {
  final String name;
  final Color backgroundColor;
//   final IconData icon;
  final String icon;
  const MenuItems(
      {Key? key,
      required this.name,
      required this.backgroundColor,
      required this.icon})
      : super(key: key);

  @override
  State<MenuItems> createState() => _MenuItemsState();
}

class _MenuItemsState extends State<MenuItems> {
  double w = 70;
  Alignment a = Alignment.center;
  bool showText = false;
  EdgeInsets margin = const EdgeInsets.all(8);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // on
      onTapDown: (_) => setState(() {
        w = 200;
        a = Alignment.centerLeft;
        showText = true;
      }),
      onTapUp: (_) => setState(() {
        w = 70;
        a = Alignment.center;
        showText = false;
      }),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1500),
        // transformAlignment: Alignment.center,
        curve: Curves.decelerate,
        height: 70,
        width: w,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(16)),
        alignment: a,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.network(
              widget.icon,
              color: Colors.white,
            ),
            if (showText)
              Flexible(
                  child: Text(
                widget.name,
                style: const TextStyle(
                    fontSize: 21,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ))
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    print("initState called");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies called");
  }

  @override
  void didUpdateWidget(covariant MenuItems oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget called");
  }

  @override
  void deactivate() {
    print("deactivate called");
    super.deactivate();
  }

  @override
  void dispose() {
    print("dispose called");
    super.dispose();
  }
}
