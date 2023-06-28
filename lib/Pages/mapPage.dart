// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:yandex_mapkit/yandex_mapkit.dart';
//
//
//
// class mapPage extends StatefulWidget{
//
//   @override
//   State<StatefulWidget> createState() => mapPageState();
//
// }
//
//
// class mapPageState extends State<mapPage>{
//   final mapControllerCompleter = Completer<YandexMapController>();
//
//   @override
//   void initState() {
//     super.initState();
//     _initPermission().ignore();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Текущее местоположение'),
//       ),
//       body: YandexMap(
//         onMapCreated: (controller) {
//           mapControllerCompleter.complete(controller);
//         },
//       ),
//     );
//   }
//
//   /// Проверка разрешений на доступ к геопозиции пользователя
//   Future<void> _initPermission() async {
//     if (!await appLocation().checkPermission()) {
//       await appLocation().requestPermission();
//     }
//     await _fetchCurrentLocation();
//   }
//
//   /// Получение текущей геопозиции пользователя
//   Future<void> _fetchCurrentLocation() async {
//     AppLatLong location;
//     const defLocation = KemerovoLocation();
//     try {
//       location = await appLocation().getCurrentLocation();
//     } catch (_) {
//       location = defLocation;
//     }
//     _moveToCurrentLocation(location);
//   }
//
//   /// Метод для показа текущей позиции
//   Future<void> _moveToCurrentLocation(
//       AppLatLong appLatLong,
//       ) async {
//     (await mapControllerCompleter.future).moveCamera(
//       animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
//       CameraUpdate.newCameraPosition(
//         CameraPosition(
//           target: Point(
//             latitude: appLatLong.lat,
//             longitude: appLatLong.long,
//           ),
//           zoom: 12,
//         ),
//       ),
//     );
//   }
// }
//
//
// class AppLatLong {
//   final double lat;
//   final double long;
//
//   const AppLatLong({
//     required this.lat,
//     required this.long,
//   });
// }
//
// class KemerovoLocation extends AppLatLong {
//   const KemerovoLocation({
//     super.lat = 55.3450231,
//     super.long = 86.0623044,
//   });
// }
//
//
// abstract class AppLocation {
//   Future<AppLatLong> getCurrentLocation();
//
//   Future<bool> requestPermission();
//
//   Future<bool> checkPermission();
// }
//
// class appLocation implements AppLocation{
//
//   final defLocation = const KemerovoLocation();
//
//   @override
//   Future<bool> requestPermission() {
//     return Geolocator.requestPermission()
//         .then((value) =>
//     value == LocationPermission.always ||
//         value == LocationPermission.whileInUse)
//         .catchError((_) => false);
//   }
//
//   @override
//   Future<bool> checkPermission() {
//     return Geolocator.checkPermission()
//         .then((value) =>
//     value == LocationPermission.always ||
//         value == LocationPermission.whileInUse)
//         .catchError((_) => false);
//   }
//
//   @override
//   Future<AppLatLong> getCurrentLocation() async {
//     return Geolocator.getCurrentPosition().then((value) {
//       return AppLatLong(lat: value.latitude, long: value.longitude);
//     }).catchError(
//           (_) => defLocation,
//     );
//   }
//
//
// }
