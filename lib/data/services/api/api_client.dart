import 'dart:convert';
import 'dart:io';

import 'package:mvvm_learn/data/services/api/model/booking/booking_api_model.dart';
import 'package:mvvm_learn/domain/models/activity/activity.dart';
import 'package:mvvm_learn/utils/result.dart';

import '../../../domain/models/destination/destination.dart';

typedef AuthHeaderProvider = String? Function();

class ApiClient {
  ApiClient({String? host, int? port, HttpClient Function()? clientFactory})
    : _host = host ?? 'localhost',
      _port = port ?? 8080,
      _clientFactory = clientFactory ?? HttpClient.new;

  final String _host;
  final int _port;
  final HttpClient Function() _clientFactory;

  AuthHeaderProvider? _authHeaderProvider;

  set authHeaderProvider(AuthHeaderProvider authHeaderProvider) {
    _authHeaderProvider = authHeaderProvider;
  }

  Future<void> _authHeader(HttpHeaders headers) async {
    final header = _authHeaderProvider?.call();
    if (header != null) {
      headers.add(HttpHeaders.authorizationHeader, header);
    }
  }

  Future<Result<BookingApiModel>> postBooking(BookingApiModel booking) async {
    final client = _clientFactory();

    try {
      final request = await client.post(_host, _port, '/booking');
      await _authHeader(request.headers);
      request.write(jsonEncode(booking));
      final response = await request.close();
      if (response.statusCode == 201) {
        final stringData = await response.transform(utf8.decoder).join();
        final booking = BookingApiModel.fromJson(jsonDecode(stringData));
        return Result.ok(booking);
      } else {
        return const Result.error(HttpException("Invalid response"));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<Result<List<Destination>>> getDestinations() async {
    final client = _clientFactory();
    try {
      final request = await client.get(_host, _port, '/destination');
      await _authHeader(request.headers);
      final response = await request.close();
      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final json = jsonDecode(stringData) as List<dynamic>;
        return Result.ok(
          json.map((element) => Destination.fromJson(element)).toList(),
        );
      } else {
        return const Result.error(HttpException("Invalid response"));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<Result<List<Activity>>> getActivityByDestination(String ref) async {
    final client = _clientFactory();
    try {
      final request = await client.get(
        _host,
        _port,
        '/destination/$ref/activity',
      );
      await _authHeader(request.headers);
      final response = await request.close();
      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final json = jsonDecode(stringData) as List<dynamic>;
        final activities = json
            .map((element) => Activity.fromJson(element))
            .toList();
        return Result.ok(activities);
      } else {
        return Result.error(HttpException("Invalid response"));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      client.close();
    }
  }

  Future<Result<List<BookingApiModel>>> getBookings() async {
    final client = _clientFactory();

    try {
      final request = await client.get(_host, _port, '/booking');
      await _authHeader(request.headers);
      final response = await request.close();
      if (response.statusCode == 200) {
        final stringData = await response.transform(utf8.decoder).join();
        final json = jsonDecode(stringData) as List<dynamic>;
        final bookings = json
            .map((element) => BookingApiModel.fromJson(element))
            .toList();
        return Result.ok(bookings);
      } else {
        return Result.error(HttpException("Invalid response"));
      }
    } on Exception catch (e) {
      return Result.error(e);
    } finally {
      client.close();
    }
  }
}
