import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_work/src/screens/common/auth/bloc/auth_bloc.dart';
import 'package:get_work/src/screens/common/auth/login_screen.dart';
import 'package:get_work/src/screens/common/auth/start_controller.dart';

class LoginController extends StatelessWidget {
  const LoginController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state.status == AuthStatus.authenticated) {
        return const StartController();
      } else if (state.status == AuthStatus.unauthenticated) {
        return const LogInScreen();
      } else {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    });
  }
}
