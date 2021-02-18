import 'features/high_intensity_interval/domain/entities/exercise.dart';
import 'features/high_intensity_interval/domain/enums/equipment.dart';
import 'features/high_intensity_interval/domain/enums/tag.dart';

final EXERCISES_DATA = [
  Exercise(
    id: 'e1',
    title: 'Pushup',
    tags: [Tag.Push],
    equipment: Equipment.None,
  ),
  Exercise(
    id: 'e2',
    title: 'Squat',
    tags: [Tag.Legs],
    equipment: Equipment.None,
  ),
  Exercise(
    id: 'e3',
    title: 'Burpee',
    tags: [Tag.FullBody],
    equipment: Equipment.None,
  ),
  Exercise(
    id: 'e4',
    title: 'Jumping Jack',
    tags: [Tag.FullBody],
    equipment: Equipment.None,
  ),
  Exercise(
    id: 'e5',
    title: 'Pullup',
    tags: [Tag.Pull],
    equipment: Equipment.PullUpBar,
  ),
  Exercise(
    id: 'e6',
    title: 'Situp',
    tags: [Tag.Core],
    equipment: Equipment.YogaMat,
  ),
  Exercise(
    id: 'e7',
    title: 'Russian Twist',
    tags: [Tag.Core],
    equipment: Equipment.YogaMat,
  ),
  Exercise(
    id: 'e8',
    title: 'Pike Pushup',
    tags: [Tag.Push],
    equipment: Equipment.None,
  ),
  Exercise(
    id: 'e9',
    title: 'Lunge',
    tags: [Tag.Legs],
    equipment: Equipment.None,
  ),
  Exercise(
    id: 'e10',
    title: 'Inverted Row',
    tags: [Tag.Pull],
    equipment: Equipment.None,
  ),
];
