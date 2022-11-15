import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});
  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  var faker = new Faker();
  ScrollController _scrollController = new ScrollController();
  List<Map<String, dynamic>> _items =[] ;
  bool _isFetching = true;
  @override
  void initState(){
    _scrollController.addListener(() {
          double maxScroll = _scrollController.position.maxScrollExtent;
          double currentScroll = _scrollController.position.pixels;
          double delta = 200.0; // or something else..
          if ( maxScroll - currentScroll <= delta) {
            if(_items.length > 0) {
              _onBottomReached();
            }
          }
        }
    );

    _onBottomReached();

    super.initState();
  }

  void _onBottomReached(){
    setState(() {
      _isFetching = true;
    });
    Future.delayed(const Duration(milliseconds: 1000), ()
    {
      setState(() {
        int start = _items.length>0?_items.length:0;
        for (int x = start ; x < (start + 10); x++) {
          _items.add({
            "image": "https://i.pravatar.cc/300?id=$x",
            "name": faker.person.name(),
            "message": faker.lorem.words(6).join(' ')
          });
        }
        _isFetching = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: _items.length,
                controller: _scrollController,
                itemBuilder: (BuildContext context, int position) {
                  return getRow(position);
                }
            )
        ),
        _isFetching? Padding(padding: EdgeInsets.all(10), child: LinearProgressIndicator(),): Container()
      ],
    );
  }

  Widget getRow(int i) {
    //Map<String, dynamic> item = _items.elementAt(i);
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
                                Row(
                                    children: [
                                      Expanded(
                                        child: Text(faker.lorem.words(6).join(' '), style: TextStyle(fontSize: 14, color: Colors.grey), overflow: TextOverflow.ellipsis,),
                                      ),
                                      Container()
                                    ]
                                )
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
