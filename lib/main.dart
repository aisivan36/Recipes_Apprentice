import 'package:flutter/material.dart';
import 'package:hello_flutter/recipe.dart';
import 'package:hello_flutter/reicpe_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.brown,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: SizedBox(
          child: ListView.builder(
            /// Item count by counting from the [Recipe.sampes]
            itemCount: Recipe.samples.length,
            itemBuilder: (context, int index) {
              /// [GestureDetector] as the name implies, it detects gestures
              return GestureDetector(
                onTap: () {
                  /// The [Navigator] widget manages a stack of pages, calling [push()] with [MaterialPageRoute] will push a new material page onto the stack.
                  Navigator.push(
                    context,
                    //The [builder] creates the destination page widget
                    MaterialPageRoute(builder: (context) {
                      return RecipeDetail(recipe: Recipe.samples[index]);
                    }),
                  );
                },
                // Calling The buildRecipeCard and passing them by list of int [index]
                ///The child of [GestureDetector] widget defines the are where the gesture is active.
                child: buildRecipeCard(Recipe.samples[index]),
              );
            },
          ),
        ),
      ),
    );
  }

  /// Add parameter from the [Recipe] class
  Widget buildRecipeCard(Recipe recipe) {
    return Card(
      /// Card's [elevation] determines how high off the screen the card is, affecting its shadow
      elevation: 2.0,

      /// [shape] handles the shape of the card. This code defines a rounded rectangle with a [10.0] corner radius
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),

      /// [Padding] insets its child's contents by the specified [padding] value.
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image(
              image: AssetImage(recipe.imageUrl),
            ),

            /// Between the image and text is a [SizedBox]. This is a blank view with a fixed size.
            const SizedBox(height: 14.0),
            Text(
              recipe.label,
              style: const TextStyle(
                color: Colors.blueAccent,
                fontSize: 24.0,
                fontFamily: 'Palatino',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
