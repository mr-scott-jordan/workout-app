import 'features/high_intensity_interval/domain/entities/exercise.dart';
import 'features/high_intensity_interval/domain/enums/equipment.dart';
import 'features/high_intensity_interval/domain/enums/tag.dart';

final EXERCISES_DATA = [
  Exercise(
    id: 'e1',
    title: 'Standard Push-up',
    tags: [Tag.Push],
    equipment: Equipment.None,
    asset: 'assets/gifs/Pushup.gif',
  ),
  Exercise(
    id: 'e2',
    title: 'Squat',
    tags: [Tag.Legs],
    equipment: Equipment.None,
    asset: 'assets/gifs/Squat.jpg',
  ),
  Exercise(
    id: 'e3',
    title: 'Burpee',
    tags: [Tag.FullBody],
    equipment: Equipment.None,
    asset: 'assets/gifs/Burpees.gif',
  ),
  Exercise(
    id: 'e4',
    title: 'Jumping Jack',
    tags: [Tag.FullBody],
    equipment: Equipment.None,
    asset: 'assets/gifs/Jumping_Jacks.gif',
  ),
  Exercise(
    id: 'e5',
    title: 'Pull-up',
    tags: [Tag.Pull],
    equipment: Equipment.PullUpBar,
    asset: '',
  ),
  Exercise(
    id: 'e6',
    title: 'Sit-up',
    tags: [Tag.Core],
    equipment: Equipment.YogaMat,
    asset: 'assets/gifs/Sit_Up.gif',
  ),
  Exercise(
    id: 'e7',
    title: 'Russian Twist',
    tags: [Tag.Core],
    equipment: Equipment.YogaMat,
    asset: 'assets/gifs/Russian_Twist.gif',
  ),
  Exercise(
    id: 'e8',
    title: 'Pike Push-up',
    tags: [Tag.Push],
    equipment: Equipment.None,
    asset: 'assets/gifs/Pike_Push_Up.gif',
  ),
  Exercise(
    id: 'e9',
    title: 'Forward Lunge',
    tags: [Tag.Legs],
    equipment: Equipment.None,
    asset: '',
  ),
  Exercise(
    id: 'e10',
    title: 'Inverted Row',
    tags: [Tag.Pull],
    equipment: Equipment.None,
    asset: '',
  ),
  Exercise(
    id: 'e11',
    title: 'Wide Push-up',
    tags: [Tag.Push],
    equipment: Equipment.None,
    asset: '',
  ),
  Exercise(
    id: 'e12',
    title: 'Diamond Push-up',
    tags: [Tag.Push],
    equipment: Equipment.None,
    asset: '',
  ),
  Exercise(
    id: 'e13',
    title: 'Hindu Push-up',
    tags: [Tag.Push],
    equipment: Equipment.None,
    asset: 'assets/gifs/Hindu_Push_Up.gif',
  ),
  Exercise(
    id: 'e14',
    title: 'Dive Bomber Push-up',
    tags: [Tag.Push],
    equipment: Equipment.None,
    asset: '',
  ),
  Exercise(
    id: 'e15',
    title: 'Spiderman Push-up',
    tags: [Tag.Push],
    equipment: Equipment.None,
    asset: 'assets/gifs/Spiderman_Pushup.gif',
  ),
  Exercise(
    id: 'e16',
    title: 'Plank Push-up',
    tags: [Tag.Push],
    equipment: Equipment.None,
    asset: '',
  ),
  Exercise(
    id: 'e17',
    title: 'Planche Push-up',
    tags: [Tag.Push],
    equipment: Equipment.None,
    asset: '',
  ),
  Exercise(
    id: 'e18',
    title: 'Pseudo Planche Push-up',
    tags: [Tag.Push],
    equipment: Equipment.None,
    asset: '',
  ),
  Exercise(
    id: 'e19',
    title: 'Staggered Push-up',
    tags: [Tag.Push],
    equipment: Equipment.None,
    asset: 'assets/gifs/Staggard_Arm_Pushup.gif',
  ),
  Exercise(
    id: 'e20',
    title: 'Close Grip Push-up',
    tags: [Tag.Push],
    equipment: Equipment.None,
    asset: '',
  ),
  Exercise(
    id: 'e21',
    title: 'Reverse Hands Push-up',
    tags: [Tag.Push],
    equipment: Equipment.None,
    asset: '',
  ),
  Exercise(
    id: 'e22',
    title: 'Clapping Push-up',
    tags: [Tag.Push],
    equipment: Equipment.None,
    asset: '',
  ),
  Exercise(
    id: 'e23',
    title: 'Raised Leg Push-up',
    tags: [Tag.Push, Tag.Legs],
    equipment: Equipment.None,
    asset: '',
  ),
  Exercise(
    id: 'e24',
    title: 'Decline Push-up',
    tags: [Tag.Push],
    equipment: Equipment.PlyometricBox,
    asset: 'assets/gifs/Decline_Pushup.gif',
  ),
  Exercise(
    id: 'e25',
    title: 'Incline Push-up',
    tags: [Tag.Push],
    equipment: Equipment.PlyometricBox,
    asset: '',
  ),
  Exercise(
    id: 'e26',
    title: 'Power Push-up',
    tags: [Tag.Push],
    equipment: Equipment.None,
    asset: '',
  ),
  Exercise(
    id: 'e27',
    title: 'Hindu Squat',
    tags: [Tag.Legs],
    equipment: Equipment.None,
    asset: '',
  ),
  Exercise(
    id: 'e28',
    title: 'Side-to-side Lunge',
    tags: [Tag.Legs],
    equipment: Equipment.None,
    asset: 'assets/gifs/Side_Lunge.gif',
  ),
  Exercise(
    id: 'e29',
    title: 'Calf Raise',
    tags: [Tag.Legs],
    equipment: Equipment.None,
    asset: 'assets/gifs/Calf_Raise.gif',
  ),
  Exercise(
    id: 'e30',
    title: 'Jump Squat',
    tags: [Tag.Legs],
    equipment: Equipment.None,
    asset: 'assets/gifs/Jump_Squat.gif',
  ),
  Exercise(
    id: 'e31',
    title: 'Reverse Lunge',
    tags: [Tag.Legs],
    equipment: Equipment.None,
    asset: '',
  ),
  Exercise(
    id: 'e32',
    title: 'Duck Walk',
    tags: [Tag.Legs],
    equipment: Equipment.None,
    asset: '',
  ),
  Exercise(
    id: 'e33',
    title: 'Pistol Squat',
    tags: [Tag.Legs],
    equipment: Equipment.None,
    asset: 'assets/gifs/Pistol_Squat.gif',
  ),
  Exercise(
    id: 'e34',
    title: 'Box Squat',
    tags: [Tag.Legs],
    equipment: Equipment.PlyometricBox,
    asset: '',
  ),
  Exercise(
    id: 'e35',
    title: 'Step Up',
    tags: [Tag.Legs],
    equipment: Equipment.PlyometricBox,
    asset: 'assets/gifs/Step_Up.gif',
  ),
  Exercise(
    id: 'e36',
    title: 'Single Leg Deadlift',
    tags: [Tag.Legs],
    equipment: Equipment.Dumbbell,
    asset: 'assets/gifs/Single_Leg_Deadlift.gif',
  ),
  Exercise(
    id: 'e37',
    title: 'Romanian Deadlift',
    tags: [Tag.Legs],
    equipment: Equipment.Dumbbell,
    asset: 'assets/gifs/Romanian_Deadlift.gif',
  ),
  Exercise(
    id: 'e38',
    title: 'Forward Weighted Lunge',
    tags: [Tag.Legs],
    equipment: Equipment.Dumbbell,
    asset: '',
  ),
  Exercise(
    id: 'e39',
    title: 'Reverse Weighted Lunge',
    tags: [Tag.Legs],
    equipment: Equipment.Dumbbell,
    asset: '',
  ),
  Exercise(
    id: 'e40',
    title: 'Side-to-side Weighted Lunge',
    tags: [Tag.Legs],
    equipment: Equipment.Dumbbell,
    asset: '',
  ),
  Exercise(
    id: 'e41',
    title: 'Split Squat',
    tags: [Tag.Legs],
    equipment: Equipment.PlyometricBox,
    asset: 'assets/gifs/Split_Squat.gif',
  ),
  Exercise(
    id: 'e42',
    title: 'Front Squat',
    tags: [Tag.Legs],
    equipment: Equipment.Dumbbell,
    asset: '',
  ),
  Exercise(
    id: 'e43',
    title: 'Straight Arm Plank',
    tags: [Tag.Core],
    equipment: Equipment.YogaMat,
    asset: 'assets/gifs/Straight_Arm_Plank.png',
  ),
  Exercise(
    id: 'e44',
    title: 'Bridge',
    tags: [Tag.Core],
    equipment: Equipment.YogaMat,
    asset: 'assets/gifs/Bridge.gif',
  ),
  Exercise(
    id: 'e45',
    title: 'Elbow Plank',
    tags: [Tag.Core],
    equipment: Equipment.YogaMat,
    asset: 'assets/gifs/Elbow_Plank.jpg',
  ),
  Exercise(
    id: 'e46',
    title: 'High Knee',
    tags: [Tag.Core],
    equipment: Equipment.None,
    asset: 'assets/gifs/High_Knee.gif',
  ),
  Exercise(
    id: 'e47',
    title: 'Boat Pose',
    tags: [Tag.Core],
    equipment: Equipment.None,
    asset: 'assets/gifs/Boat_Pose.jpg',
  ),
  Exercise(
    id: 'e48',
    title: 'V Plank',
    tags: [Tag.Core],
    equipment: Equipment.None,
    asset: 'assets/gifs/V_Plank.gif',
  ),
  Exercise(
    id: 'e49',
    title: 'Raised Leg Plank',
    tags: [Tag.Core],
    equipment: Equipment.None,
    asset: 'assets/gifs/Raised_Leg_Plank.gif',
  ),
  Exercise(
    id: 'e50',
    title: 'Side Plank',
    tags: [Tag.Core],
    equipment: Equipment.None,
    asset: 'assets/gifs/Side_Plank.jpg',
  ),
  Exercise(
    id: 'e51',
    title: 'Raised Arm Plank',
    tags: [Tag.Core],
    equipment: Equipment.None,
    asset: '',
  ),
  Exercise(
    id: 'e52',
    title: 'Mountain Climber',
    tags: [Tag.Core],
    equipment: Equipment.None,
    asset: 'assets/gifs/Mountain_Climber.gif',
  ),
  Exercise(
    id: 'e53',
    title: 'Scissor Kick',
    tags: [Tag.Core],
    equipment: Equipment.None,
    asset: 'assets/gifs/Scissor_Kick.gif',
  ),
  Exercise(
    id: 'e54',
    title: 'Bicycle Kick',
    tags: [Tag.Core],
    equipment: Equipment.None,
    asset: 'assets/gifs/Bicycle_Kick.png',
  ),
  Exercise(
    id: 'e55',
    title: 'Spiderman Plank',
    tags: [Tag.Core],
    equipment: Equipment.None,
    asset: 'assets/gifs/Spiderman_Plank.gif',
  ),
  //might be wrong name
  Exercise(
    id: 'e56',
    title: 'In And Out',
    tags: [Tag.Core],
    equipment: Equipment.None,
    asset: 'assets/gifs/In_and_Out.gif',
  ),
  Exercise(
    id: 'e57',
    title: 'Crunch',
    tags: [Tag.Core],
    equipment: Equipment.YogaMat,
    asset: 'assets/gifs/Crunches.gif',
  ),
  Exercise(
    id: 'e58',
    title: 'Reverse Crunch',
    tags: [Tag.Core],
    equipment: Equipment.YogaMat,
    asset: 'assets/gifs/Reverse_Crunches.gif',
  ),
  Exercise(
    id: 'e59',
    title: 'L Sit',
    tags: [Tag.Core],
    equipment: Equipment.None,
    asset: '',
  ),
  Exercise(
    id: 'e60',
    title: 'Star Plank',
    tags: [Tag.Core],
    equipment: Equipment.None,
    asset: '',
  ),
  Exercise(
    id: 'e61',
    title: 'Hollow Rock',
    tags: [Tag.Core],
    equipment: Equipment.YogaMat,
    asset: '',
  ),
  Exercise(
    id: 'e62',
    title: 'Leg Raise',
    tags: [Tag.Core],
    equipment: Equipment.YogaMat,
    asset: 'assets/gifs/Leg_Raise.gif',
  ),
  Exercise(
    id: 'e63',
    title: 'Flutter Kick',
    tags: [Tag.Core],
    equipment: Equipment.YogaMat,
    asset: 'assets/gifs/Flutter_Kick.gif',
  ),
  Exercise(
    id: 'e64',
    title: 'Toe Tap',
    tags: [Tag.Core],
    equipment: Equipment.YogaMat,
    asset: '',
  ),
  Exercise(
    id: 'e65',
    title: 'Windshield Wiper',
    tags: [Tag.Core],
    equipment: Equipment.YogaMat,
    asset: 'assets/gifs/Windshield_Wiper.gif',
  ),
  Exercise(
    id: 'e66',
    title: 'Chin-up',
    tags: [Tag.Pull],
    equipment: Equipment.PullUpBar,
    asset: '',
  ),
  Exercise(
    id: 'e67',
    title: 'Row',
    tags: [Tag.Pull],
    equipment: Equipment.Dumbbell,
    asset: 'assets/gifs/Row.gif',
  ),
  Exercise(
    id: 'e68',
    title: 'Shrug',
    tags: [Tag.Pull],
    equipment: Equipment.Dumbbell,
    asset: '',
  ),
  Exercise(
    id: 'e69',
    title: 'Pull-up',
    tags: [Tag.Pull],
    equipment: Equipment.PullUpBar,
    asset: '',
  ),
  Exercise(
    id: 'e70',
    title: 'Deadlift',
    tags: [Tag.Pull],
    equipment: Equipment.Dumbbell,
    asset: '',
  ),
  Exercise(
    id: 'e71',
    title: 'Hammer Curl',
    tags: [Tag.Pull],
    equipment: Equipment.Dumbbell,
    asset: 'assets/gifs/Hammer_Curl.gif',
  ),
  Exercise(
    id: 'e72',
    title: 'Typewriter Pull-up',
    tags: [Tag.Pull],
    equipment: Equipment.PullUpBar,
    asset: '',
  ),
  Exercise(
    id: 'e73',
    title: 'Cactus Hold',
    tags: [Tag.Pull],
    equipment: Equipment.None,
    asset: '',
  ),
  Exercise(
    id: 'e74',
    title: 'Good Morning',
    tags: [Tag.Pull],
    equipment: Equipment.None,
    asset: 'assets/gifs/Good_Morning.gif',
  ),
  Exercise(
    id: 'e75',
    title: 'Cat Cow',
    tags: [Tag.Pull],
    equipment: Equipment.None,
    asset: 'assets/gifs/Cat_Cow.gif',
  ),
  Exercise(
    id: 'e76',
    title: 'Superman',
    tags: [Tag.Pull],
    equipment: Equipment.None,
    asset: 'assets/gifs/Superman.gif',
  ),
  Exercise(
    id: 'e77',
    title: 'Back Rotation',
    tags: [Tag.Pull],
    equipment: Equipment.None,
    asset: '',
  ),
  Exercise(
    id: 'e78',
    title: 'Close Grip Pull-up',
    tags: [Tag.Pull],
    equipment: Equipment.PullUpBar,
    asset: '',
  ),
  Exercise(
    id: 'e79',
    title: 'Wide Grip Pull-up',
    tags: [Tag.Pull],
    equipment: Equipment.PullUpBar,
    asset: '',
  ),
  Exercise(
    id: 'e80',
    title: 'Preacher Curl',
    tags: [Tag.Pull],
    equipment: Equipment.Dumbbell,
    asset: 'assets/gifs/Preacher_Curl.gif',
  ),
  Exercise(
    id: 'e81',
    title: 'Dumbell Swing',
    tags: [Tag.Pull],
    equipment: Equipment.Dumbbell,
    asset: 'assets/gifs/Dumbell_Swing.gif',
  ),
  Exercise(
    id: 'e82',
    title: 'Push-up With Rotation',
    tags: [Tag.Push],
    equipment: Equipment.None,
    asset: '',
  ),
  Exercise(
    id: 'e83',
    title: 'Shoulder Tap',
    tags: [Tag.Push],
    equipment: Equipment.None,
    asset: '',
  ),
  Exercise(
    id: 'e84',
    title: 'Pull-up Burpee',
    tags: [Tag.FullBody],
    equipment: Equipment.PullUpBar,
    asset: '',
  ),
  Exercise(
    id: 'e85',
    title: 'Squat Jack',
    tags: [Tag.FullBody],
    equipment: Equipment.None,
    asset: 'assets/gifs/Squat_Jack.gif',
  ),
  Exercise(
    id: 'e86',
    title: 'Low Jack',
    tags: [Tag.FullBody],
    equipment: Equipment.None,
    asset: '',
  ),
  Exercise(
    id: 'e87',
    title: 'Jumping Lunge',
    tags: [Tag.FullBody],
    equipment: Equipment.None,
    asset: 'assets/gifs/Jumping_Lunge.gif',
  ),
  Exercise(
    id: 'e88',
    title: 'Plyo Jack',
    tags: [Tag.FullBody],
    equipment: Equipment.None,
    asset: '',
  ),
  Exercise(
    id: 'e89',
    title: 'Plyo Inch Worm',
    tags: [Tag.FullBody],
    equipment: Equipment.None,
    asset: '',
  ),
  Exercise(
    id: 'e90',
    title: 'Inch Worm',
    tags: [Tag.FullBody],
    equipment: Equipment.None,
    asset: 'assets/gifs/Inch_Worm.gif',
  ),
  Exercise(
    id: 'e91',
    title: 'Ten Count',
    tags: [Tag.FullBody],
    equipment: Equipment.None,
    asset: '',
  ),
  Exercise(
    id: 'e92',
    title: 'Side-to-side Squat Jump',
    tags: [Tag.FullBody],
    equipment: Equipment.None,
    asset: 'assets/gifs/Pushup.gif',
  ),
  Exercise(
    id: 'e93',
    title: 'Step Back Burpee',
    tags: [Tag.FullBody],
    equipment: Equipment.None,
    asset: '',
  ),
  Exercise(
    id: 'e94',
    title: 'Dead Man Burpee',
    tags: [Tag.FullBody],
    equipment: Equipment.None,
    asset: '',
  ),
  Exercise(
    id: 'e95',
    title: 'Single Arm Burpee',
    tags: [Tag.FullBody],
    equipment: Equipment.None,
    asset: '',
  ),
  Exercise(
    id: 'e96',
    title: 'Spider Man Burpee',
    tags: [Tag.FullBody],
    equipment: Equipment.None,
    asset: '',
  ),
  Exercise(
    id: 'e97',
    title: 'T Burpee',
    tags: [Tag.FullBody],
    equipment: Equipment.None,
    asset: '',
  ),
  Exercise(
    id: 'e98',
    title: 'Knee Tuck Burpee',
    tags: [Tag.FullBody],
    equipment: Equipment.None,
    asset: '',
  ),
  Exercise(
    id: 'e99',
    title: 'Knee Tuck Jumping Jack',
    tags: [Tag.FullBody],
    equipment: Equipment.None,
    asset: '',
  ),
  Exercise(
    id: 'e100',
    title: 'Sprint',
    tags: [Tag.FullBody],
    equipment: Equipment.None,
    asset: 'assets/gifs/Sprint.gif',
  ),
  Exercise(
    id: 'e101',
    title: 'Butt Kicker',
    tags: [Tag.FullBody],
    equipment: Equipment.None,
    asset: 'assets/gifs/Butt_Kicker.gif',
  ),
  Exercise(
    id: 'e102',
    title: 'Vertical Mountain Climber',
    tags: [Tag.FullBody],
    equipment: Equipment.None,
    asset: 'assets/gifs/Vertical_Mountain_Climber.gif',
  ),
  Exercise(
    id: 'e103',
    title: 'Heisman',
    tags: [Tag.FullBody],
    equipment: Equipment.None,
    asset: 'assets/gifs/Heisman.gif',
  ),
  Exercise(
    id: 'e104',
    title: 'Plank Jack',
    tags: [Tag.FullBody],
    equipment: Equipment.None,
    asset: 'assets/gifs/Plank_Jack.gif',
  ),
  Exercise(
    id: 'e105',
    title: 'Inverted Row',
    tags: [Tag.Pull],
    equipment: Equipment.PullUpBar,
    asset: '',
  ),
  // Exercise(
  //   id: '',
  //   title: '',
  //   tags: [Tag.],
  //   equipment: Equipment.,
  //   asset: 'assets/gifs/Pushup.gif',
  // ),
];
