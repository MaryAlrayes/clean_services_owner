import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:saudi_clean_services_owner/core/utils/helpers/decode_response.dart';
import '../../../../../core/errors/exceptions.dart';
import '../models/owner_model.dart';

abstract class OwnerRemoteDataSource {
  Future<Unit> signup(OwnerModel ownerModel);
}

const BASE_URL = 'https://scs-0iat.onrender.com';

class OwnerRemoteDataSourceWithHttp implements OwnerRemoteDataSource {
  final http.Client client;
  OwnerRemoteDataSourceWithHttp({
    required this.client,
  });

  @override
  Future<Unit> signup(OwnerModel ownerModel) async {
    try {
      final response = await client.post(
        Uri.parse('$BASE_URL/o/owner'),
        headers: {"content-type": "application/json; charset=utf-8"},
        body: json.encode(ownerModel.toJson()),
      );
      print('status code ${response.statusCode}');
      print('the body : ${response.body}');
      DecodeResponse.decode(response);
      return Future.value(unit);
    } on SocketException {
      throw ExceptionSocket();
    } on FormatException catch(e){
      print(e);
      throw ExceptionFormat();
    } on TimeoutException {
      throw ExceptionTimeout();
    } on HandshakeException {
      throw ExceptionHandshake();
    } on Exception {
      throw ExceptionOther();
    }
  }
}
