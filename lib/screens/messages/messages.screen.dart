import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});
  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  var faker = new Faker();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body:  ListView.builder(
            itemCount: 90,
            itemBuilder: (BuildContext context, int position) {
              return getRow(position);
            }
        )
    );
  }

  Widget getRow(int i) {
    return InkWell(
      onTap: ()=>{},
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [

              Container(
                height: 60, width: 60, color: Theme.of(context).primaryColor,
                child: Image(
                  image: NetworkImage("https://i.pravatar.cc/300?id=$i"), height: 60, width: 60,
                ),
              ),
              Expanded(
                  child: Column(
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: 15),
                            height: 85,
                            child:  Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(child: Text(faker.person.name(), style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),),
                                    Text("16:09", style: TextStyle(fontSize: 12, color: Colors.grey),),
                                  ],
                                ),
                                Container(height: 6,),
                                Text(faker.lorem.words(6).join(' '), style: TextStyle(fontSize: 14, color: Colors.grey), overflow: TextOverflow.ellipsis,),
                              ],
                            )
                        ),
                        Container(height: 1, width: double.infinity, color: Colors.black12, margin: EdgeInsets.only(left: 15),)
                      ]
                  )
              )
            ],
          )
      ),
    );
  }
}
