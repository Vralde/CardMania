class KortBunke{
  PImage kortBillede;
  int vis = 0;
  int kortX = 0;
  int kortY = 0;
  int frontSide = 0;
  String[] kortNavn = {"00CardManiaCards.png", "01CardManiaCards.png", "02CardManiaCards.png", "03CardManiaCards.png", "04CardManiaCards.png", "05CardManiaCards.png", "06CardManiaCards.png", "07CardManiaCards.png", "08CardManiaCards.png"};
  
  
  KortBunke(int x, int y, int fs){
    kortX = x;
    kortY = y;
    frontSide = fs;
  }
  
  void display(){
   kortBillede = loadImage(kortNavn[vis]);
   image(kortBillede, kortX, kortY);
  }
  
  
  void displayFront(){
    vis = frontSide;
  }
  
}
