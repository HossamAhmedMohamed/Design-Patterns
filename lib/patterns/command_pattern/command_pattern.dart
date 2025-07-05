abstract class Command {
  void execute();
}

class LightOnCommand implements Command {
  @override
  void execute() {
    print("Light is ON");
  }
}

class LightOffCommand implements Command {
  @override
  void execute() {
    print("Light is OFF");
  }
}

class FanOnCommand implements Command {
  @override
  void execute() {
    print("Fan is ON");
  }
}

class FanOffCommand implements Command {
  @override
  void execute() {
    print("Fan is OFF");
  }
}

class RemoteControl {
  void setCommand(Command command) {
    command.execute();
  }
}
