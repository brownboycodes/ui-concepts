import 'package:flutter/material.dart';

class BottomSheetTransition extends StatefulWidget {
  const BottomSheetTransition({Key? key}) : super(key: key);

  static const String routeName = '/bottom-sheet-transition';
  @override
  State<BottomSheetTransition> createState() => _BottomSheetTransitionState();
}

class _BottomSheetTransitionState extends State<BottomSheetTransition>
    with SingleTickerProviderStateMixin {
  bool isOpen = true;
  bool reachedTop = false;
  late Animation<Alignment> alignAnimation;
  late AnimationController controller;
  Alignment defaultAlignment = const Alignment(0, 1);
  double h = 0.5;
  double w = 1;
  double border = 16;
  double p = 36;
  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    AlignmentTween aligning =
        AlignmentTween(begin: const Alignment(0, 1), end: const Alignment(0, -0.84));
    alignAnimation = aligning.animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, double> billDetails = {
      'Socks': 7.99,
    };
    billDetails['Tax'] = billDetails['Socks']! * 0.0538;
    billDetails['Total'] = billDetails['Socks']! + billDetails['Tax']!;

    Widget billDetailsHolder = ListView(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: billDetails
          .map((key, value) => MapEntry(
                key,
                Padding(
                  padding: key == 'Socks'
                      ? const EdgeInsets.only(top: 0)
                      : const EdgeInsets.only(top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        key,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: key == 'Total' ? Colors.black : Colors.grey),
                      ),
                      Text(
                        '\$ ${value.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: key == 'Total' ? Colors.black : Colors.grey),
                      )
                    ],
                  ),
                ),
              ))
          .values
          .toList(),
    );

    Widget billBody = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // direction: Axis.vertical,
      // alignment: WrapAlignment.center,
      // crossAxisAlignment: WrapCrossAlignment.center,

      children: [
        if (isOpen)
          Flexible(
            child: Text(
              'Price',
              style: TextStyle(
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
        // SizedBox(
        //   height: 6.18,
        // ),
        const Flexible(
          child: Text(
            '\$7.99',
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
        ),
        // SizedBox(
        //   height: 21,
        // ),
        if (isOpen)
          Flexible(
            flex: 3,
            child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(9.6)),
                child: billDetailsHolder),
          ),
        // SizedBox(
        //   height: 24,
        // ),
        if (isOpen)
          Flexible(
            child: FractionallySizedBox(
              widthFactor: 1,
              // heightFactor: 0.004,
              child: TextButton(
                  onPressed: null,
                  style: TextButton.styleFrom(
                    minimumSize: const Size(100, 48),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9.6)),
                    backgroundColor: Colors.greenAccent.shade400,
                  ),
                  child: const Text(
                    'Regular',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )),
            ),
          )
      ],
    );
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox.expand(
        child:
            //  Column(
            // children: [

            AnimatedBuilder(
          animation: controller,
          builder: (context, child) => Align(
            alignment: alignAnimation.value,
            // alignment: isOpen ? Alignment(0, 1) : Alignment(0, -0.84),
            child: GestureDetector(
              onTap: toggleOpen,
              // child: FractionallySizedBox(
              //   widthFactor: isOpen ? 1 : 0.48,
              //   heightFactor: isOpen ? 0.5 : 0.08,
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(isOpen ? 16 : 36),
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 1000),
                    height: MediaQuery.of(context).size.height * h,
                    width: MediaQuery.of(context).size.width * w,

                    // padding: EdgeInsets.all(isOpen ? 36 : 6),
                    padding: EdgeInsets.all(p),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(border)),
                    alignment: Alignment.center,
                    // color: Colors.white,
                    child: billBody,
                  ),
                  
                ],
              ),
            ),
          ),
        ),
        //   ),
        // )
        // ],
        // )
      ),
    );
  }

  void toggleOpen() {
    if (isOpen) {
      controller.forward();
    } else {
      controller.reverse();
    }
    // setState(() {
    //   isOpen = !isOpen;
    //   // defaultAlignment = isOpen ? Alignment(0, 1) : Alignment(0, -0.84);
    // });

    alignAnimation.addListener(() {
      if (alignAnimation.status == AnimationStatus.forward &&
          alignAnimation.value.y < 0.5 &&
          isOpen) {
        setState(() {
          // isOpen = false;
          w = 0.48;
          h = 0.08;
          p = 6;
          border = 36;
        });
        // debugPrint('listening isOpen');
         Future.delayed(
            const Duration(milliseconds: 500),
            () => setState(
                  () => isOpen = false,
                ));
      } else if (alignAnimation.status == AnimationStatus.reverse &&
          alignAnimation.value.y > 0.0 &&
          isOpen == false) {
        setState(() {
          w = 1;
          h = 0.5;
          p = 36;
          border = 16;
          // isOpen = true;
        });
        Future.delayed(
            const Duration(milliseconds: 700),
            () => setState(
                  () => isOpen = true,
                ));

        // debugPrint('listening isClosed');
      }
    });
  }
}
