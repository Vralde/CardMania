KortBunke[] nyKortBunke = new KortBunke[16];

int[] x = new int[16];
int[] y = new int[16];
int[] fs = new int[16];




void setup(){
  
  size(700, 900);
  
  int nyX = 15;
  int nyY = 15;
  int nyFs = 0;
  
  for(int i = 0; i<16; i++){
    x[i] = nyX;
    y[i] = nyY;
    fs[i] = i++;
    
    if(nyX < 345){
      nyX += 115;
    } else if(nyX > 345){
      nyX = 15;
      //altså hvor kortet skal starte på x
      nyY += 150;
      //altså hvor højt er kortet ovenover?
    }
  }
  
  for (int i = 0; i < 16; i++){
    nyKortBunke[i] = new KortBunke (x[i], y[i], fs[i]);
    println(x[i], y[i], fs[i]);
  }
  
}


void draw(){
  for (int i = 0; i < 16; i++){
    nyKortBunke[i].display();
  }
  if(mousePressed){
    vend();
  }
}

void vend(){
  for (int = 0; i < 16; i++){
    if (mouseX > x[i] && mouseX < (x[i] + 105) && mouseY > y[i] && mouseY < (y[i]+140){
      nyKortBunke[i].displayFrontSide();
    }
  }
}
