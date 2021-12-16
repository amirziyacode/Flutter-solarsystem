import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/services.dart';
import 'package:solarsysteme/date.dart';
import 'package:solarsysteme/resualt.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);




  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]); // lock
  }

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const  Color(0xFFCC3DE5),
      body: Container(
        width: we,
        height: he,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFF1647BF),Color(0xFFCC3DE5),Color(0xFF933DC8)],
                begin:  FractionalOffset(0.0, 0.0),
                end: FractionalOffset(0.5, 2)
            ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(top: 70,left: 30),
                child:  const Text("Explore",style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),),
                ),

            SizedBox(
              height: he * 0.007,
            ),

            Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(left: 32),
              child: Row(
                children: const[
                  Text("Solar System",style: TextStyle(color: Colors.white70,fontSize: 20.0),),
                  Icon(Icons.arrow_drop_down_outlined,color: Colors.red,)
                ],
              ),
            ),

            SizedBox(
              height: he * 0.05,
            ),

            Container(
              // >> card of  plants >> //
              height: 500,
              padding: const EdgeInsets.only(left: 40),
              child: Swiper(
                itemCount: plants.length,
                layout: SwiperLayout.STACK,
                itemWidth: we -2 * 64,
                pagination:const SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                    activeSize: 15,
                    space: 8,
                    activeColor: Colors.blue
                  )
                ),
                itemBuilder: (c,i){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, PageRouteBuilder(pageBuilder: (context,a,b) => Infoplant(
                        planetInfo: plants[i],
                      )));
                    },
                    child: Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            SizedBox(height: he * 0.1,),
                            Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32)
                              ),
                              elevation: 8,
                              child: Padding(
                                padding: const EdgeInsets.all(32.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(height: he * 0.1,),
                                     Text(plants[i].name,style: const TextStyle(fontSize: 44,fontWeight: FontWeight.w400),),
                                    const Text("Solar System",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black45),),
                                    SizedBox(
                                      height: he * 0.08,
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const <Widget>[
                                        Text("Know more",style: TextStyle(color: Colors.red),),
                                        Icon(Icons.arrow_right_alt_outlined,color: Colors.red,)
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),

                        Hero(
                           // animation for images ..
                          // search this Widget in fluuter.dev
                          tag: plants[i].position,
                            child: Expanded(child: Image.asset(plants[i].iconImage)))
                      ],
                    ),
                  );
                }
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        // >>> bottomNavigationBar >>> //
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(36.0),
          ),
           color : Color(0xFF6751B5)
        ),
        padding: const EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Image.asset('assets/menu_icon.png'),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset('assets/search_icon.png'),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset('assets/profile_icon.png'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
