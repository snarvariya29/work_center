import 'package:flutter/material.dart';
import 'package:triton_extensions/triton_extensions.dart';

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: 16.padding,
        child: Column(children: [
          Text('Description', style: context.textTheme.titleLarge,),
          const Column(
            children: [
              ListTile(
                title: Text('Manager'),
                subtitle: Text('10'),
              ),
              ListTile(
                title: Text('Waiter'),
                subtitle: Text('21'),
              ),
              ListTile(
                title: Text('Receptionist'),
                subtitle: Text('23'),
              ),
              ListTile(
                title: Text('House Keeping'),
                subtitle: Text('13'),
              ),
            ],
          )
        ],),
      ),
    );
  }
}