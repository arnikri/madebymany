int N=800;
int n=N/10;
int col=0;
int colIndex=0;
int row=N-2*n;
int counter=0;
int countPosition=0;
int colorCounter=0;

color color1=#7C98B3;
color color2=#72A98F;
color color3=#F0803C;
color color4=#EF6461;

color[] colorList;
color[] colorGuess=new color[4];

color colorPicker;

boolean gameLost=false;
boolean gameWon=false;

Gameboard gameboard;
Hider hider;

void setup() {
  size(800, 800);
  background(222);

  gameboard= new Gameboard();

  hider = new Hider();
  hider.display();//COMMENT THIS OUT TO SEE THE MASTER'S COMBINATION
  

}


void draw() {

  if(gameLost | gameWon){
    gameLost=false;
    gameWon=false;
    setupp();
  
  }
  
  
}








void mouseClicked() {

  
  if (mouseX>0 & mouseX<n & mouseY>N-n & mouseY<N) {  

    colorPicker=get(mouseX, mouseY);

    gameboard.selectTile("litur1");
    
    

    Tile chosen1 = new Tile(colorPicker, col, row);
    chosen1.display();
    //Tile.chosenTile(colorPicker,1);

  colorGuess[colIndex]=colorPicker;

    
    col=col+n;
    colIndex++;
    //println(chosen1.colorr);
    
  }


  if (mouseX>n & mouseX<2*n & mouseY>N-n & mouseY<N) {  

    colorPicker=get(mouseX, mouseY);



    Tile chosen1 = new Tile(colorPicker, col, row);
    chosen1.display(); 
    
    
      colorGuess[colIndex]=colorPicker;
    col=col+n;
    colIndex++;
  
  }


  if (mouseX>2*n & mouseX<3*n & mouseY>N-n & mouseY<N) {  

    colorPicker=get(mouseX, mouseY);



    Tile chosen1 = new Tile(colorPicker, col, row);
    chosen1.display(); 
      colorGuess[colIndex]=colorPicker;
    col=col+n;
    colIndex++;
  }

  if (mouseX>3*n & mouseX<4*n & mouseY>N-n & mouseY<N) {  

    colorPicker=get(mouseX, mouseY);

    

    Tile chosen1 = new Tile(colorPicker, col, row);
    chosen1.display(); 
      colorGuess[colIndex]=colorPicker;
    col=col+n;
    colIndex++;
  }

  //if(mouseX>0 & mouseX<4*n & mouseY>N-n & mouseY<N){
  //gameboard.
  
  //}
  
  
  //round end
  if (col>3*n) {
    col=0;
    colIndex=0;
    row=row-n;
    colorCounter=0;
    
   
    
    
    gameboard.comparePosition();
    gameboard.compareColor();
    gameboard.resetColorGuess();
    
    
    countPosition=0;
    
    
     if(row<n){
       
       gameover();
     
    }
    
  }
  
  
  
  
}









class Tile {

  int posX;
  int posY;

  Tile(color colorInput, int x, int y) {

    colorr=colorInput;
    posX=x;
    posY=y;
  }
  int widthh=n;
  int heightt=n;
  color colorr;


  void display() {
    fill(colorr);
    rect(posX, posY, n, n);
  }

  void chosenTile(color colorChosen ) {
  }
}



class MasterTile extends Tile {

  MasterTile(color colorInput, int x, int y) {
    super(colorInput, x, y);
  }
  boolean hasMatchedPosition=false;
  boolean hasMatchedColor=false;
}



class Gameboard {
  color color1=#7C98B3;
  color color2=#72A98F;
  color color3=#F0803C;
  color color4=#EF6461;

  Tile userTile1 = new Tile(color1, 0, N-n);
  Tile userTile2 = new Tile(color2, n, N-n);
  Tile userTile3 = new Tile(color3, 2*n, N-n);
  Tile userTile4 = new Tile(color4, 3*n, N-n);

  MasterTile masterTile1;
  MasterTile masterTile2;
  MasterTile masterTile3;
  MasterTile masterTile4;

