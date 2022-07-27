import 'package:flutter/material.dart';

class TimeMachineEffect extends StatefulWidget {
  const TimeMachineEffect({Key? key}) : super(key: key);
  static const String routeName = '/time-machine-effect';
  @override
  State<TimeMachineEffect> createState() => _TimeMachineEffectState();
}

class _TimeMachineEffectState extends State<TimeMachineEffect> {
  Tween<Offset> offset = Tween(begin: Offset(0, 1), end: Offset(0, 0));
  int fifthLastElement = 192;
  List<Color> colors = getAllColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          height:320,
          child: AnimatedList(
            initialItemCount: 5,
            itemBuilder: (context, index, animation) => SlideTransition(
              position: animation.drive(offset),
              child: Align(
                alignment: Alignment.topCenter,
                heightFactor: 0.08,
                child: Padding(
                  padding: EdgeInsets.all((5-index)*1.3),
                  child: AspectRatio(
                    aspectRatio: 3 / 3.2,
                    child: Container(
                      // height: 200,
                      // width: 100,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade800,
                              blurRadius: 1.6,
                            ),
                          ],
                          color: colors[fifthLastElement + index],
                          borderRadius: BorderRadius.circular(16)),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List<Color> getAllColors() {
  List<MaterialColor> col = Colors.primaries;
  List<Color> x = [];

  for (MaterialColor c in col) {
//       print(c);
    x.addAll([
      c.shade100,
      c.shade200,
      c.shade300,
      c.shade400,
      c.shade500,
      c.shade600,
      c.shade600,
      c.shade700,
      c.shade700,
      c.shade800,
      c.shade900
    ]);
  }
  // print("all colors");
  // print(x);
  // print(x.length); // 198
  // print(x.toSet().length); // 162
  return x;
}
