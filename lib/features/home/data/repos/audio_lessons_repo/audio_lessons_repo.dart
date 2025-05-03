



import 'package:dartz/dartz.dart';

import '../../../../../core/utils/errors/failure.dart';
import '../../models/audio_lessons.dart';

abstract class AudioLessonsRepo {
  Future<Either<Failure, List<AudioItem>>> fetchLessonsList();
}