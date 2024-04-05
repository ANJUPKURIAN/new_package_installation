import 'package:flutter/material.dart';
import 'package:new_package_installation/controller/home_screen_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState(){ // initstate cannot be awaited. create another function for await
  fetchData();
  super.initState();
  }

 fetchData() async{
  await HomeScreenController.getAllData();
 }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
        await  HomeScreenController.addData();
        setState(() {});// button for adding new  data
        },
        ),

      appBar: AppBar(),
      body: Center(
      child: Column(
      mainAxisSize: MainAxisSize.min,
       children: [
         ElevatedButton(
          onPressed: () async{
          await HomeScreenController.getAllData();
          setState(() {});
          }, 

          child: Text("get")),
          Column(
            children: List.generate( 
              HomeScreenController.data.length,
            (index) => ListTile(
              title: Text(
              HomeScreenController.studentsList[index].name
              .toString()),
              subtitle: Text(
                HomeScreenController.studentsList[index].phone
                .toString()),

                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  IconButton(onPressed: () async{
                    await HomeScreenController.deleteData(
                      HomeScreenController.studentsList[index].id
                    );
                  setState(() {});
                },

              icon: Icon(Icons.delete)),
              IconButton(
                onPressed: () async {
                await HomeScreenController.editData(
                HomeScreenController
                  .studentsList[index].id);
                    setState(() {});
                  },
                icon: Icon(Icons.edit)),
                  ],
                 ),
               )),
            )
          ],
        ),
      ),
    );
  }
}