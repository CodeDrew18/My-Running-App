import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Stream<StepCount> stepCount;
  late Stream<PedestrianStatus> pedestrianStatus;

  int steps = 0;
  String status = "Stopped";
  double distanceKm = 0.0;

  double stepLengthMeters = 0.78;

  @override
  void initState() {
    super.initState();
    statusInit();
  }

  void onStepCount(StepCount event) {
    setState(() {
      steps = event.steps;
      distanceKm = (steps * stepLengthMeters) / 1000;
    });
  }

  void onPedestrianStatus(PedestrianStatus event) {
    setState(() {
      status = event.status;
    });
  }

  void onPedestrianStatusError(error) {}
  void onStepCountError(error) {}

  void statusInit() {
    stepCount = Pedometer.stepCountStream;
    pedestrianStatus = Pedometer.pedestrianStatusStream;

    stepCount.listen(onStepCount).onError(onStepCountError);
    pedestrianStatus.listen(onPedestrianStatus).onError(onPedestrianStatusError);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Running App"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.directions_walk_outlined, color: Colors.blue, size: 80),
            SizedBox(height: 20),
            Text('Steps: $steps', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text('Distance: ${distanceKm.toStringAsFixed(2)} km', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text('Status: $status', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }

}
