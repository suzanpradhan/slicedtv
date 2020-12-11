import 'dart:convert';

import 'package:http/http.dart';
import 'package:slicedtv/apis/service_layer.dart';
import 'package:slicedtv/models/subscription_detail.dart';

class DefaultSubscriptionProvider {
  Future getSubscriptions() async {
    Response _response = await get(AppUrl.baseUrl,
        headers: {'Content-Type': 'application/json'});
    if (_response.statusCode == 200) {
      List subscriptionList = json.decode(_response.body)["response"];
      List<SubscriptionDetail> modelSubscriptionList = subscriptionList
          .map((items) => SubscriptionDetail.fromJson(items))
          .toList();
      return modelSubscriptionList;
    } else {
      throw json.decode(_response.body)["message"];
    }
  }
}
