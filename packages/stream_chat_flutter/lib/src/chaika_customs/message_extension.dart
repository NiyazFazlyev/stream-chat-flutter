import 'package:stream_chat_flutter/stream_chat_flutter.dart';

///Message extesion
extension MessageX on Message {
  /// Message edited DateTime in UTC,
  /// if message didn't edited return null
  DateTime? get editedAt {
    final _editedAt = extraData['edited_at'];
    if (_editedAt is String) {
      return DateTime.tryParse(_editedAt)?.toUtc();
    }
    return null;
  }

  /// Checking if the message is edited
  bool get isEdited => editedAt != null;

  /// Add message edited time
  void addEditedTime(DateTime dateTime) {
    extraData.addAll({'edited_at': dateTime.toUtc().toIso8601String()});
  }
}
