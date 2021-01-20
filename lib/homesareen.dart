import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:home_admin/widget/allanformeshen.dart';


// ignore: must_be_immutable
class HomeSc extends StatefulWidget {
  @override
  _HomeScState createState() => _HomeScState();
}

class _HomeScState extends State<HomeSc> {
  @override
  Widget build(BuildContext context) {
 double sh =MediaQuery.of(context).size.height;
 double sw = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "جميع الطلبات"
        ,
        ),
        centerTitle: true,
      ),
      body:_drawProducts(sh, sw),

    );
  }
  Widget _drawProducts(double sh , sw){
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('users1').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting: return Center(
            child: CircularProgressIndicator(),
          );
          default:
            return ListView(
              children: snapshot.data.documents.map((DocumentSnapshot document) {
                return  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      Route route=MaterialPageRoute(builder: (_)=>Pri(
                        co1:"${document['co1']}" ,
                        co2:"${document['co2']}" ,
                        co3:"${document['co3']}" ,
                        co4:"${document['co4']}" ,
                        co5:"${document['co5']}" ,
                        co6:"${document['co6']}" ,
                        co7:"${document['co7']}" ,
                        co8:"${document['co8']}" ,
                        co9:"${document['co9']}" ,
                        co10:"${document['co10']}" ,
                        co11:"${document['co11']}" ,
                        co12:"${document['co12']}" ,
                        co13:"${document['co13']}" ,
                        co14:"${document['co14']}" ,
                        co15:"${document['co15']}" ,
                        co16:"${document['co16']}" ,
                      ));
                      Navigator.push(context, route);
                    },
                    child: Container(
                      height: sh*0.1,
                      width: sw*0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("${document['co1']}"),
                          SizedBox(height: 10,),
                          Text("1400/02/12"),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
        }
      },
    );
  }
}

