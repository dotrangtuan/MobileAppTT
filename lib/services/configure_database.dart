import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

final firebaseApp = Firebase.app();
final rtdb = FirebaseDatabase.instanceFor(app: firebaseApp, databaseURL: 'https://app-auth-13371-default-rtdb.firebaseio.com/');


void sendData(String state, String tag) async {
  DatabaseReference ref = FirebaseDatabase.instance.ref("appchongtrom");

  await ref.set({
    tag : state
  });
}

void getData() async {
  DatabaseReference starCountRef =
  FirebaseDatabase.instance.ref('meetingId');
  starCountRef.onValue.listen((DatabaseEvent event) {
    final data = event.snapshot.value;
    print(data);
  });
}
