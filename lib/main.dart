import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static final navigatorKey = GlobalKey<NavigatorState>();
  List<NewPage> test = [
    NewPage(
      name: 'Hai',
      onTap: () {
        navigatorKey.currentState!
            .push(MaterialPageRoute(builder: (context) => const HaiPage()));
      },
    ),
    NewPage(
      name: 'Dat',
      onTap: () {
        navigatorKey.currentState!.push(MaterialPageRoute(
          builder: (context) => const DatPage(),
        ));
      },
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      home: Scaffold(
          body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return Center(
                      child: ElevatedButton(
                          onPressed: test[index].onTap,
                          child: Text(test[index].name)),
                    );
                  }),
            ),
          ],
        ),
      )),
    );
  }
}

class NewPage {
  final String name;
  final VoidCallback onTap;

  NewPage({required this.name, required this.onTap});
}

class HaiPage extends StatelessWidget {
  const HaiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HaiPage'),
      ),
    );
  }
}

class DatPage extends StatelessWidget {
  const DatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DatPage'),
      ),
    );
  }
}
