import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart'as http;
import 'package:mazare3na/section1.dart';
import 'package:mazare3na/specificloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Section2 extends StatefulWidget{
  var farmname ;
  var username;
  Section2({this.farmname,this.username});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Statev(farmname : farmname,username : username
    );
  }

}
class Statev extends State<Section2>{
 // final ref = FirebaseDatabase.instance;
  var refrence;
  List toarikh =[];
  var farmname ;
  var username;
  var string ="افادت وزارة الصحة في العاصمة الافغانية كابول ان حصيلة القتلى في واقعة التفجير قرب مطار كابول، أمس، الخميس، ارت";
  List marati =[];
  Statev({this.farmname,this.username});
  void getdats()async{
    marati.clear();
    var url2 = "https://mazrati.000webhostapp.com/mazrati2.php";
    var response2 = await http.get(Uri.parse(url2));
    var body2 = jsonDecode(response2.body);
    List data2 = body2;
    for(int y =0;y<data2.length;y++){
      if(data2[y]["farmname"] == farmname){
        marati.add(data2[y]);
      }
    }
    //print(marati[0]["latlng"].toString().substring(7,marati[0]["latlng"].toString().length-1));
    //getlatlang(marati[0]["latlng"]);
    setState(() {});
  }
  void viewfeat(){
    String strin = marati[0]["mizat"];
    if(strin =="null"){
      showDialog(context: context, builder: (context) {
        return AlertDialog(title: Text("الميزات الاضافية"),actions: [ElevatedButton(onPressed: (){Navigator.of(context).pop();}, child: Text("ok"))],
          content: new Container(width: 100,height: 100,child:Text("لا يوجد ميزات مضافة من قبل صاحب المزرعة")),);
      });
    }
    else{
      String  newstrin = strin.substring(1,strin.length -1);
      List stro = newstrin.split(",");
      showDialog(context: context, builder: (context) {
        return AlertDialog(title: Text("الميزات الاضافية"),actions: [ElevatedButton(onPressed: (){Navigator.of(context).pop();}, child: Text("ok"))],
          content: new Container(width: 100,height: 100,child:ListView.builder(itemCount:stro.length,itemBuilder: (context,i){
            return ListTile(trailing: Icon(Icons.data_usage),title: Text(stro[i]),);
          }),),);
      });
    }
    }
  void viewmoney() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("username") == "null"){
      showDialog(context: context, builder: (context) {
        return AlertDialog(title: Text("انذار"),
          content: new Container(
              width: 50, height: 100, child: Text("لا يمكنك رؤية الاسعار ان لم تقم بتسجيل الدخول ")),actions: [
            new ElevatedButton(onPressed: (){Navigator.of(context,rootNavigator: true).pop('dialog');}, child: Text("ok"))
          ],);
      });
    }
    else {
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          content: Container(width: MediaQuery
              .of(context)
              .size
              .width, height: MediaQuery
              .of(context)
              .size
              .height * 0.40,
            child: new ListView(children: [
              Container(margin: EdgeInsets.only(right: 20),
                child: ListTile(trailing: Icon(Icons.data_usage),
                    title: Container(alignment: Alignment.centerRight,
                        child: Text(":الاستخدام اليومي", style: TextStyle(
                            fontSize: 25, color: Colors.blueAccent),))),),
              Container(margin: EdgeInsets.only(right: 60),
                alignment: Alignment.centerRight,
                child: Directionality(textDirection: ui.TextDirection.rtl,
                    child: Text("يوم الخميس : " + marati[0]["money1"],
                      style: TextStyle(
                          fontSize: 20, fontStyle: FontStyle.italic),)),),
              Container(margin: EdgeInsets.only(right: 60),
                alignment: Alignment.centerRight,
                child: Directionality(textDirection: ui.TextDirection.rtl,
                    child: Text("يوم الجمعة : " + marati[0]["money2"],
                      style: TextStyle(
                          fontSize: 20, fontStyle: FontStyle.italic),)),),
              Container(margin: EdgeInsets.only(right: 60),
                alignment: Alignment.centerRight,
                child: Directionality(textDirection: ui.TextDirection.rtl,
                    child: Text("يوم السبت : " + marati[0]["money3"],
                      style: TextStyle(
                          fontSize: 20, fontStyle: FontStyle.italic),)),),
              Container(margin: EdgeInsets.only(right: 60),
                alignment: Alignment.centerRight,
                child: Directionality(textDirection: ui.TextDirection.rtl,
                    child: Text("باقي الأيام : " + marati[0]["money4"],
                      style: TextStyle(
                          fontSize: 20, fontStyle: FontStyle.italic),)),)
              ,
              Container(margin: EdgeInsets.only(right: 20),
                child: ListTile(trailing: Icon(Icons.data_usage),
                    title: Container(alignment: Alignment.centerRight,
                        child: Text(":سهرة", style: TextStyle(
                            fontSize: 25, color: Colors.blueAccent),))),),
              Container(margin: EdgeInsets.only(right: 60),
                alignment: Alignment.centerRight,
                child: Directionality(textDirection: ui.TextDirection.rtl,
                    child: Text("يوم الخميس : " + marati[0]["money5"],
                      style: TextStyle(
                          fontSize: 20, fontStyle: FontStyle.italic),)),),
              Container(margin: EdgeInsets.only(right: 60),
                alignment: Alignment.centerRight,
                child: Directionality(textDirection: ui.TextDirection.rtl,
                    child: Text("يوم الجمعة : " + marati[0]["money6"],
                      style: TextStyle(
                          fontSize: 20, fontStyle: FontStyle.italic),)),),
              Container(margin: EdgeInsets.only(right: 60),
                alignment: Alignment.centerRight,
                child: Directionality(textDirection: ui.TextDirection.rtl,
                    child: Text("باقي الأيام : " + marati[0]["money7"],
                      style: TextStyle(
                          fontSize: 20, fontStyle: FontStyle.italic),)),),
              Container(margin: EdgeInsets.only(right: 20),
                child: ListTile(trailing: Icon(Icons.data_usage),
                    title: Container(alignment: Alignment.centerRight,
                        child: Text(":المبيت", style: TextStyle(
                            fontSize: 25, color: Colors.blueAccent),))),),
              Container(margin: EdgeInsets.only(right: 60),
                alignment: Alignment.centerRight,
                child: Directionality(textDirection: ui.TextDirection.rtl,
                    child: Text("يوم الخميس : " + marati[0]["money8"],
                      style: TextStyle(
                          fontSize: 20, fontStyle: FontStyle.italic),)),),
              Container(margin: EdgeInsets.only(right: 60),
                alignment: Alignment.centerRight,
                child: Directionality(textDirection: ui.TextDirection.rtl,
                    child: Text("يوم الجمعة : " + marati[0]["money9"],
                      style: TextStyle(
                          fontSize: 20, fontStyle: FontStyle.italic),)),),
              Container(margin: EdgeInsets.only(right: 60),
                alignment: Alignment.centerRight,
                child: Directionality(textDirection: ui.TextDirection.rtl,
                    child: Text("يوم السبت : " + marati[0]["money10"],
                      style: TextStyle(
                          fontSize: 20, fontStyle: FontStyle.italic),)),),
              Container(margin: EdgeInsets.only(right: 60),
                alignment: Alignment.centerRight,
                child: Directionality(textDirection: ui.TextDirection.rtl,
                    child: Text("باقي الأيام : " + marati[0]["money11"],
                      style: TextStyle(
                          fontSize: 20, fontStyle: FontStyle.italic),)),)
            ],),
          ), actions: [ElevatedButton(onPressed: () {
          Navigator.of(context).pop();
        }, child: Text("okay"))
        ],);
      });
    }
  }
    void viewfatra(var masa ,var sabah,var alla){
    List jj =[];
     if(sabah ==1.toString()){
       jj.add("استخدام يومي");
     }
    if(masa ==1.toString()){
      jj.add("سهرة");
    }
    if(alla ==1.toString()){
      jj.add("مبيت");
    }
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          content: Container(width: MediaQuery.of(context).size.width*0.50,height:MediaQuery.of(context).size.height*0.30,
            child: new ListView.builder(itemCount : jj.length,itemBuilder : (context,i) {
           return Container(child: sabah.toString().trim() ==0.toString() ? Container():ListTile(title: Text(jj[i],style: TextStyle(fontSize: 20,color: Colors.blueAccent),)) );},),
          ));
      });
    }
  void view(){
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        content: Container(width: MediaQuery.of(context).size.width*0.50,height:MediaQuery.of(context).size.height*0.40,
          child: new Column(children:[Container(child: Text("اضغط على الصورة لتكبيرها "),),Container(width: MediaQuery.of(context).size.width*0.50,height:MediaQuery.of(context).size.height*0.35,
            child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: 7,itemBuilder: (context,i){
              return InkWell(onTap: (){
                showDialog(context: context, builder: (context) {
                  return AlertDialog(content:Container(width: MediaQuery.of(context).size.width *0.8,height:MediaQuery.of(context).size.height *0.8 ,child:Image(fit: BoxFit.fill,image: NetworkImage(urlget(marati[0]["url"+(i+2).toString()]))),)
                    ,actions: [ElevatedButton(onPressed: (){Navigator.of(context).pop();}, child: Text("okay"))],);
                });
              },child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                margin: EdgeInsets.all(10),child:Image(image: NetworkImage(urlget(marati[0]["url"+(i+2).toString()]))),),);
            }),
          )],),
        ),actions: [ElevatedButton(onPressed: (){Navigator.of(context).pop();}, child: Text("okay"))],);
    });

  }
