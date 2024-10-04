import 'package:flutter/material.dart';
import 'package:get_work/src/core/models/job.dart';
import 'package:go_router/go_router.dart';

class JobViewCard extends StatelessWidget {
  final Job job;
  const JobViewCard({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () {
          context.pushNamed('view-job', extra: {'job': job});
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const Icon(Icons.work),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(job.title), Text(job.address)],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
