import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // to add icon image
  var cross = const Icon(Icons.cancel,size: 80,);
  var circle = const Icon(Icons.circle,size: 80,);
  var edit = const Icon(Icons.edit,size: 80,);

  bool isCross = true;
  late String message ;
  late List<String>gameState;


  //Initalize box with empty value
  @override
  void initState() {
    gameState = List.filled(9, "empty");
    message = "";
    super.initState();
  }
  // to play game
  playGame(int index){
    if(gameState[index]=="empty"){
      setState(() {
        if(isCross){
          gameState[index]= "cross";

        }
        else{
          gameState[index]= "circle";

        }
        isCross = !isCross;
        checkWin();
      });
    }
    
  }

  //reset game
  resetGame(){
    setState(() {
      gameState = List.filled(9, "empty");
    message = "";
    });
  }
  //to get icon image
  getIcon (String title){
    switch(title){
      case ('empty'):
      return edit;

      case('cross'):
      return cross;

      case('circle'):
      return circle;
    }
  }


  //to check for winnig
  checkWin(){
    if((gameState[0]!= 'empty')&& 
    (gameState[0]== gameState[1])&&
    (gameState[1]==gameState[2])){
      setState(() {
        message = '${gameState[0]}Win';
      });
    }
    else if((gameState[3]!= 'empty')&& 
    (gameState[3]== gameState[4])&&
    (gameState[4]==gameState[5])){
      setState(() {
        message = '${gameState[3]}Win';
      });
    }
    else if((gameState[6]!= 'empty')&& 
    (gameState[6]== gameState[7])&&
    (gameState[7]==gameState[8])){
      setState(() {
        message = '${gameState[6]}Win';
      });
    }
    else if((gameState[0]!= 'empty')&& 
    (gameState[0]== gameState[3])&&
    (gameState[3]==gameState[6])){
      setState(() {
        message = '${gameState[0]}Win';
      });
    }
    else if((gameState[1]!= 'empty')&& 
    (gameState[1]== gameState[4])&&
    (gameState[4]==gameState[7])){
      setState(() {
        message = '${gameState[1]}Win';
      });
    }
    else if((gameState[2]!= 'empty')&& 
    (gameState[2]== gameState[5])&&
    (gameState[5]==gameState[8])){
      setState(() {
        message = '${gameState[2]}Win';
      });
    }

    else if((gameState[0]!= 'empty')&& 
    (gameState[0]== gameState[4])&&
    (gameState[4]==gameState[8])){
      setState(() {
        message = '${gameState[0]}Win';
      });
    }
    else if((gameState[2]!= 'empty')&& 
    (gameState[2]== gameState[4])&&
    (gameState[4]==gameState[6])){
      setState(() {
        message = '${gameState[2]}Win';
      });
    }
    else if(!gameState.contains("empty")){
      setState(() {
        message = "game draw";
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text ("Tic Tac Toe"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10
                ), 
                itemCount: gameState.length,
              itemBuilder: (context,i)=>SizedBox(
                width: 100,
                height: 100,
                child:MaterialButton(onPressed:(){
                  playGame(i);
                },
                child: getIcon(gameState[i])),
                ) ,

              )
              ),
              Text(message,style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
            MaterialButton(
              color: Colors.blue[800],
              minWidth: 200,
              onPressed: (){
              resetGame();
            },
             child: const Text(
              "reset game", 
              style: TextStyle(color: Colors.white),),
             ),
             const SizedBox(height: 100,)

      ],),
    );
    
  }
}