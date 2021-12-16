import 'package:flutter/material.dart';
import 'date.dart';


class Infoplant extends StatelessWidget {
  late planetinfo planetInfo;

  Infoplant({required this.planetInfo});

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  <Widget>[

                        SizedBox(
                          height: he * 0.3,
                        ),

                        Text(planetInfo.name,style: const TextStyle(fontSize: 60,fontWeight: FontWeight.w500),),
                         const Text("Solar System",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black45),),
                        const Divider(
                            color: Colors.black38,
                        ),

                        SizedBox(height: he * 0.036),

                        Text(
                          planetInfo.description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                          style:  const TextStyle(
                          fontSize: 20,
                              fontWeight: FontWeight.w500,
                            color: Colors.black38
                        ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: he * 0.036),
                        const Divider(color: Colors.black38,),
                      ],
                    ),
                  ),

                   //  ... Gallery ... //
                  const Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: Text("Gallery",style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w300,fontSize: 25),),
                  ),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(itemBuilder: (c,i){
                      return Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)
                        ),
                        child: AspectRatio(
                            aspectRatio: 1,
                            child: Image.network(planetInfo.images[i],fit: BoxFit.cover,
                            )),
                      );
                    },
                      scrollDirection: Axis.horizontal,
                      itemCount: planetInfo.images.length,
                    ),
                  )
                ],
              ),
            ),


            Positioned(
              // ... icon images ... //
              right: -64,
                child: Hero(
                  tag: planetInfo.position,
                    child: Image.asset(planetInfo.iconImage))
            ),

            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: const Icon(Icons.chevron_left_outlined),iconSize: 35,),
          ],
        )
      ),
    );
  }
}
