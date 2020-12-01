import 'enums/equipment.dart';
import 'model/exercise.dart';

const EXERCISES_DATA = const [
  Exercise(
    id: 'e1',
    title: 'Pushups',
    tags: ['push'],
    equipment: Equipment.None,
  ),
  Exercise(
    id: 'e2',
    title: 'Squats',
    tags: ['legs'],
    equipment: Equipment.None,
  ),
  Exercise(
    id: 'e3',
    title: 'Burpees',
    tags: ['fullbody'],
    equipment: Equipment.None,
  ),
  Exercise(
    id: 'e4',
    title: 'Jumping Jacks',
    tags: ['fullbody'],
    equipment: Equipment.None,
  ),
  Exercise(
    id: 'e5',
    title: 'Pullups',
    tags: ['pull'],
    equipment: Equipment.PullUpBar,
  ),
  Exercise(
    id: 'e6',
    title: 'Situps',
    tags: ['core'],
    equipment: Equipment.YogaMat,
  ),
  Exercise(
    id: 'e7',
    title: 'Russian Twists',
    tags: ['core'],
    equipment: Equipment.YogaMat,
  ),
  Exercise(
    id: 'e8',
    title: 'Pike Pushups',
    tags: ['push'],
    equipment: Equipment.None,
  ),
  Exercise(
    id: 'e9',
    title: 'Lunges',
    tags: ['legs'],
    equipment: Equipment.None,
  ),
  Exercise(
    id: 'e10',
    title: 'Inverted Rows',
    tags: ['pull'],
    equipment: Equipment.None,
  ),
];
