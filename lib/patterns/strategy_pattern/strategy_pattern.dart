abstract class PaymentStrategy {
  void checkout(double amount);
}

class StripePayment extends PaymentStrategy {
  @override
  void checkout(double amount) {
    print("Processing payment of \$$amount through Stripe.");
  }
}

class PayPalPayment extends PaymentStrategy {
  @override
  void checkout(double amount) {
    print("Processing payment of \$$amount through PayPal.");
  }
}

class VodafoneCachPayment extends PaymentStrategy {
  @override
  void checkout(double amount) {
    print("Processing payment of \$$amount through Vodafone Cash.");
  }
}

class PaymentManager {
  PaymentStrategy? paymentStrategy;


  setStrategy(PaymentStrategy paymentStrategy) {
    this.paymentStrategy = paymentStrategy;
  }

  void processPayment(double amount) {
    if (paymentStrategy == null) {
      print("No payment strategy set.");
      return;
    }
    paymentStrategy!.checkout(amount);
  }
}
