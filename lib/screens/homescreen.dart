import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    int selectIndex = 0;
    Future getData() async {
      var firestore = FirebaseFirestore.instance;
      QuerySnapshot querySnapshot = await firestore.collection('trending').get();
      final documents = querySnapshot.docs;
      return documents;
    }
    return Scaffold(
      body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: 300,
              //title: Text('Home'),
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  'https://i.pinimg.com/originals/1a/d1/a5/1ad1a5ca1fba45bffc5e05e431f91756.jpg',
                  fit: BoxFit.cover,
                ),
                collapseMode: CollapseMode.pin,
                title: Text('ALEUMETA WORLD'),
                centerTitle: true,
              ),
              //title: Text('Home'),
              leading: Image.asset('assets/logo_aleu.png', height: 50),
            ),

            SliverToBoxAdapter(
              child: SizedBox(
                height: 600.0,
                child: Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(top: 20.0, right: 210),
                      child: Text('Trending now',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 170.0,
                      child: FutureBuilder(
                        future: getData(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Lottie.asset('assets.liked.png.png');
                          }
                          else {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data.lenght,
                              itemBuilder: (_, index) {
                                return GestureDetector(
                                  onTap: null,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      height: 100.0,
                                      width: 100.0,
                                      child: Image.network(
                                          snapshot.data[index]['image']),
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]
      ),
    );
  }

  getData() {}
}
