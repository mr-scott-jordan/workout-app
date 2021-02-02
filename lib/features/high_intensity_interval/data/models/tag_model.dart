import '../../domain/enums/tag.dart';

const _kMap = {
  'fullbody': Tag.FullBody,
  'pull': Tag.Pull,
  'push': Tag.Push,
  'core': Tag.Core,
  'legs': Tag.Legs,
};

List<Tag> fromList(List<String> strings) {
  return strings.map((str) => _kMap[str]).toList();
}

List<String> toList(List<Tag> tags) {
  return tags
      .map((tag) => _kMap.keys.firstWhere(
            (k) => _kMap[k] == tag,
            orElse: () => '',
          ))
      .toList();
}
