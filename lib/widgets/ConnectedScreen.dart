import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/sign_in_bloc/sign_in_bloc.dart';
import '../screens/sign_in.dart';

class ConnectedScreen extends StatefulWidget {
  const ConnectedScreen({Key? key}) : super(key: key);

  @override
  State<ConnectedScreen> createState() => _ConnectedScreenState();
}

class _ConnectedScreenState extends State<ConnectedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage("assets/welcome.gif"),
            height: 300,
          ),
          CupertinoButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlocProvider(
                            create: (context) => SignInBloc(),
                            child: const SignINPage(),
                          )));
            },
            color: Colors.blue,
            child: const Text(
              "Enter",
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
