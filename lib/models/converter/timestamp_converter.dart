import 'package:cloud_firestore/cloud_firestore.dart';

/// Converts DateTime to Timestamp for serialization of Firestore object
Timestamp dateTimeToJson(DateTime? dateTime) =>
    Timestamp.fromDate(dateTime ?? DateTime(2021));

/// Converts Timestamp to DateTime for serialization of Firestore object
DateTime dateTimeFromJson(Timestamp? timestamp) =>
    timestamp?.toDate() ?? DateTime(2021);
