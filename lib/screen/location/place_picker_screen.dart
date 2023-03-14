import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as locations;
import 'package:location/location.dart';
import 'package:place_picker/entities/entities.dart';
import 'package:place_picker/entities/localization_item.dart';
import 'package:place_picker/uuid.dart';
import 'package:wallet_merchant/constants.dart';
import 'package:wallet_merchant/model/body/location/LocationBody.dart';
import 'package:wallet_merchant/model/response/location/LocationResponse.dart';
import 'package:wallet_merchant/repository/repository.dart';
import 'package:wallet_merchant/screen/dashboard/dashboard.dart';
import 'package:wallet_merchant/size_config.dart';

import '../../DialogHelper.dart';
import '../../base_alert_dialog.dart';
import '../../shared_prefs_helper.dart';


class PlacePickerScreen extends StatefulWidget {

  final String apiKey;
  final LatLng? displayLocation;
  LocalizationItem? localizationItem;

  PlacePickerScreen(this.apiKey, {Key? key, this.displayLocation, this.localizationItem}) : super(key: key) {
    localizationItem ??= LocalizationItem();
  }

  @override
  State<StatefulWidget> createState() => PlacePickerState();
}

/// Place picker state
class PlacePickerState extends State<PlacePickerScreen> {
  final Completer<GoogleMapController> mapController = Completer();

  /// Indicator for the selected location
  final Set<Marker> markers = {};

  /// Result returned after user completes selection
  LocationResult? locationResult;

  /// Overlay to display autocomplete suggestions
  OverlayEntry? overlayEntry;

  List<NearbyPlace> nearbyPlaces = [];

  /// Session token required for autocomplete API call
  String sessionToken = Uuid().generateV4();

  GlobalKey appBarKey = GlobalKey();

  bool hasSearchTerm = false;

  String previousSearchTerm = '';

  String _address="No Address Found";

  double _lat=0.0;
  double _long=0.0;

  final AppRepository _appRepository=AppRepository();

  // constructor
  PlacePickerState();

  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  void onMapCreated(GoogleMapController controller) {
    mapController.complete(controller);
    moveToCurrentUserLocation();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
    markers.add(Marker(
      position: widget.displayLocation ?? const LatLng(5.6037, 0.1870),
      markerId: const MarkerId("selected-location"),
    ));
  }

  @override
  void dispose() {
    overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
        backgroundColor: kColorPrimaryNew,
        title: const Text("Update Location",style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: widget.displayLocation ?? const LatLng(5.6037, 0.1870),
                zoom: 15,
              ),
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              onMapCreated: onMapCreated,
              onTap: (latLng) {
                clearOverlay();
                moveToLocation(latLng);
              },
              markers: markers,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20),),

          GestureDetector(
            onTap: (){
              SharedPrefsHelper.getMsisdn().then((msisdn) =>
                  {SharedPrefsHelper.getBasicToken().then((token) async {


                    var baseDialog = BaseAlertDialog(
                        title: "Confirm",
                        content: "Do you want to update your location?",
                        yesOnPressed: () async {
                          Get.back();
                          DialogHelper.showLoading("Please Wait");
                          var body=LocationBody(msisdn: msisdn,latitude: _lat.toString(),longitude: _long.toString());
                          print("Body:::"+body.toJson().toString());
                          LocationResponse  response= await _appRepository.updateLocation(body,token);
                          print("Response:::"+response.toJson().toString());
                          if(response.responseCode==100){
                            DialogHelper.hideLoading();
                            Fluttertoast.showToast(
                                backgroundColor: Colors.green,
                                msg: response.responseDescription!,
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM);

                            Get.offAll(const Dashboard());

                          }else{
                            Fluttertoast.showToast(
                                backgroundColor: Colors.red,
                                msg: response.responseDescription!,
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM);
                            DialogHelper.hideLoading();
                          }


                        },
                        noOnPressed: () {

                          Get.back();
                        },
                        yes: "Yes",
                        no: "No");
                    showDialog(context: context, builder: (BuildContext context) => baseDialog);

                  })});
            },
            child: Container(
              padding: const EdgeInsets.only(top: 15,bottom: 15,left: 10,right: 10),
              margin: const EdgeInsets.only(left: 20,right: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: kColorPrimary),
                borderRadius: BorderRadius.circular(30)
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width:getProportionateScreenWidth(200),child: Text(_address,style: const TextStyle(fontSize: 15,color: kTextColor,fontWeight: FontWeight.w700),)),
                  const Icon(Icons.arrow_forward)
                ],
              ),
            ),
          )


        ],
      ),
    );
  }





  void clearOverlay() {
    if (overlayEntry != null) {
      overlayEntry!.remove();
      overlayEntry = null;
    }
  }

  void setMarker(LatLng latLng) {
    // markers.clear();
    setState(() {
      markers.clear();
      markers.add(
          Marker(markerId: const MarkerId("selected-location"), position: latLng));
    });
  }


  void moveToLocation(LatLng latLng) {

    print("Value::"+latLng.longitude.toString()+":::"+latLng.latitude.toString());
    mapController.future.then((controller) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
            CameraPosition(target: latLng, zoom: 15.0)),
      );
    });

    setMarker(latLng);
    getPlace(latLng);

  }

  void moveToCurrentUserLocation() async{
    final Location location = Location();
    PermissionStatus _permissionGranted = await location.hasPermission();
    print('fffff ${_permissionGranted.toString()}');
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    if (widget.displayLocation != null) {
      moveToLocation(widget.displayLocation!);
      return;
    }

    locations.Location().getLocation().then((locationData) {
      LatLng target = LatLng(locationData.latitude!, locationData.longitude!);
      moveToLocation(target);
    }).catchError((error) {
      print(error);
    });
  }

  void getPlace(LatLng latLng) async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(latLng.latitude, latLng.longitude);
      Placemark place = p[0];
      print("Locations::"+"${place.subLocality},${place.thoroughfare}, ${place.locality},${place.postalCode}");
      setState(() {
        _address = "${place.subLocality},${place.thoroughfare}, ${place.locality},${place.postalCode}";
        _lat=latLng.latitude;
        _long=latLng.longitude;
      });
    } catch (e) {
      print(e);
    }
  }


}
