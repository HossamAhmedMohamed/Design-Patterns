import 'package:design_patterns/patterns/observer_pattern/observer_pattern.dart';
import 'package:design_patterns/patterns/observer_pattern/observer_ui.dart';
import 'package:flutter/material.dart';

void main() {
  // Observer obs1 = ConcreteObserver();
  // Observer obs2 = ConcreteObserver();
  // Observable observable = ConcreteObservable();

  // observable.subScribe(obs1);
  // observable.subScribe(obs2);

  // observable.notifyObservers();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ChangeObserver obs = ChangeObserver();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            obs.increase();
          },
        ),

        body: BaseObserver(
          obs: obs,
          widget: Center(
            child: Text(
              "Count: ${obs.count}",
              style: const TextStyle(fontSize: 30),
            ),
          ),
          builder: (context, child) {
            return Center(
              child: Text(
                "Count: ${obs.count}",
                style: const TextStyle(fontSize: 30),
              ),
            );
          },
        ),
      ),
    );
  }
}
