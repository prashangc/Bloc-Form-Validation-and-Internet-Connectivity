import 'package:app/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:app/blocs/sign_in_bloc/sign_in_event.dart';
import 'package:app/blocs/sign_in_bloc/sign_in_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignINPage extends StatefulWidget {
  const SignINPage({Key? key}) : super(key: key);

  @override
  State<SignINPage> createState() => _SignINPageState();
}

class _SignINPageState extends State<SignINPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign in with email")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            children: [
              BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
                if (state is SignInErrorState) {
                  return Text(
                    state.errorMessage,
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                  );
                } else {
                  return Container();
                }
              }),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: emailController,
                onChanged: (val) {
                  BlocProvider.of<SignInBloc>(context).add(
                      SignInTextChangedEvent(
                          emailController.text, passwordController.text));
                },
                decoration: const InputDecoration(hintText: "email"),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                obscureText: true,
                controller: passwordController,
                onChanged: (val) {
                  BlocProvider.of<SignInBloc>(context).add(
                      SignInTextChangedEvent(
                          emailController.text, passwordController.text));
                },
                decoration: const InputDecoration(hintText: "password"),
              ),
              const SizedBox(
                height: 15,
              ),
              BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
                if (state is SignInLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }
                return CupertinoButton(
                  onPressed: () {
                    if (state is SignInValidState) {
                      BlocProvider.of<SignInBloc>(context).add(
                          SignInSubmittedEvent(
                              emailController.text, passwordController.text));
                    }
                  },
                  color:
                      (state is SignInValidState) ? Colors.blue : Colors.grey,
                  child: const Text("SignIn"),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
