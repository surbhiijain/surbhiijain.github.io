int guesses = 0;
int shipNumber = 0;

//make array
int[] gameArray = new int[37];



//randomly place 3 ships that are 1 by 1
void singleShip() {

for(int shipPlacing = 0; shipPlacing < 3; shipPlacing++){
   int randomX1 = ((int)((Math.random() * 6) + 1));
   int randomY1 = ((int)((Math.random() * 6) + 1));
 
   
   //make sure spot does not already have a ship
   if ( gameArray[(randomX1 - 1) * 6 + (randomY1 )] == 0) {
        //make array spot of ship 1
        gameArray[(randomX1 - 1) * 6 + (randomY1 )] = 1;
        shipNumber ++; 
         //ellipse(randomX * 50 + 25, randomY * 50 + 25, 10, 10); 
   }
   
   //if ship already exists at the spot, make loop run one extra time
   else {
       shipPlacing -- ;
   }
}
}
 
//randomly place one horizontal ship that is 2 by 1
 void doubleShipHorizontal (){

   int randomX2 = (int)((Math.random() * 6) + 1);
   int randomY2 = (int)((Math.random() * 5) + 1);

    //ships that are horizontal
   if ( gameArray[(randomX2 - 1) * 6 + randomY2] == 0 &&  gameArray[(randomX2) * 6 + randomY2] == 0 ){ 
   
        //make array spot of ship 1
        gameArray[(randomX2 - 1) * 6 + randomY2] = 2;
        shipNumber ++; 
        //ellipse(randomX * 50 + 25, randomY * 50 + 25, 10, 10); 

        //make array spot of second ship
        gameArray[(randomX2) * 6 + randomY2] = 2;
         //ellipse((randomX + 1) * 50 + 25, randomY * 50 + 25, 10, 10);
        shipNumber ++; 
    }
 
    else {
        doubleShipHorizontal() ;
    }
}; 


void doubleShipVertical (){
    
   int randomX3 = (int)((Math.random() * 6) + 1);
   int randomY3 = (int)((Math.random() * 5) + 1);


    //ships that are vertical    
    if ( gameArray[(randomX3 - 1) * 6 + randomY3] == 0 &&  gameArray[(randomX3 - 1) * 6 + randomY3 + 1] == 0){
        
        //make array spot of first ship
        gameArray[(randomX3 - 1) * 6 + randomY3] = 2;
       //ellipse((randomX) * 50 + 25, (randomY) * 50 + 25, 10, 10);
        shipNumber++;
        
        //make array spot of second ship
        gameArray[(randomX3 - 1 ) * 6 + randomY3 + 1] = 2;
        //ellipse((randomX) * 50 + 25, (randomY + 1) * 50 + 25, 10, 10);
        shipNumber ++; 
    }
     
     //if ship already exists at either spot, make loop run one extra time
    else {
        doubleShipVertical() ;
    }
};

//randomly place one horizontal ship that is 3 by 1
 void tripleShipHorizontal (){

   int randomX4 = (int)((Math.random() * 3) + 1);
   int randomY4 = (int)((Math.random() * 6) + 1);

    //ships that are horizontal
   if ( gameArray[(randomX4 - 1) * 6 + randomY4] == 0 &&  gameArray[(randomX4) * 6 + randomY4] == 0 && gameArray[(randomX4 + 1) * 6 + randomY4] == 0){ 
   
        //make array spot of ship 1
        gameArray[(randomX4 - 1) * 6 + randomY4] = 3;
        shipNumber ++; 
       // ellipse(randomX * 50 + 25, randomY * 50 + 25, 10, 10); 

        //make array spot of second ship
        gameArray[(randomX4) * 6 + randomY4] = 3;
       //  ellipse((randomX + 1) * 50 + 25, randomY * 50 + 25, 10, 10);
        shipNumber ++; 
        
        //make array spot of third ship
        gameArray[(randomX4 + 1) * 6 + randomY4] = 3;
        //ellipse((randomX + 2) * 50 + 25, randomY * 50 + 25, 10, 10);
        shipNumber ++; 
    }
 
    else {
        tripleShipHorizontal() ;
    }
};

void setup(){
  size(400,400);

  background(180, 197, 240);
  fill(180, 197, 240);

//make board
for (int  i = 1; i<=6; i++){
     for (int j = 1; j<7; j++){
        rect(50 * i,50 * j ,50,50);
    }
    
    for(int x = 1; x<37; x++){
      gameArray[x] = 0;
    }
}
 singleShip();
 doubleShipHorizontal();
 doubleShipVertical();
 doubleShipVertical();
 tripleShipHorizontal();
}


void draw() {

} 