void traikha() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("username") == "null"){
      showDialog(context: context, builder: (context) {
        return AlertDialog(title: Text("انذار"),
          content: new Container(
              width: 50, height: 100, child: Text("لا يمكنك رؤية التواريخ ان لم تقم بتسجيل الدخول ")),actions: [
                new ElevatedButton(onPressed: (){Navigator.of(context,rootNavigator: true).pop('dialog');}, child: Text("ok"))
          ],);
      });
    }
    else{
  showDialog(barrierDismissible: false, context: context, builder: (context) {
    return AlertDialog(title: Text("يتم الان التحميل"),
      content: new Container(
          width: 50, height: 50, child: CircularProgressIndicator()),);
  });
  var url = "https://mazrati.000webhostapp.com/mazratietaha.php";
  var response = await http.get(Uri.parse(url));
  var body = jsonDecode(response.body);
  List data = body;
  List mm;
  List ss;
  List aa;
  for (int f = 0; f < data.length; f++) {
    if (data[f]["farmname"] == farmname) {
      //s = f;
      toarikh.clear();
      List gg =
      data[f]["waqit"].toString().trim().substring(1, data[f]["waqit"]
          .toString()
          .length - 1).split(",");
      mm = data[f]["masa"].toString().trim().substring(1, data[f]["masa"]
          .toString()
          .length - 1).split(",");
      ss = data[f]["sbah"].toString().trim().substring(1, data[f]["sbah"]
          .toString()
          .length - 1).split(",");
      aa = data[f]["alla"].toString().trim().substring(1, data[f]["alla"]
          .toString()
          .length - 1).split(",");
      for (int f = 0; f < gg.length; f++) {
        if (DateTime.parse(gg[f].toString().trim()).compareTo(DateTime.now().subtract(Duration(days: 1))) >
            0) {
          toarikh.add(gg[f].toString().trim());
        }
      }
    }
  }
  Navigator.of(context).pop();
  showDialog(context: context, builder: (context) {
    return AlertDialog(
      content: new Container(height: MediaQuery
          .of(context)
          .size
          .height * 0.3,
        width: MediaQuery
            .of(context)
            .size
            .width * 0.3,
        child: ListView.builder(
            itemCount: toarikh.length, itemBuilder: (context, i) {
          return Center(child: Container(margin: EdgeInsets.all(10),
              child: ListTile(leading: IconButton(icon: Icon(
                  Icons.messenger_rounded), onPressed: () {
                return viewfatra(mm[i], ss[i], aa[i]);
              }), title: Text(toarikh[i].toString().trim(), style: TextStyle(
                  fontSize: 20, color: Colors.blueAccent),),)));
        }),), actions: [ElevatedButton(onPressed: () {
      Navigator.of(context).pop();
    }, child: Text("okay"))
    ],
    );
  });
}
}

  String urlget(var url){
    return "https://mazrati.000webhostapp.com/"+url;
  }
  @override
  void initState() {
   // refrence = ref.reference();
    getdats();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(body: Container(
      child:marati.length==0?Center(child: CircularProgressIndicator(),)  :Container(height: MediaQuery.of(context).size.height,child: Stack(children: [
        Container(width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height * 0.35,child: ClipRRect(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0)),child: Image(fit: BoxFit.fill,image: NetworkImage(urlget(marati[0]["url1"])),)),)
          ,Container(margin: EdgeInsets.only(top:MediaQuery.of(context).size.height * 0.02),child: IconButton(icon: Icon(Icons.arrow_back,color: Colors.indigo,size: MediaQuery.of(context).size.height * 0.1,), onPressed: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){return Section1(username: username);}));
          })),Positioned(top: MediaQuery.of(context).size.height * 0.32,child: Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(15))),height: MediaQuery.of(context).size.height *0.74,width: MediaQuery.of(context).size.width,child:ListView(shrinkWrap:true,children: [
          Container(child: Row( children: [Expanded(flex: 3,child: Container(alignment: Alignment.centerRight,child: InkWell(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context){return specLocation(latlng: marati[0]["latlng"],slected: marati[0]["place"]);}));},child:  Text("الذهاب للموقع",style: TextStyle(fontSize: 20,color: Colors.blueAccent),)))),
            Expanded(child:  Icon(Icons.map,size: 25,color: Colors.blueAccent,)),Expanded(flex: 3,child: ListTile(leading:Text(marati[0]["farmname"],style: TextStyle(fontSize: 22),) ,title:Transform.translate(offset: Offset(-16, 0),child: Icon(Icons.location_on_rounded,size: 27,)) ))],) )
          , Container(margin: EdgeInsets.only(right: 20),child: ListTile(trailing: Icon(Icons.photo_sharp,color: Colors.blue,),title: Container(alignment: Alignment.centerRight,child: ElevatedButton(onPressed: view,child: Text("عرض كامل الصور",style: TextStyle(fontSize: 20,color: Colors.white),)))),)
          ,Container(margin: EdgeInsets.only(right: 20),child: ListTile(trailing: Icon(Icons.description),title: Container(alignment: Alignment.centerRight,child: Text(": الوصف",style: TextStyle(fontSize: 25,color: Colors.blueAccent),))),)
          ,Container(margin: EdgeInsets.only(right: 60),alignment: Alignment.centerRight,child: Directionality(textDirection: ui.TextDirection.rtl,child: Text(marati[0]["descrip"],style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),)),),
          Container(margin: EdgeInsets.only(right: 20),child: ListTile(trailing: Icon(Icons.data_usage),title: Container(alignment: Alignment.centerRight,child: Text(":الاستخدام اليومي",style: TextStyle(fontSize: 25,color: Colors.blueAccent),))),),
          Container(margin: EdgeInsets.only(right: 60),alignment: Alignment.centerRight,child: Directionality(textDirection: ui.TextDirection.rtl,child: Text("توقيت الاستلام-"+marati[0]["day1"],style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),)),),
          Container(margin: EdgeInsets.only(right: 60),alignment: Alignment.centerRight,child: Directionality(textDirection: ui.TextDirection.rtl,child: Text("توقيت التسليم-"+marati[0]["day2"],style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),)),),
          Container(margin: EdgeInsets.only(right: 20),child: ListTile(trailing: Icon(Icons.data_usage),title: Container(alignment: Alignment.centerRight,child: Text(": السهرة",style: TextStyle(fontSize: 25,color: Colors.blueAccent),))),),
          Container(margin: EdgeInsets.only(right: 60),alignment: Alignment.centerRight,child: Directionality(textDirection: ui.TextDirection.rtl,child: Text("توقيت الاستلام-"+marati[0]["day5"],style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),)),),
          Container(margin: EdgeInsets.only(right: 60),alignment: Alignment.centerRight,child: Directionality(textDirection: ui.TextDirection.rtl,child: Text("توقيت التسليم-"+marati[0]["day6"],style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),)),),
          Container(margin: EdgeInsets.only(right: 20),child: ListTile(trailing: Icon(Icons.data_usage),title: Container(alignment: Alignment.centerRight,child: Text(": المبيت ",style: TextStyle(fontSize: 25,color: Colors.blueAccent),))),),
          Container(margin: EdgeInsets.only(right: 60),alignment: Alignment.centerRight,child: Directionality(textDirection: ui.TextDirection.rtl,child: Text("توقيت الاستلام-"+marati[0]["day3"],style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),)),),
          Container(margin: EdgeInsets.only(right: 60),alignment: Alignment.centerRight,child: Directionality(textDirection: ui.TextDirection.rtl,child: Text("توقيت التسليم-"+marati[0]["day4"],style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),)),),
          Container(margin: EdgeInsets.only(right: 20),child: ListTile(trailing: Icon(Icons.details),title: Container(alignment: Alignment.centerRight,child: Text(": مواصفات المزرعة ",style: TextStyle(fontSize: 25,color: Colors.blueAccent),))),),
          Container(margin: EdgeInsets.only(right: 20),child: ListTile(trailing: Icon(Icons.people,size: 20,color: Colors.blueAccent,),title: Container(alignment: Alignment.centerRight,child: Text(": النزيل المفضل ",style: TextStyle(fontSize: 20,color: Colors.black),))),),
          Container(margin: EdgeInsets.only(right: 60),alignment: Alignment.centerRight,child: Directionality(textDirection: ui.TextDirection.rtl,child: Text(marati[0]["nazil"],style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,color: Colors.black54),)),),
          Container(margin: EdgeInsets.only(right: 20),child: ListTile(trailing: Icon(Icons.house,size: 20,color: Colors.blueAccent,),title: Container(alignment: Alignment.centerRight,child: Text(": مساحة المزرعة ",style: TextStyle(fontSize: 20,color: Colors.black),))),),
          Container(margin: EdgeInsets.only(right: 60),alignment: Alignment.centerRight,child: Directionality(textDirection: ui.TextDirection.rtl,child: Text(marati[0]["msaha"],style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,color: Colors.black54),)),),
          Container(margin: EdgeInsets.only(right: 20),child: ListTile(trailing: Icon(Icons.house,size: 20,color: Colors.blueAccent,),title: Container(alignment: Alignment.centerRight,child: Text(": عدد الحمامات ",style: TextStyle(fontSize: 20,color: Colors.black),))),),
          Container(margin: EdgeInsets.only(right: 60),alignment: Alignment.centerRight,child: Directionality(textDirection: ui.TextDirection.rtl,child: Text(marati[0]["numofpath"],style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,color: Colors.black54),)),),
          Container(margin: EdgeInsets.only(right: 20),child: ListTile(trailing: Icon(Icons.pool,size: 20,color: Colors.blueAccent,),title: Container(alignment: Alignment.centerRight,child: Text(": حجم المسبح ",style: TextStyle(fontSize: 20,color: Colors.black),))),),
          Container(margin: EdgeInsets.only(right: 60),alignment: Alignment.centerRight,child: Directionality(textDirection: ui.TextDirection.rtl,child: Text(marati[0]["hajem"],style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,color: Colors.black54),)),),
          Container(margin: EdgeInsets.only(right: 20),child: ListTile(trailing: Icon(Icons.pool,size: 20,color: Colors.blueAccent,),title: Container(alignment: Alignment.centerRight,child: Text(": عمق المسبح ",style: TextStyle(fontSize: 20,color: Colors.black),))),),
          Container(margin: EdgeInsets.only(right: 60),alignment: Alignment.centerRight,child: Directionality(textDirection: ui.TextDirection.rtl,child: Text(marati[0]["omiq"],style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,color: Colors.black54),)),),
          Container(margin: EdgeInsets.only(right: 20),child: ListTile(trailing: Icon(Icons.phone,size: 20,color: Colors.blueAccent,),title: Container(alignment: Alignment.centerRight,child: Text(": رقم التواصل من داخل الاردن",style: TextStyle(fontSize: 17,color: Colors.black),))),),
          Container(margin: EdgeInsets.only(right: 60,bottom: 20),alignment: Alignment.centerRight,child: Directionality(textDirection: ui.TextDirection.ltr,child: Text(marati[0]["phone"],style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,color: Colors.black54),)),),
          Container(margin: EdgeInsets.only(right: 20),child: ListTile(trailing: Icon(Icons.phone,size: 20,color: Colors.blueAccent,),title: Container(alignment: Alignment.centerRight,child: Text(": رقم التواصل من خارج الاردن ",style: TextStyle(fontSize: 17,color: Colors.black),))),),
          Container(margin: EdgeInsets.only(right: 60,bottom: 20),alignment: Alignment.centerRight,child: Directionality(textDirection: ui.TextDirection.ltr,child: Text(marati[0]["phone1"],style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,color: Colors.black54),)),),
          Container(margin: EdgeInsets.only(right: 20),child: ListTile(trailing: Icon(Icons.featured_play_list_sharp),title: Container(alignment: Alignment.centerRight,child: ElevatedButton(onPressed: viewfeat,child: Text("ميزات اضافية",style: TextStyle(fontSize: 20,color: Colors.white),)))),),
          Container(margin: EdgeInsets.only(right: 20,bottom: 20),child: ListTile(trailing: Icon(Icons.monetization_on,color: Colors.blue,),title: Container(alignment: Alignment.centerRight,child: ElevatedButton(onPressed: viewmoney,child: Text("عرض كامل الأسعار",style: TextStyle(fontSize: 20,color: Colors.white),)))),),
          Center(
            child: Container(margin: EdgeInsets.only(bottom: 100),
              child: ElevatedButton(onPressed:traikha,child: Text("التواريخ المتاحة للحجز",style: TextStyle(color: Colors.white),),)
            ),
          )
        ],),))
      ],),
    )));
  }

}