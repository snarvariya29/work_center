class Job {
  final String title;
  final String description;
  final String type; // e.g., full-time, part-time
  final String address;
  final double salary;
  final String requirements;

  Job({
    required this.title,
    required this.description,
    required this.type,
    required this.address,
    required this.salary,
    required this.requirements,
  });

  // Method to convert Job object to Map (for JSON serialization)
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'type': type,
      'address': address,
      'salary': salary,
      'requirements': requirements,
    };
  }

  // Method to create a Job object from Map (for JSON deserialization)
  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      title: json['title'],
      description: json['description'],
      type: json['type'],
      address: json['address'],
      salary: json['salary'],
      requirements: json['requirements'],
    );
  }
}
