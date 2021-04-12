import '../../domain/enums/equipment.dart';

const _kMap = {
  'none': Equipment.None,
  'pullupbar': Equipment.PullUpBar,
  'yogamat': Equipment.YogaMat,
  'plyobox': Equipment.PlyometricBox,
  'dumbbell': Equipment.Dumbbell,
};

List<Equipment> fromList(List<dynamic> strings) {
  return strings.map((str) => fromString(str)).toList();
}

List<String> toList(List<Equipment> equipment) {
  return equipment
      .map((e) => _kMap.keys.firstWhere(
            (k) => _kMap[k] == e,
            orElse: () => '',
          ))
      .toList();
}

String toString(Equipment equipment) {
  return _kMap.keys.firstWhere(
    (k) => _kMap[k] == equipment,
    orElse: () => '',
  );
}

Equipment fromString(String string) {
  return _kMap[string];
}