  Tile selectedTile1;
  Tile selectedTile2;
  Tile selectedTile3;
  Tile selectedTile4;




  Gameboard() {
    colorList=new color[4];
    colorList[0]=color1;
    colorList[1]=color2;
    colorList[2]=color3;
    colorList[3]=color4;


    createUserTiles();
    createMasterTiles();
  }

void comparePosition(){
  

if(colorGuess[0]==masterTile1.colorr){
 
  gameboard.masterTile1.hasMatchedPosition=true;
  countPosition++;

}

if(colorGuess[1]==masterTile2.colorr){
  
  gameboard.masterTile2.hasMatchedPosition=true;
  countPosition++;  

}

if(colorGuess[2]==masterTile3.colorr){
 
  gameboard.masterTile3.hasMatchedPosition=true;
  countPosition++;
}

if(colorGuess[3]==masterTile4.colorr){
  
  gameboard.masterTile4.hasMatchedPosition=true;
  countPosition++;
}
if(countPosition==4){
congrats();

}
println("Color+position correct: " + countPosition);
}

void compareColor(){

if(!gameboard.masterTile1.hasMatchedPosition){
  for (int i=0;i<4;i++){
    if(colorGuess[i]==masterTile1.colorr){
    colorCounter++;
    gameboard.masterTile1.hasMatchedColor=true;
    colorGuess[i]=0;
    }
  }
}


if(!gameboard.masterTile2.hasMatchedPosition){
  for (int i=0;i<4;i++){
    if(colorGuess[i]==masterTile2.colorr){
    colorCounter++;
    gameboard.masterTile1.hasMatchedColor=true;
    colorGuess[i]=0;
    }
  }
}

if(!gameboard.masterTile3.hasMatchedPosition){
  for (int i=0;i<4;i++){
    if(colorGuess[i]==masterTile3.colorr){
    colorCounter++;
    gameboard.masterTile1.hasMatchedColor=true;
    colorGuess[i]=0;
    }
  }
}

if(!gameboard.masterTile4.hasMatchedPosition){
  for (int i=0;i<4;i++){
    if(colorGuess[i]==masterTile4.colorr){
    colorCounter++;
    gameboard.masterTile1.hasMatchedColor=true;
    colorGuess[i]=0;
    }
  }
}

println("Color correct: " + colorCounter);
println();
}


void resetColorGuess(){
for (int i=0;i<4;i++){
colorGuess[i]=0;
}
  
}

  void selectTile(String tile) {

    if (tile == "Tile1") {
      //selectTile1
    }
  }

  void createMasterTiles() {

    masterTile1 = new MasterTile(colorList[int(random(0, 4))], 0, 0);
    masterTile2 = new MasterTile(colorList[int(random(0, 4))], n, 0);
    masterTile3 = new MasterTile(colorList[int(random(0, 4))], 2*n, 0);
    masterTile4 = new MasterTile(colorList[int(random(0, 4))], 3*n, 0);

    masterTile1.display();
    masterTile2.display();
    masterTile3.display();
    masterTile4.display();


  }

  void createUserTiles() {

    userTile1.display();
    userTile2.display();
    userTile3.display();
    userTile4.display();
  }
}


class Hider{
  int x=0;
  int y=0;
int widthh=4*n;
int heightt=n;
color c=0;

Hider(){
  int x=0;
  int y=0;
int widthh=4*n;
int heightt=n;
color c=0;
  
}

void display(){
  fill(c);
rect(x,y,4*n,n);

}



}


void congrats(){
  
  fill(#387038);
rect(0,0,N,N);

println("CONGRATULATIONS YOU WON!!");
gameWon=true;
}

void gameover(){

col=0;
colIndex=0;
row=N-2*n;
counter=0;
countPosition=0;
colorCounter=0;

  
fill(#960000);
rect(0,0,N,N);
println("GAME OVER");

gameLost=true;

}

void setupp(){
delay(2000);
setup();
}