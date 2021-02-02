import 'package:workout_app/features/high_intensity_interval/domain/enums/equipment.dart';

const _kMap = {
  'none': Equipment.PullUpBar,
  'pullupbar': Equipment.PullUpBar,
  'yogamat': Equipment.YogaMat,
};

List<Equipment> fromList(List<String> strings) {
  return strings.map((str) => _kMap[str]).toList();
}

List<String> toList(List<Equipment> equipment) {
  return equipment
      .map((e) => _kMap.keys.firstWhere(
            (k) => _kMap[k] == e,
            orElse: () => '',
          ))
      .toList();
}

Equipment fromString(String string) {
  return _kMap[string];
}
