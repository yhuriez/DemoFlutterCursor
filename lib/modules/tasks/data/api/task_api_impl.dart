import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_flutter_cursor/modules/tasks/data/api/dto/task_dto.dart';
import 'package:demo_flutter_cursor/modules/tasks/data/api/task_api.dart';

class TaskApiImpl implements TaskApi {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<List<TaskDTO>> getTasks() {
    return _firestore
        .collection('tasks')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            return TaskDTO.fromJson(doc.id, doc.data());
          }).toList();
        });
  }

  @override
  Future<TaskDTO> createTask(String title) async {
    final taskData = {
      'title': title,
      'isCompleted': false,
      'createdAt': FieldValue.serverTimestamp(),
      'completedAt': null,
    };

    final docRef = await _firestore.collection('tasks').add(taskData);
    final docSnapshot = await docRef.get();

    return TaskDTO.fromJson(docRef.id, docSnapshot.data() ?? {});
  }

  @override
  Future<void> updateTask(TaskDTO task) async {
    await _firestore.collection('tasks').doc(task.id).update({
      'title': task.title,
      'isCompleted': task.isCompleted,
      'completedAt': task.completedAt,
    });
  }

  @override
  Future<void> deleteTask(String taskId) async {
    await _firestore.collection('tasks').doc(taskId).delete();
  }
}
