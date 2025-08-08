import 'package:mvvm_learn/data/repositories/destination/destination_repository.dart';
import 'package:mvvm_learn/data/services/api/api_client.dart';
import 'package:mvvm_learn/domain/models/destination/destination.dart';
import 'package:mvvm_learn/utils/result.dart';

class DestinationRepositoryRemote implements DestinationRepository {
  DestinationRepositoryRemote({required ApiClient apiClient})
    : _apiClient = apiClient;

  final ApiClient _apiClient;

  // List<Destination>? _cachedData;

  @override
  Future<Result<List<Destination>>> getDestinations() async {
    final result = await _apiClient.getDestinations();

    return result;
  }
}
