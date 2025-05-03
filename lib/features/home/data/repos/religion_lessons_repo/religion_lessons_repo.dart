import 'package:dartz/dartz.dart';

import '../../../../../core/utils/errors/failure.dart';
import '../../models/religion_lessons.dart';

abstract class ReligionLessonsRepo {
  Future<Either<Failure, List<VideoItem>>> fetchLessonsList();
}
