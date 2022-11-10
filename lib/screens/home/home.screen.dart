import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:axle/screens/messages/messages.screen.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _onlines = 0;
  void _onItemTapped() {
    setState(() {
      _onlines+=1;
    });
  }
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(length: 4,
        child:Scaffold(
          appBar: AppBar(
            title: Text(widget.title, style: TextStyle(fontWeight: FontWeight.w300),),
            centerTitle: true,
            bottom: new TabBar(
              //isScrollable: true,
              tabs: [
                Tab(child: Text("MESSAGES", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12,),)),
                Tab(child: Text("ONLINE", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),)),
                Tab(child: Text("GROUPS", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),)),
                Tab(child: Text("CALLS", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),)),
              ],
            ),
          ),
          body:   TabBarView(
            children: [
              MessagesScreen(),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
              ElevatedButton(
                  onPressed: _onItemTapped,
                  child: Text("UUUU")
              ),
            ],
          ),
        )
    );
  }
}
