import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flower_app/videocard.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'api.dart';
import 'data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

 TextEditingController urlController=TextEditingController();
  Api fetch=Api();


bool completeVideo=false;
  
bool dawnlod=false;

 List<Video>? videos;

 Future<List<Video>?>? getvideoDta()async{
  
  List<Video>?  videos=await fetch.getVideo(urlController.text);
 return videos;


 }




Future<String?>  dawnloadVideo(Video video )async{
 Dio dio=Dio();
   var permission =Permission.storage.request();
   String? savedPath;


   if(await permission.isGranted){
    
    Directory dir=await getApplicationDocumentsDirectory();
    String savedPath='${dir.path}/${video.title!}.mp4';
    
    await dio.download(video.videoUrl!, savedPath,
options: Options(headers: {HttpHeaders.acceptEncodingHeader: "*"}),  // disable gzip
onReceiveProgress: (received, total) {
  if (total != -1) {
   print((received / total * 100).toStringAsFixed(0) + "%");

    setState(() {
      video.percentage=(received/total *100).floor();
      video.percentage==100?completeVideo=true:completeVideo=false;
    });
   
  

  
   

  }
 
});}else{
 await Permission.storage.request();
    
}

 return savedPath;
    }







  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body:Column(
        children: [
          Container(padding: const EdgeInsets.only(top: 15,left: 5,right: 5,bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("URL: "),
                const SizedBox(width: 8,),
                TextFormField(
          
                  controller: urlController,
                  decoration: const InputDecoration(
                    
                  label: Text("youtube url here")
          
                  ),
                ),
                GestureDetector(onTap: ()async{ setState(() {
                  dawnlod=true;
                });
                  videos= await getvideoDta();},
                  child: Image.asset("flutter/assets/img/download (3).png"))
              ],
            ),
          ),

          const SizedBox(height: 10,),

      dawnlod?   Container(
          child: 
          ListView.builder(itemBuilder: (context,i) 
          {Video vid=videos![i];
            
             
             dawnloadVideo(vid).then((value)=> value);
            

            
            return  VideoCard(video:vid,complete: completeVideo, );},
          itemCount: videos!.length,
          
          ),
         )
        :Center(child: Text("لم تقم بتنزيل اي فيديوهات"),)],
      ) ,
    );
  }
}