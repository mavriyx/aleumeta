import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({Key? key}) : super(key: key);

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  CollectionReference _collectionRef =
  FirebaseFirestore.instance.collection('trending');

  Future<void> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    print(allData);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        leading: Icon(Icons.search_rounded, color: Colors.white),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Іздеу',
            suffixIcon: IconButton(
              onPressed: null,
              icon: Icon(Icons.mic, color: Colors.white),
            )
          ),
        ),
      ),
      body: Container(
        child: Column(children: <Widget> [
          Text(
              'Popular Searches',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 400.0,
            child: FutureBuilder(
              future: getData(),
              builder: (context, AsyncSnapshot snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Lottie.asset('assets/liked.png.png');

                }
                else{
                  return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (_, index){
                        return GestureDetector(
                          onTap: null,
                          child: SizedBox(
                            height: 500.0,
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 400.0,
                                  width: 350.0,
                                  child: Image.network(
                                    snapshot.data?[index]['name']?? "",
                                    fit: BoxFit.fitWidth,
                                  )),
                                Container(
                                  width: 200.0,
                                  child: Text(
                                  snapshot.data[index].data['name']?? '',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18.0
                                      )
                                  ),
                                ),
                                Icon(Icons.play_arrow_rounded, color: Colors.grey),
                              ],
                            ),
                          ),
                        );
                    },
                  );
                }
              },
            ),
          )
        ],),
      ),
    );
  }
}

