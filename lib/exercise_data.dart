import 'enums/equipment.dart';
import 'features/high_intensity_interval/domain/entities/exercise.dart';

final EXERCISES_DATA = [
  Exercise(
    id: 'e1',
    title: 'Pushup',
    tags: ['push'],
    equipment: Equipment.None,
  ),
  Exercise(
    id: 'e2',
    title: 'Squat',
    tags: ['legs'],
    equipment: Equipment.None,
  ),
  Exercise(
    id: 'e3',
    title: 'Burpee',
    tags: ['fullbody'],
    equipment: Equipment.None,
  ),
  Exercise(
    id: 'e4',
    title: 'Jumping Jack',
    tags: ['fullbody'],
    equipment: Equipment.None,
  ),
  Exercise(
    id: 'e5',
    title: 'Pullup',
    tags: ['pull'],
    equipment: Equipment.PullUpBar,
  ),
  Exercise(
    id: 'e6',
    title: 'Situp',
    tags: ['core'],
    equipment: Equipment.YogaMat,
  ),
  Exercise(
    id: 'e7',
    title: 'Russian Twist',
    tags: ['core'],
    equipment: Equipment.YogaMat,
  ),
  Exercise(
    id: 'e8',
    title: 'Pike Pushup',
    tags: ['push'],
    equipment: Equipment.None,
  ),
  Exercise(
    id: 'e9',
    title: 'Lunge',
    tags: ['legs'],
    equipment: Equipment.None,
  ),
  Exercise(
    id: 'e10',
    title: 'Inverted Row',
    tags: ['pull'],
    equipment: Equipment.None,
  ),
];
