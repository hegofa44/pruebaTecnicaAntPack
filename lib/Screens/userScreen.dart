import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pruebantpack/widgets/widgets.dart';

import '../Services/services.dart';

class UserScreen extends StatefulWidget {
   
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}
class _UserScreenState extends State<UserScreen> {
  final ScrollController scrollController = new ScrollController();
int design = 0;
paginaSiguiente() {
    final userServices = Provider.of<UserService>(context, listen: false);
    userServices.obtenerUsuerios();
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 200) {
        paginaSiguiente();
      }
      // print(scrollController.position.maxScrollExtent);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final userServices = Provider.of<UserService>(context);
    return Scaffold(
      
      appBar: AppBar(
        actions: [
          (design == 0)?IconButton(
            icon: Icon(Icons.view_list_rounded),
            onPressed: () {
              setState(() {
              design = 1;
                
              });
            },
            ):IconButton(
            icon: Icon(Icons.grid_view_outlined),
            onPressed: () {
              setState(() {
              design = 0;
                
              });
            },
            ),
        ],
        title: Text('UserPage'),
      ),
      body: (design == 0)?GridView.builder(
        controller: scrollController,
        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 5 / 5,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
          ),
          itemCount: userServices.users.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              // height: 50,
              // width: 200,
              decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.people_alt_outlined, color: Colors.lightBlue,),
                        Expanded(
                          child: ListTile(
                            // leading: Icon(Icons.analytics_sharp),
                            title: Text('Name'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(userServices.users[index].name),
                                Text('Email', style: TextStyle(color: Colors.black),),
                                Text(userServices.users[index].email, style: TextStyle(fontSize: 10),),
                                Text('City', style: TextStyle(color: Colors.black),),
                                Text(userServices.users[index].address.city,style: TextStyle(fontSize: 10)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.home_work_rounded, color: Colors.black45,),
                        Expanded(
                          child: ListTile(
                            // leading: Icacon(Icons.analytics_sharp),
                            title: Text('Company'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(userServices.users[index].company.name),
                                // Text(userServices.users[index].address.city,style: TextStyle(fontSize: 10)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                  ],
                ),
              ),
              // child: ,
              );
          }
       ): ListView.builder(
        controller: scrollController,
          itemCount: userServices.users.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(

              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          leading: Icon(Icons.people_alt_outlined, color: Colors.lightBlue,),
                          title: Text('User name'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(userServices.users[index].username, overflow: TextOverflow.ellipsis),
                              Text('Email', style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(userServices.users[index].email, overflow: TextOverflow.ellipsis,),
                              Text('City', style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(userServices.users[index].address.city, overflow: TextOverflow.ellipsis,),
                            ],
                          ),
                          // trailing: Icon(Icons),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          leading: Icon(Icons.home_work_outlined, color: Colors.black,),
                          title: Text('Company'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(userServices.users[index].company.name),
                              Text('CatchPhrase', style: TextStyle(color: Colors.black, fontSize: 13),),
                              Text(userServices.users[index].company.catchPhrase, style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                ],
              ),
              // child: ,
              );
          }
       ),
    );
  }
}

