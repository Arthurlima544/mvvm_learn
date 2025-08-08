import '../../../domain/models/destination/destination.dart';
import '../../../utils/result.dart';

abstract class DestinationRepository {
  Future<Result<List<Destination>>> getDestinations();
}
