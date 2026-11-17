import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

Future<String> someFutureFunction() {
  Future<String> data = Future.delayed(
    Duration(seconds: 4),
    () => "New is load ...",
  );
  return data;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final Future<String> _newFuture;
  @override
  void initState() {
    super.initState();
    _newFuture = someFutureFunction();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _newFuture,
      builder: ((context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Error');
        }
        return Text(snapshot.data!);
      }),
    );
  }
}