void mousePressed (){
println(mouseX);
println(mouseY);
    int ellipseX = (int)((mouseX )/50);
    int ellipseY = (int)((mouseY )/50);
      println(ellipseX);
      println(ellipseY);

    if (ellipseX >= 1 && ellipseY >= 1 && ellipseX <= 6 && ellipseY <= 6){
        //if there is a 1 by 1 ship
        if (gameArray [(ellipseX - 1) * 6 + ellipseY] == 1){
            
            guesses = guesses + 1;
            noStroke();
            fill(180, 197, 240);
            rect(229,0, 200, 45);
            fill(0, 0, 0);
            text("Number of Guesses: " + guesses, 267,25);
            
            fill(92, 84, 84);
            //ellipse( ellipseX * 50 + 25, ellipseY * 50 + 25, 50, 50);
            rect(ellipseX * 50, ellipseY * 50, 50, 50);
            fill(0, 0, 0);
            text("SUNK!" , ellipseX * 50 + 8, ellipseY * 50 + 25);
            
            gameArray [(ellipseX - 1) * 6 + ellipseY] = -1;
            shipNumber--;
            fill(180, 197, 240);
            rect(63,0, 156, 45);
            fill(0, 0, 0);
            text("Ships Parts Left: " + shipNumber, 75,25);
        
             if(shipNumber == 0){
               background(180, 197, 240);
               textSize(40);
               text("You Win!" , 124, 174);
               textSize(20);
               text("Number of Guesses Taken: " + guesses, 90, 251);
            
            }
        }
        
        //if there is a 2 by 1 ship
        if (gameArray [(ellipseX - 1) * 6 + ellipseY] == 2){
            
            guesses = guesses + 1;
            noStroke();
            fill(180, 197, 240);
            rect(229,0, 200, 45);
            fill(0, 0, 0);
            text("Number of Guesses: " + guesses, 267,25);
            
            fill(63, 92, 70);
            //ellipse( ellipseX * 50 + 25, ellipseY * 50 + 25, 50, 50);
            rect(ellipseX * 50, ellipseY * 50, 50, 50);
            fill(0, 0, 0);
            text("1/2!" , ellipseX * 50 + 10, ellipseY * 50 + 25);
            
            gameArray [(ellipseX - 1) * 6 + ellipseY] = -1;
            shipNumber--;
            fill(180, 197, 240);
            rect(63,0, 156, 45);
            fill(0, 0, 0);
            text("Ships Parts Left: " + shipNumber, 75,25);
        
             if(shipNumber == 0){
               background(180, 197, 240);
               textSize(40);
               text("You Win!" , 124, 174);
               textSize(20);
               text("Number of Guesses Taken: " + guesses, 90, 251);
            
            }
        }
        
        //if there is a 3 by 1 ship
        if (gameArray [(ellipseX - 1) * 6 + ellipseY] == 3){
            
            guesses = guesses + 1;
            noStroke();
            fill(180, 197, 240);
            rect(229,0, 200, 45);
            fill(0, 0, 0);
            text("Number of Guesses: " + guesses, 267,25);
            
            fill(74, 45, 56);
            //ellipse( ellipseX * 50 + 25, ellipseY * 50 + 25, 50, 50);
            rect(ellipseX * 50, ellipseY * 50, 50, 50);
            fill(0, 0, 0);
            text("1/3!" , ellipseX * 50 + 10, ellipseY * 50 + 25);
            
            gameArray [(ellipseX - 1) * 6 + ellipseY] = -1;
            shipNumber--;
            fill(180, 197, 240);
            rect(63,0, 156, 45);
            fill(0, 0, 0);
            text("Ships Parts Left: " + shipNumber, 75,25);
        
             if(shipNumber == 0){
               background(180, 197, 240);
               textSize(40);
               text("You Win!" , 124, 174);
               textSize(20);
               text("Number of Guesses Taken: " + guesses, 90, 251);
            
            }
        }
    
    
    
    else if (gameArray [(ellipseX - 1) * 6 + ellipseY] == 0){
        
            guesses ++;
            noStroke();
            fill(180, 197, 240);
            rect(229,0, 200, 45);
            fill(0, 0, 0);
            text("Number of Guesses: " + guesses, 267,25);
              
            fill(0, 0, 0);
            text("MISS", ellipseX * 50 + 10, ellipseY * 50 + 25);
          
            fill(180, 197, 240);
            rect(63,0, 156, 45);
            fill(0, 0, 0);
            text("Ship Parts Left: " + shipNumber, 75,25);
        }
    
      
    }
    gameArray [(ellipseX - 1) * 6 + ellipseY] = -1;
};


/*
Array values
 0 = nothing
 1 = Ship (1 by 1)
 -1 = already been guessed ( hit or miss)
 2 = ship (2 by 1)
 3 = ship (3 by 1)
*/