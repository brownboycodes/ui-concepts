import 'package:flutter/material.dart';
import 'package:flutter_ui_concepts/projects/bottom_sheet_transition/bottom_sheet_transition.dart';
import 'package:flutter_ui_concepts/projects/interactive_toolbar/interactive_toolbar.dart';

Map<String, WidgetBuilder> routes = {
  HomePage.routeName: (context) => const HomePage(),
  BottomSheetTransition.routeName: (BuildContext context) =>
      const BottomSheetTransition(),
  InteractiveToolbar.routeName: (context) => const InteractiveToolbar()
};

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'UI challenge Practice',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    routes: routes,
    initialRoute: HomePage.routeName,
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('UI concepts in flutter'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth == 0) {
            return Container();
          } else {
            return SizedBox.expand(
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: routes.keys
                    .map((key) => ElevatedButton(
                        onPressed: () => Navigator.of(context).pushNamed(key),
                        child: Text(key)))
                    .toList(),
              ),
            );
          }
        },
      ),
    );
  }
}
