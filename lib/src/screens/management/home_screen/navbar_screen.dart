import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_work/src/core/navigation/app_routes.dart';
import 'package:get_work/src/screens/management/home_screen/blocs/get_jobs_qubit.dart';
import 'package:get_work/src/screens/management/home_screen/home_page.dart';
import 'package:get_work/src/screens/management/home_screen/profile_page.dart';
import 'package:go_router/go_router.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    context.read<GetJobsQubit>().getJobs();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const [HomePage(), ProfilePage()][pageIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(AppRoutes.createJob.name);
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIndex,
          onTap: (value) {
            setState(() {
              pageIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
            // BottomNavigationBarItem(
            //     icon: Icon(Icons.settings), label: 'settings'),
          ]),
    );
  }
}
