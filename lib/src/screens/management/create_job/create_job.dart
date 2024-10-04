import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_work/src/core/models/job.dart';
import 'package:get_work/src/screens/management/create_job/bloc/create_job.dart';
import 'package:get_work/src/screens/management/create_job/enums/job_types.dart';
import 'package:go_router/go_router.dart';
import 'package:triton_extensions/triton_extensions.dart';

class CreateJobScreen extends StatefulWidget {
  const CreateJobScreen({super.key});

  @override
  State<CreateJobScreen> createState() => _CreateJobScreenState();
}

class _CreateJobScreenState extends State<CreateJobScreen> {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController experienceRequiredController =
      TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();
  String? type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Job'),
      ),
      body: SingleChildScrollView(
        padding: 24.padding,
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: 'Job Title',
                ),
              ),
              16.space,
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  hintText: 'Job Description',
                ),
                minLines: 6,
                maxLines: 6,
              ),
              12.space,
              DropdownMenu(
                  width: context.screenSize.width - 48,
                  onSelected: (value) {
                    type = value!;
                  },
                  dropdownMenuEntries: JobType.values
                      .map((type) => DropdownMenuEntry(
                          value: type.value, label: type.value))
                      .toList()),
              12.space,
              TextFormField(
                controller: addressController,
                decoration: const InputDecoration(hintText: 'Address'),
                maxLines: 3,
                minLines: 3,
              ),
              12.space,
              TextFormField(
                controller: salaryController,
                decoration: const InputDecoration(hintText: 'Salary offered'),
              ),
              12.space,
              TextFormField(
                controller: experienceRequiredController,
                decoration: const InputDecoration(hintText: 'Requirements'),
                minLines: 4,
                maxLines: 4,
              ),
              12.space,
              FilledButton(
                  onPressed: () {
                    try {
                      final job = Job(
                          title: titleController.text.trim(),
                          description: descriptionController.text.trim(),
                          type: type!,
                          address: addressController.text.trim(),
                          salary: double.parse(salaryController.text.trim()),
                          requirements:
                              experienceRequiredController.text.trim());
                      context.read<CreateJobCubit>().createJob(job);
                      context.showTextSnackBar(message: 'Job created');
                      context.pop();
                    } catch (e) {
                      log(e.toString());
                      context.showTextSnackBar(
                          message: 'Fill details properly');
                    }
                  },
                  child: const Text('Create'))
            ],
          ),
        ),
      ),
    );
  }
}
