abstract class Observer {
  watchVideo();
}

class ConcreteObserver implements Observer {
  @override
  watchVideo() {
    print("------------------");
    print("Watching video");
  }
}

abstract class Observable {
  subScribe(Observer obs);
  unSubScribe(Observer obs);
  notifyObservers();
}

class ConcreteObservable implements Observable {

  List<Observer> observers = [];
  @override
  subScribe(Observer obs) {
    observers.add(obs);
  }

  @override
  unSubScribe(Observer obs) {
    observers.remove(obs);
  }

  @override
  notifyObservers() {
    for (var observer in observers) {
      observer.watchVideo();
    }
  }
}
