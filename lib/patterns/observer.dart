abstract class Observerrrr {
  updatePrice(double price);
}

abstract class Observableee {
  addObserver(Observerrrr observer);
  removeObserver(Observerrrr observer);
  notifyObservers();
}

class Stock implements Observableee {
  double _price = 0;

  void setPrice(double price) {
    _price = price;
    notifyObservers();
  }

  List<Observerrrr> observers = [];
  @override
  addObserver(Observerrrr observer) {
    observers.add(observer);
  }

  @override
  removeObserver(Observerrrr observer) {
    observers.remove(observer);
  }

  @override
  notifyObservers() {
    for (var observer in observers) {
      observer.updatePrice(_price);
    }
  }
}


class  UiObserver implements Observerrrr {
  @override
  updatePrice(double price) {
    print("The new stock price is: \$${price.toStringAsFixed(2)}");
  }

} 
