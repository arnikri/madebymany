int N=800;
int n=N/10;


Tile test1= new Tile();

void setup(){
size(800,800);

test1.display();



}


class Tile{

  
  int widthh=n;
  int heightt=n;
  color colorr=#FF0000;
  
  void display(){
  rect(0,0,n,n);
  
  }


}