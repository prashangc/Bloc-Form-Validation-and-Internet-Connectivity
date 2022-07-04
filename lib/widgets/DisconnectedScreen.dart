import 'package:flutter/material.dart';

class DisconnectedScreen extends StatefulWidget {
  const DisconnectedScreen({Key? key}) : super(key: key);

  @override
  State<DisconnectedScreen> createState() => _DisconnectedScreenState();
}

class _DisconnectedScreenState extends State<DisconnectedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Pattern- Connectivity test"),
      ),
      body: Center(
        child: Container(
          height: 600,
          padding: const EdgeInsets.all(35),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 4),
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Colors.blue,
                offset: Offset(6.0, 6.0),
              ),
            ],
          ),
          child: Column(
            children: const [
              Text("Please connect your internet to sign up",
                  style: TextStyle(fontSize: 25, color: Colors.white)),
              Image(
                image: AssetImage("assets/giphy.gif"),
                height: 300,
              ),
              CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
