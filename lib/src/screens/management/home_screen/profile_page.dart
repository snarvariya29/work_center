import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_work/src/screens/common/auth/bloc/auth_bloc.dart';
import 'package:triton_extensions/triton_extensions.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state.status == AuthStatus.loading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return ProfileCard(
        user: state.user!,
      );
    });
  }
}

class ProfileCard extends StatelessWidget {
  final User user;
  const ProfileCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: context.colorScheme.primary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Icon(Icons.person,
                    size: 50, color: context.colorScheme.onPrimary),
              )),
          24.space,
          Text(
            user.displayName ?? 'No Name',
            style: context.textTheme.titleLarge,
          ),
          8.space,
          Text(
            user.email!,
            style: context.textTheme.titleSmall,
          ),
          Text(user.uid),
          8.space,
          user.emailVerified
              ? const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [Icon(Icons.verified), Text('Verified')],
                )
              : const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [Icon(Icons.close), Text('Not verified')],
                ),
          24.space,
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: context.colorScheme.error,
            ),
            title: Text(
              'Logout',
              style: context.textTheme.titleMedium!
                  .copyWith(color: context.colorScheme.error),
            ),
            onTap: () {
              context.read<AuthBloc>().add(LogOut());
            },
          )
        ],
      ),
    );
  }
}
