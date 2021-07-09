enum StorageMethod {
  roomTemperature,
  refrigerate,
  freeze,
}

extension StorageMethodExtension on StorageMethod {
  String get tag {
    switch (this) {
      case StorageMethod.roomTemperature:
        return 'roomTemperature';
      case StorageMethod.refrigerate:
        return 'refrigerate';
      case StorageMethod.freeze:
        return 'freeze';
    }
  }

  String get label {
    switch (this) {
      case StorageMethod.roomTemperature:
        return '실온';
      case StorageMethod.refrigerate:
        return '냉장고';
      case StorageMethod.freeze:
        return '냉동실';
    }
  }
}
