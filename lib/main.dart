import 'package:flutter/material.dart';
import 'story_brain.dart';

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image:AssetImage('assets/background/background.png'),
            fit: BoxFit.cover,)
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storyBrain.getStory(),
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    storyBrain.nextStory(1);
                    setState(() {
                      storyBrain.nextStory(1);
                    });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red, // Fixed TextButton styling
                  ),
                  child: Text(

                    storyBrain.getChoice1(),
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: TextButton(
                    onPressed: () {
                      storyBrain.nextStory(2);
                      setState(() {
                        storyBrain.nextStory(2);
                      });
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue, // Fixed TextButton styling
                    ),
                    child: Text(
                  
                      storyBrain.getChoice2(),
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
