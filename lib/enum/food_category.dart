enum FoodCategory {
  ROOM_TEMPERATURE,
  FRIDGE,
  FREEZER,
}

extension CategoryExtension on FoodCategory {
  String get value {
    switch (this) {
      case FoodCategory.ROOM_TEMPERATURE:
        return 'ROOM_TEMPERATURE';
      case FoodCategory.FRIDGE:
        return 'FRIDGE';
      case FoodCategory.FREEZER:
        return 'FREEZER';
    }
  }
}
