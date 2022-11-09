import 'package:flutter/material.dart';


class VoterScreen extends StatelessWidget {
  const VoterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Row(
            children: [
               Container(
              height: height*0.25,
              width:  width* 0.45,
              padding: const EdgeInsets.only(left: 16,  bottom: 16),
              child:  InkWell(
                    splashColor: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                    Navigator.pushNamed(context, '/voterrecord');
                    },
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color:Theme.of(context).inputDecorationTheme.fillColor!,
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                           Icon(Icons.person_add, size: 50,),
                           SizedBox(height: 14),
                            Text(
                             "ووٹر شامل کریں",
                              style:  TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),]
                       )
                      )
              )),
               Container(
              height: height*0.25,
              width:  width* 0.45,
              padding: const EdgeInsets.only(left: 16,  bottom: 16),
              child:  InkWell(
                    splashColor: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                    Navigator.pushNamed(context, '/executivecheck');
                    },
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color:Theme.of(context).inputDecorationTheme.fillColor!,
                      ),
                       child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                           Icon(Icons.manage_search_outlined, size: 50,),
                           SizedBox(height: 14),
                            Text(
                              "ووٹر تلاش کریں",
                              style:  TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),]
                       )),
                      
              )),
            ],
           )
          ],
          
        ),
      ),
    );
  }
}