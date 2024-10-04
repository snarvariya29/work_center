import 'package:flutter/material.dart';
import 'package:triton_extensions/triton_extensions.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: 16.padding,
        height: 200,
        child: Column(
          children: [
            Text('Overview', style: context.textTheme.titleLarge,),
            16.space,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text('Jobs Created',  style: context.textTheme.titleMedium,),
                      Text('10', style: context.textTheme.displaySmall,),
                      TextButton(onPressed: (){}, child: const Text('View jobs'))
                    ],
                  ),
                ),
                12.space,
                Container(
                  width: 1,
                  color: Colors.black,
                  height: 100,
                ),
                12.space,
                Expanded(
                  child: Column(
                    children: [
                      Text('Responses',  style: context.textTheme.titleMedium,),
                        Text('67', style: context.textTheme.displaySmall,),
                        TextButton(onPressed: (){}, child: const Text('View all responses'))
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}