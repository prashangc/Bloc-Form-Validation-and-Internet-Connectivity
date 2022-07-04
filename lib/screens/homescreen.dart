import 'package:app/blocs/internet_bloc/internet_bloc.dart';
import 'package:app/blocs/internet_bloc/internet_state.dart';
import 'package:app/widgets/ConnectedScreen.dart';
import 'package:app/widgets/DisconnectedScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/sign_in_bloc/sign_in_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: BlocConsumer<InternetBloc, InternetState>(
          listener: (context, state) {
            if (state is InternetGainedState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Internet Connected!'),
                backgroundColor: Colors.green,
              ));
            } else if (state is InternetLostState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Internet Disconnected!'),
                backgroundColor: Colors.red,
              ));
            }
          },
          builder: (context, state) {
            // if (state == ) is used to check value
            // if (state is ) is used to check datatype
            if (state is InternetGainedState) {
              return const ConnectedScreen();
            } else if (state is InternetLostState) {
              return BlocProvider(
                create: (context) => SignInBloc(),
                child: const DisconnectedScreen(),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    ));
  }
}
