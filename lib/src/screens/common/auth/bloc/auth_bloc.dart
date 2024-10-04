import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_work/src/screens/common/auth/service/auth_service.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
  loading,
}

class AuthState extends Equatable {
  final AuthStatus? status;
  final User? user;
  const AuthState({this.status, this.user});

  @override
  List<Object?> get props => [status, user];

  AuthState copyWith({AuthStatus? status, User? user}) {
    return AuthState(status: status ?? this.status, user: user ?? this.user);
  }
}

class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class Login extends AuthEvent {
  final String email;
  final String password;
  Login({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class CreateAccount extends AuthEvent {
  final String email;
  final String password;
  CreateAccount({required this.email, required this.password});
  @override
  List<Object?> get props => [email, password];
}

class LoadAuthState extends AuthEvent {}

class LogOut extends AuthEvent {}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(AuthService authService)
      : super(const AuthState(status: AuthStatus.unauthenticated)) {
    on<Login>((event, emit) async {
      emit(state.copyWith(status: AuthStatus.loading));
      try {
        User user = (await authService.login(event.email, event.password))!;
        emit(state.copyWith(status: AuthStatus.authenticated, user: user));
      } catch (e) {
        log(e.toString());
        emit(state.copyWith(status: AuthStatus.unauthenticated));
      }
    });

    on<CreateAccount>((event, emit) async {
      emit(state.copyWith(status: AuthStatus.loading));
      try {
        User user =
            (await authService.createAccount(event.email, event.password))!;
        emit(state.copyWith(status: AuthStatus.authenticated, user: user));
      } catch (e) {
        emit(state.copyWith(status: AuthStatus.unauthenticated));
      }
    });

    on<LoadAuthState>((event, emit) async {
      emit(state.copyWith(status: AuthStatus.loading));
      try {
        User user = (authService.getCurrentUser())!;
        emit(state.copyWith(status: AuthStatus.authenticated, user: user));
      } catch (e) {
        emit(state.copyWith(status: AuthStatus.unauthenticated));
      }
    });
    on<LogOut>((event, emit) async {
      await authService.logOut();
      emit(state.copyWith(status: AuthStatus.unauthenticated));
    });

    add(LoadAuthState());
  }
}
