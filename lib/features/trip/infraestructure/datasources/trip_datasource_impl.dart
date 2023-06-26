import 'package:dio/dio.dart';
import 'package:galapagos_trip_app/config/constants/environment.dart';
import 'package:galapagos_trip_app/features/trip/domain/entities/booking.dart';
import 'package:galapagos_trip_app/features/trip/infraestructure/infraestructura.dart';
import 'package:galapagos_trip_app/features/trip/infraestructure/mappers/boat_mapper.dart';
import 'package:galapagos_trip_app/features/trip/infraestructure/mappers/booking_mapper.dart';
import '../../domain/domaint.dart';

class TripDataSourceImpl implements TripDataSource {
  final dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));

  @override
  Future<Boat> findBoat(String codeBoat, String token) async {
    dio.options.headers["Authorization"] = token;
    final response = await dio.post('${Environment.apiBoat}/$codeBoat');
    Boat boat = BoatMapper.boatJsonToEntity(response.data[0]);
    return boat;
  }

  @override
  Future<Booking> findBooking(String codeVoucher, String token) async {
    try {
      dio.options.headers["Authorization"] = token;
      final response = await dio.post('${Environment.apiBooking}/$codeVoucher');
      Booking booking = BookingMapper.bookingJsonToEntity(response.data);
      return booking;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw CustomError(e.response?.data['message'] ?? 'Invalid Credentials');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomError('Check internet connection');
      }
      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<String> findFleet() {
    // TODO: implement findFleet
    throw UnimplementedError();
  }

  @override
  Future<Token> findToken() async {
    try {
      var apiToken = Environment.apiToken;
      var response = await dio.post(apiToken);
      Token token = TokenMapper.tokenJsonToEntity(response.data);
      return token;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw CustomError(e.response?.data['message'] ?? 'Invalid Credentials');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomError('Check internet connection');
      }
      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }
}
