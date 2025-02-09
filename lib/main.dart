import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _firstImage = true;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _toggleImage() {
    setState(() {
      _firstImage = _firstImage?false:true;
    });
  }

  void _reset() {
    setState(() {
      _counter = 0;
      _firstImage = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20
        ),
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(onPressed: _reset, child: Text("Reset")),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Center(
              child: AnimatedSwitcher(
                duration: Duration(seconds: 1),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: Image.network(
                  _firstImage ? "https://snkr.com.co/cdn/shop/files/img01_fb490543-f3b1-49be-b57d-17b4698edd59.jpg?v=1719702403&width=1445" : "https://www.crepslocker.com/cdn/shop/products/Dior-B30-Technical-Mesh-Light-Blue-Grey-Trainer-Crepslocker-Front-Side.jpg?v=1671728771",
                  key: ValueKey<bool>(_firstImage),
                  height: 300,
                ),
              )
            ),
            ElevatedButton(onPressed: _toggleImage, child: Text("Toggle Image"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}