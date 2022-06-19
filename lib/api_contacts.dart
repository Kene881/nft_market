import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import 'package:path/path.dart';
import 'package:async/async.dart';

class ApiConstants {
  static String baseUrl = 'https://numfog.pythonanywhere.com/api/';
  static String imagesEndPoint = 'images/';
}

class ApiService {
  Future<ImageServer?> getImage(int id) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.imagesEndPoint + '/$id');
      var response = await http.get(url);
      
      if (response.statusCode == 200) {
        var jsonDecoded = jsonDecode(response.body);
        ImageServer image = ImageServer(jsonDecoded['id'].toString(), jsonDecoded['image']);
        return image;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<ImageServer>?> getImages() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.imagesEndPoint);
      var response = await http.get(url);
      
      if (response.statusCode == 200) {
        var imagesFromServer = jsonDecode(response.body);
        var images = <ImageServer>[];
        for (var image in imagesFromServer) {
          images.add(
            ImageServer(image['id'].toString(), image['image'])
          );
        }
        return images;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<String?> setImage(File imageFile) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.imagesEndPoint);
      var request = http.MultipartRequest("POST", url);
      String urlImg = 'nothing';

      request.files.add(
        await http.MultipartFile.fromPath(
          'image',
          imageFile.path,
        )
      );

      urlImg = await request.send().then((response) {
        var res = response.stream.bytesToString();
        return res.then((value) {
          var jsonDecoded = jsonDecode(value);
          return jsonDecoded['image'];
        });
      });
      return urlImg;
    } catch (e) {
      log(e.toString());
    }
  }
}

class ImageServer {
  final String? id;
  final String? url;

  ImageServer(
    this.id,
    this.url
  );
}