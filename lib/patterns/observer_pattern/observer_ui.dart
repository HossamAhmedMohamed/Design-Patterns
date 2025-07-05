import 'dart:developer';

import 'package:flutter/material.dart';

abstract class Observer {
  update();
}

abstract class Observable {
  addObserver(Observer observer);
  removeObserver(Observer observer);
  notifyObservers();
}

class UiObserver implements Observable {
  List<Observer> observers = [];
  @override
  addObserver(Observer observer) {
    observers.add(observer);
  }

  @override
  removeObserver(Observer observer) {
    observers.remove(observer);
  }

  @override
  notifyObservers() {
    for (var observer in observers) {
      observer.update();
    }
  }
}

class ChangeObserver extends UiObserver {
  ChangeObserver._();

  static final ChangeObserver _instance = ChangeObserver._();
  factory ChangeObserver() => _instance;
  int count = 0;

  increase() {
    count++;
    notifyObservers();
  }

  decrease() {
    if (count > 0) {
      count--;
      notifyObservers();
    }
  }
}

class BaseObserver extends StatefulWidget {
  const BaseObserver({
    super.key,
    required this.obs,
    required this.widget,
    required this.builder,
  });

  final ChangeObserver obs;
  final Widget widget;
  final TransitionBuilder builder;
  @override
  State<BaseObserver> createState() => _BaseObserverState();
}

class _BaseObserverState extends State<BaseObserver> implements Observer {
  @override
  void initState() {
    widget.obs.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    widget.obs.removeObserver(this);
    super.dispose();
  }

  @override
  update() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    log("Build");
    return widget.builder(context, widget.widget);
  }
}
