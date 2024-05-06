import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Comex Cano 0440',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff0790ff),
      ),
      body: Image.asset(
        "assets/images/Amor.jpg",
        width: 400,
        height: 300,
        fit: BoxFit.contain,
        frameBuilder: (context, child, frame, loaded) {
          if (loaded) {
            return child;
          }
          return AnimatedOpacity(
            opacity: frame == null ? 0 : 1,
            duration: const Duration(seconds: 1),
            curve: Curves.easeOut,
            child: child,
          );
        },
        errorBuilder: (context, exception, stackTrace) {
          return const Center(
            child: Text("Algo salió mal, por favor vuelva a intentar"),
          );
        },
      ),
    );
  }
}
