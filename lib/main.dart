import 'package:flutter/material.dart';
import 'DetailsScreen.dart';


void main() {
  runApp(MaterialApp(
    home: MyApp(),
    theme: ThemeData(
      primarySwatch: Colors.blue, 
      textTheme: TextTheme(
      bodySmall: TextStyle(fontSize: 16.0, color: const Color.fromARGB(255, 192, 48, 48)), 
       ),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color.fromRGBO(123, 159, 223, 1), // Background color for the AppBar
        titleTextStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
      iconTheme: IconThemeData(
        color: Colors.blue, // Color for icons
      ),
    ),
  ));
}
class MyApp extends StatelessWidget {
  final List<String> recipes = [
    "Chipotle Steak",
    "Chipotle White Rice",
    "Chipotle Chicken"
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe List'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(
              recipes[index],
              style: TextStyle(fontSize: 18.0),
            ),
            trailing: Icon(Icons.arrow_forward),
            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => DetailsScreen(recipe: recipes[index]),
                )
              );
            },
          );
        },
      )   
     );
  }
}
