import 'dart:convert';

import 'package:http/http.dart';
import 'package:slicedtv/apis/service_layer.dart';
import 'package:slicedtv/models/auth_model.dart';

class AuthProvider {
  Future<AuthModel> register({AuthModel authModel}) async {
    Response response = await post(AppUrl.userUrl + "register/",
        body: json.encode(authModel.toJson()),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 201) {
      AuthModel reponseModelData =
          AuthModel.fromJson(json.decode(response.body)["response"]);
      return reponseModelData;
    } else {
      throw json.decode(response.body)["message"];
    }
  }

  Future<AuthModel> login({AuthModel authModel}) async {
    Response response = await post(AppUrl.userUrl + "login/",
        body: json.encode(authModel.toJson()),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      AuthModel reponseModelData =
          AuthModel.fromJson(json.decode(response.body)["response"]);
      return reponseModelData;
    } else {
      throw json.decode(response.body)["message"];
    }
  }
}
