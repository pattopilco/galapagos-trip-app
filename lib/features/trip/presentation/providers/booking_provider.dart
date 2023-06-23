import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galapagos_trip_app/config/constants/encoder.dart';
import 'package:galapagos_trip_app/features/trip/domain/entities/booking.dart';
import 'package:galapagos_trip_app/features/trip/infraestructure/infraestructura.dart';
import 'package:galapagos_trip_app/infraestructure/services/util_file_services.dart';
import '../../domain/domaint.dart';

//Provider

final bookingProvider =
    StateNotifierProvider<BookingNotifier, BookingState>((ref) {
  final tripRepository = TripRepositoryImpl();
  final boat = Boat(
      code: 0,
      name: '',
      category: 0,
      categoryII: '',
      type: '',
      passengers: 0,
      year: 0,
      length: '',
      beam: '',
      draft: '',
      speed: '',
      description: '',
      image: '',
      minimumAgeChild: 0,
      maximumAgeChild: 0,
      itineraryTypes: [],
      keyFeatures: [],
      images: [],
      logo: '',
      webLink: '',
      imagesBoat: []);
  return BookingNotifier(boat: boat, tripRepository: tripRepository);
});

//Notifier o Controller

class BookingNotifier extends StateNotifier<BookingState> {
  final TripRepository tripRepository;
  final Boat boat;
  BookingNotifier({required this.boat, required this.tripRepository})
      : super(BookingState(boat: boat));

  Future<void> findBooking(String encodeCodeVoucher) async {
    _deleteFileStorage(boat);
    try {
      final decodeCodeVoucher = Encoder.getStringDecode(encodeCodeVoucher);
      Token token = await tripRepository.findToken();
      final password = token.token;
      final basicAuth =
          'Basic ${base64Encode(utf8.encode('galavail:$password'))}';
      Booking booking =
          await tripRepository.findBooking(decodeCodeVoucher, basicAuth);
      final String codeBoat = booking.codeBoat.toString();
      Boat boat = await tripRepository.findBoat(codeBoat, basicAuth);
      _setLoggedTrip(booking, boat);
    } on CustomError catch (e) {
      logout(e.message);
    } catch (e) {
      logout('Unhandled error');
    }
  }

  Future<void> logout([String? errorMessage]) async {
    //TODO: LIMPIAR TOKEN
    state = state.copyWith(
      bookingStatus: BookingStatus.notAuthenticated,
      codeBoatDecode: null,
      boat: getBlankBoat(),
      errorMessage: errorMessage,
    );
  }

  void _setLoggedTrip(Booking booking, Boat boat) {
    UtilFileService.downloadDocument(
        booking.documents[0].url, booking.documents[0].name);
    UtilFileService.downloadDocument(
        booking.documents[1].url, booking.documents[1].name);
    UtilFileService.downloadDocument(
        '${UtilFileService.url_upload_manual_cabina}${boat.name}.pdf',
        '${boat.name}.pdf');
    state = state.copyWith(
        codeBoatDecode: booking.codeVoucherEncrypted,
        bookingStatus: BookingStatus.authenticated,
        boat: boat,
        nameBoat: boat.name);
    print('Booking: $state');
  }

  void _deleteFileStorage(Boat boat) {
    UtilFileService.deleteFile('itinerary.pdf');
    UtilFileService.deleteFile('voucher.pdf');
    UtilFileService.deleteFile('${boat.name}.pdf');
  }

  Boat getBlankBoat() {
    return Boat(
        code: 0,
        name: '',
        category: 0,
        categoryII: '',
        type: '',
        passengers: 0,
        year: 0,
        length: '',
        beam: '',
        draft: '',
        speed: '',
        description: '',
        image: '',
        minimumAgeChild: 0,
        maximumAgeChild: 0,
        itineraryTypes: [],
        keyFeatures: [],
        images: [],
        logo: '',
        webLink: '',
        imagesBoat: []);
  }
}

// Estado Booking

enum BookingStatus { checking, authenticated, notAuthenticated }

class BookingState {
  final BookingStatus bookingStatus;
  final String codeBoatDecode;
  final String nameBoat;
  final Boat boat;
  final String errorMessage;

  BookingState(
      {this.bookingStatus = BookingStatus.checking,
      this.codeBoatDecode = '',
      this.nameBoat = '',
      required this.boat,
      this.errorMessage = ''});

  BookingState copyWith({
    BookingStatus? bookingStatus,
    String? codeBoatDecode,
    String? nameBoat,
    required Boat boat,
    String? errorMessage,
  }) =>
      BookingState(
        bookingStatus: bookingStatus ?? this.bookingStatus,
        codeBoatDecode: codeBoatDecode ?? this.codeBoatDecode,
        nameBoat: nameBoat ?? this.nameBoat,
        boat: boat,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  Boat _getBlankBoat() {
    return Boat(
        code: 0,
        name: '',
        category: 0,
        categoryII: '',
        type: '',
        passengers: 0,
        year: 0,
        length: '',
        beam: '',
        draft: '',
        speed: '',
        description: '',
        image: '',
        minimumAgeChild: 0,
        maximumAgeChild: 0,
        itineraryTypes: [],
        keyFeatures: [],
        images: [],
        logo: '',
        webLink: '',
        imagesBoat: []);
  }
}
