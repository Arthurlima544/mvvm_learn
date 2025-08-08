import '../../../domain/models/activity/activity.dart';
import '../../../utils/result.dart';

abstract class ActivityRepository {
  Future<Result<List<Activity>>> getByDestination(String ref);
}
