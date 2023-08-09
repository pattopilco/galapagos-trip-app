import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:galapagos_trip_app/config/constants/encoder.dart';
import 'package:galapagos_trip_app/features/trip/domain/entities/booking.dart';
import 'package:galapagos_trip_app/features/trip/infraestructure/infraestructura.dart';
import 'package:galapagos_trip_app/config/helpers/util_file_services.dart';
import 'package:galapagos_trip_app/features/trip/infraestructure/mappers/boat_mapper.dart';
import 'package:intl/intl.dart';
import '../../../../config/constants/resources.dart';
import '../../../../config/helpers/key_value_storage_service_impl.dart';
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
    _searching();
    try {
      final decodeCodeVoucher = Encoder.getStringDecode(encodeCodeVoucher);
      Token token = await tripRepository.findToken();
      final password = token.token;
      final basicAuth =
          'Basic ${base64Encode(utf8.encode('galavail:$password'))}';
      Booking booking =
          await tripRepository.findBooking(decodeCodeVoucher, basicAuth);
      final String codeBoat = booking.codeBoat.toString();

      dynamic boatResponse =
          await tripRepository.findBoatResponse(codeBoat, basicAuth);
      Boat boat = BoatMapper.boatJsonToEntity(boatResponse);

      final DateTime now = DateTime.now();
      final DateFormat formatterNow = DateFormat.yMMMMd('en_US');
      final String formattedNow = formatterNow.format(now);
      _setLoggedTrip(booking, boat, boatResponse, formattedNow);
    } on Exception catch (e) {
      logout('$e');
    }
  }

  Future<void> logout([String? errorMessage]) async {
    await _deleteFileStorage(state.boat);
    await _deleteLocalStorageValue();
    await _deleteImagesLocalStorage(state.boat);
    state = state.copyWith(
      bookingStatus: BookingStatus.notAuthenticated,
      codeBoatDecode: null,
      boat: _getBlankBoat(),
      errorMessage: errorMessage,
    );
  }

  void _searching() {
    state = state.copyWith(
      bookingStatus: BookingStatus.checking,
      codeBoatDecode: null,
      boat: _getBlankBoat(),
      errorMessage: null,
    );
  }

  void _setLoggedTrip(Booking booking, Boat boat, dynamic boatResponse,
      String dateSearch) async {
    await UtilFileService.downloadDocument(
        booking.documents[0].url, booking.documents[0].name);
    await UtilFileService.downloadDocument(
        booking.documents[1].url, booking.documents[1].name);
    await UtilFileService.downloadDocument(
        '${UtilFileService.url_upload_manual_cabina}${boat.name}.pdf',
        '${boat.name}.pdf');
    await UtilFileService.downloadDocument(
        '${Resources.UPLOAD_FLEET}${boat.image}', boat.image);
    await UtilFileService.downloadDocument(
        '${Resources.UPLOAD_FLEET}${boat.logo}', boat.logo);
    await _downloadImagesLocalStorage(boat);
    String pathLocalStorage =
        await UtilFileService.getApplicationDocumentsDirectoryRoyal();

    _saveLocalStorageValue(
        booking.codeVoucherEncrypted ?? '', boat, boatResponse, dateSearch);
    state = state.copyWith(
        pathLocalStorage: pathLocalStorage,
        codeBoatDecode: booking.codeVoucherEncrypted,
        bookingStatus: BookingStatus.authenticated,
        boat: boat,
        nameBoat: boat.name,
        dateSearch: dateSearch);
  }

  Future<void> _downloadImagesLocalStorage(Boat boat) async {
    for (var imageBoat in boat.imagesBoat) {
      await UtilFileService.downloadDocument(
          '${UtilFileService.url_upload_cruises}${imageBoat.image}',
          imageBoat.image);
    }
  }

  Future<void> _deleteImagesLocalStorage(Boat boat) async {
    for (var imageBoat in boat.imagesBoat) {
      await UtilFileService.deleteFile(imageBoat.image);
    }
  }

  Future<void> existVoucher(BookingStatus bookingStatus) async {
    KeyValueStorageServiceImpl keyValueStorageServiceImpl =
        KeyValueStorageServiceImpl();
    if (await keyValueStorageServiceImpl.checkValue('VOUCHER')) {
      String? dateSearch;
      String pathLocalStorage;
      String? boatName;
      String? boatJson;
      String? codeVoucher =
          await keyValueStorageServiceImpl.getValue<String>('VOUCHER');
      if (await keyValueStorageServiceImpl.checkValue('BOAT')) {
        boatJson = await keyValueStorageServiceImpl.getValue<String>('BOAT');
      }
      if (await keyValueStorageServiceImpl.checkValue('BOATNAME')) {
        boatName =
            await keyValueStorageServiceImpl.getValue<String>('BOATNAME');
      }
      if (await keyValueStorageServiceImpl.checkValue('DATESEARCH')) {
        dateSearch =
            await keyValueStorageServiceImpl.getValue<String>('DATESEARCH');
      } else {
        DateTime now = DateTime.now();
        DateFormat formatterNow = DateFormat.yMMMMd('en_US');
        dateSearch = formatterNow.format(now);
      }
      pathLocalStorage =
          await UtilFileService.getApplicationDocumentsDirectoryRoyal();
      state = state.copyWith(
          pathLocalStorage: pathLocalStorage,
          codeBoatDecode: codeVoucher,
          bookingStatus: BookingStatus.authenticated,
          boat: BoatMapper.boatJsonToEntity(jsonDecode(boatJson.toString())),
          nameBoat: boatName.toString(),
          errorMessage: '',
          dateSearch: dateSearch);
    } else {
      await UtilFileService.downloadDocument(
          'https://galavail.com/upload/fleet/loading-boat.gif',
          'loadingBoat.gif');
    }
  }

  Future<void> _saveLocalStorageValue(String voucher, Boat boat,
      dynamic boatResponse, String dateSearch) async {
    final boatResponseDecode = jsonEncode(boatResponse);
    KeyValueStorageServiceImpl keyValueStorageServiceImpl =
        KeyValueStorageServiceImpl();
    await keyValueStorageServiceImpl.setKeyValue<String>('VOUCHER', voucher);
    await keyValueStorageServiceImpl.setKeyValue<String>(
        'BOAT', boatResponseDecode);
    await keyValueStorageServiceImpl.setKeyValue<String>('BOATNAME', boat.name);
    await keyValueStorageServiceImpl.setKeyValue<String>(
        'DATESEARCH', dateSearch);
  }

  Future<void> _deleteLocalStorageValue() async {
    KeyValueStorageServiceImpl keyValueStorageServiceImpl =
        KeyValueStorageServiceImpl();
    await keyValueStorageServiceImpl.removeKey('VOUCHER');
    await keyValueStorageServiceImpl.removeKey('BOAT');
    await keyValueStorageServiceImpl.removeKey('BOATNAME');
    await keyValueStorageServiceImpl.removeKey('DATESEARCH');
  }

  Future<void> _deleteFileStorage(Boat boat) async {
    await UtilFileService.deleteFile('itinerary.pdf');
    await UtilFileService.deleteFile('voucher.pdf');
    await UtilFileService.deleteFile('${boat.name}.pdf');
    await UtilFileService.deleteFile(boat.image);
    await UtilFileService.deleteFile(boat.logo);
    await Future.delayed(const Duration(seconds: 1));
  }

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

// Estado Booking

enum BookingStatus { checking, authenticated, notAuthenticated }

class BookingState {
  final BookingStatus bookingStatus;
  final String codeBoatDecode;
  final String nameBoat;
  final Boat boat;
  final String errorMessage;
  final String pathLocalStorage;
  final String? dateSearch;

  BookingState({
    this.bookingStatus = BookingStatus.notAuthenticated,
    this.codeBoatDecode = '',
    this.nameBoat = '',
    required this.boat,
    this.errorMessage = '',
    this.pathLocalStorage = '',
    this.dateSearch,
  });

  BookingState copyWith(
          {BookingStatus? bookingStatus,
          String? codeBoatDecode,
          String? nameBoat,
          required Boat boat,
          String? errorMessage,
          String? pathLocalStorage,
          String? dateSearch}) =>
      BookingState(
          bookingStatus: bookingStatus ?? this.bookingStatus,
          codeBoatDecode: codeBoatDecode ?? this.codeBoatDecode,
          nameBoat: nameBoat ?? this.nameBoat,
          boat: boat,
          errorMessage: errorMessage ?? this.errorMessage,
          pathLocalStorage: pathLocalStorage ?? this.pathLocalStorage,
          dateSearch: dateSearch ?? this.dateSearch);
}
