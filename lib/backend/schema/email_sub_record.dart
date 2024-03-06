import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class EmailSubRecord extends FirestoreRecord {
  EmailSubRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email_id" field.
  String? _emailId;
  String get emailId => _emailId ?? '';
  bool hasEmailId() => _emailId != null;

  void _initializeFields() {
    _emailId = snapshotData['email_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('email_sub');

  static Stream<EmailSubRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EmailSubRecord.fromSnapshot(s));

  static Future<EmailSubRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EmailSubRecord.fromSnapshot(s));

  static EmailSubRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EmailSubRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EmailSubRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EmailSubRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EmailSubRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EmailSubRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEmailSubRecordData({
  String? emailId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email_id': emailId,
    }.withoutNulls,
  );

  return firestoreData;
}

class EmailSubRecordDocumentEquality implements Equality<EmailSubRecord> {
  const EmailSubRecordDocumentEquality();

  @override
  bool equals(EmailSubRecord? e1, EmailSubRecord? e2) {
    return e1?.emailId == e2?.emailId;
  }

  @override
  int hash(EmailSubRecord? e) => const ListEquality().hash([e?.emailId]);

  @override
  bool isValidKey(Object? o) => o is EmailSubRecord;
}
