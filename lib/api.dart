 import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flower_app/data.dart';
 import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import 'constant.dart';
import 'package:permission_handler/permission_handler.dart';



class Api{
 

  Dio dio=Dio();


  Future<List<Video>?>?  getVideo(String playlistUrl)async{

  http.Response response=await http.post(Uri.parse(url),body: {'url':playlistUrl});
  if(response.statusCode ==200){

   List<Map<String,dynamic>> json=jsonDecode(response.body)['videos'];

   List<Video> jsondata=json.map((video) =>Video.fromJson(video) ).toList();


   return jsondata;
  }
  else{
    return [Video()];

  }

 

    }


  }