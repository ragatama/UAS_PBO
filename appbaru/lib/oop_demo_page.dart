// oop_demo_page.dart
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = '';

  void _demonstrateOOPConcepts() {
    final car = Car('Toyota', 'Corolla', 4);
    final motorcycle = Motorcycle('Honda', 'CBR', false);

    setState(() {
      output = '''
Car: ${car.getBrandAndModel()}
Motorcycle: ${motorcycle.getBrandAndModel()}

Starting vehicles:
${car.start()}
${motorcycle.start()}

Vehicle types:
${car.getVehicleType()}
${motorcycle.getVehicleType()}

Special actions:
${car.honk()}
${motorcycle.wheelie()}

Stopping vehicles:
${car.stop()}
${motorcycle.stop()}
''';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ElevatedButton(
              onPressed: _demonstrateOOPConcepts,
              child: const Text('Demonstrate OOP Concepts'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(output),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Abstract class for Vehicle
abstract class Vehicle {
  String brand;
  String model;

  Vehicle(this.brand, this.model);

  String start();
  String stop();

  String getBrandAndModel() {
    return '$brand $model';
  }

  String getVehicleType();
}

// Car class inheriting from Vehicle
class Car extends Vehicle {
  int numDoors;

  Car(super.brand, super.model, this.numDoors);

  @override
  String start() {
    return 'Car with $numDoors doors is starting. Vroom!';
  }

  @override
  String stop() {
    return 'Car with $numDoors doors is stopping.';
  }

  @override
  String getVehicleType() {
    return 'Car with $numDoors doors';
  }

  String honk() {
    return 'Beep beep! $numDoors-door car honking!';
  }
}

// Motorcycle class inheriting from Vehicle
class Motorcycle extends Vehicle {
  bool hasSidecar;

  Motorcycle(super.brand, super.model, this.hasSidecar);

  @override
  String start() {
    return 'Motorcycle ${hasSidecar ? "with sidecar " : ""}is starting. Vroom vroom!';
  }

  @override
  String stop() {
    return 'Motorcycle ${hasSidecar ? "with sidecar " : ""}is stopping.';
  }

  @override
  String getVehicleType() {
    return 'Motorcycle ${hasSidecar ? "with sidecar" : "without sidecar"}';
  }

  String wheelie() {
    return hasSidecar ? "Can't do a wheelie with a sidecar!" : 'Doing a wheelie!';
  }
}