
import 'package:flower_app/data.dart';
import 'package:flutter/material.dart';


class VideoCard extends StatefulWidget {
  final Video video;
 final bool complete;




   const VideoCard({super.key, required this.video, required this.complete});

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async {



    
   
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Container(
          margin: const EdgeInsets.all(7),
          height: 100,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              color: Color.fromARGB(180, 113, 110, 110),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Container(
            //color: Colors.pinkAccent,
            padding: const EdgeInsets.fromLTRB(4.5, 8, 11.5, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(900000000000000),
                  //  backgroundColor:Color.fromARGB(217, 255, 255, 255),
                  child: Image.network(
                    "${widget.video.imageUrl}",
                    width: 75,
                    height: 75,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            child: Text(
                              widget.video.title!,
                              maxLines: 2,
                              style: const TextStyle(overflow: TextOverflow.ellipsis,
                            
                                  color: Color.fromARGB(255, 247, 247, 247),
                                  fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         LinearProgressIndicator(value:( (widget.video.percentage!)/100),
                         backgroundColor: const Color.fromARGB(255, 255, 254, 250),
                         color: const Color.fromARGB(255, 170, 4, 4),),
                        widget.complete?Image.asset("flutter/assets/img/download.png"): Text("${(widget.video.percentage!)}%"),
                       ],
                     ),
                      ],
                    ),
                  ),
                ),
           ],
            ),
          ),
        ),
      ),
    );
  }
}






  // ignore: unused_local_variable
 
  