import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_work/src/core/models/job.dart';

class JobService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collection = 'jobs';

  Future<bool> createJob(Job job) async {
    try {
      _firestore.collection(_collection).doc().set(job.toJson());
      return true;
    } catch (e) {
      e as FirebaseException;
      throw Exception(e.message);
    }
  }

  Future<List<Job>> getJobs() async {
    final query = await _firestore.collection(_collection).get();
    final docs = query.docs;
    final jobs = docs.map((doc) => Job.fromJson(doc.data())).toList();
    return jobs;
  }
}
