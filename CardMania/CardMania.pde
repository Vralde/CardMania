//Det der mangler nu:
//1. En måde der sikrer, at man ikke kan vende mere end 2 kort af gangen.

KortBunke[] nytKort = new KortBunke[16];

int[] x = new int[16];
int[] y = new int[16];
int[] fs = new int[16];

int[] tjekFs = new int[2];
int[] kortOp = new int[2];
boolean[] valgt = new boolean[16];
PImage vend;
int vendt = 0;
int win = 0;

void setup(){
  
  size(800, 700);
  
  int nyX = 15;
  int nyY = 15;
  int nyFs = 0;
  int tal = 1;
  
  vend = loadImage("flip.png");
  
  for(int i = 0; i < 16; i++){
    valgt[i] = false;
    y[i] = nyY;
    x[i] = nyX;
    fs[i] = i+1;
    if(fs[i] > 8){
      fs[i] = fs[i] -8;
    }
    //En måde hvorpå kortene hænger sammen i par. Idet der er 16 kort, og 8 af hver,
    //så hvis et kort har en værdi på mere end 8, bliver dens værdi i stedet identisk
    //med sin "partner", der så giver et stik.
    tal +=1;
    if (tal == 5){
      tal = 1;
    }
    
    if(nyX < 345){
      nyX += 115;
    } else if(nyX > 345){
      nyX = 15;
      //altså hvor kortet skal starte på x
      nyY += 150;
      //altså hvor højt er kortet ovenover?
    }
  }
  
  shuffle();
  
  
  for (int i = 0; i < 16; i++){
    nytKort[i] = new KortBunke (x[i], y[i], fs[i]);
    println(x[i], y[i], fs[i]);
  }
  
}


void draw(){
  fill(0);
  background(255);
  for (int i = 0; i < 16; i++){
    nytKort[i].display();
  }
  
  image(vend, 600, 250);
  
  if(mousePressed){
    if(mouseX > 590 && mouseX < 700 && mouseY > 240 && mouseY < 350){
      for(int i = 0; i < 16; i++){
        nytKort[i].bagSideOpad();
        valgt[i] = false;
        vendt = 0;
        //Dette er alt sammen en flip knap, der kan vende alle kort om (medmindre de
        //allerede er blevet lavet til et stik).
      }
    }

    

  }
    if (win == 8){
      textSize(100);
      text("Du vandt", 100, 100);
      println("faerdigTjek");
    }
}




void mouseClicked(){
  //Der er sket en lille ændring, idet det var vigtigt at funktion hed "mouseClicked"
  //ellers, ville det ofte ske, at man kunne holde musen inde, og klikke alle kort.
  for (int i = 0; i < 16; i++){
    if (mouseX > x[i] && mouseX < (x[i] + 105) && mouseY > y[i] && mouseY < (y[i]+150) && (valgt[i]==false)){
      //Også her er der kommet en lille ændring, idet man ikke længere kan klikke på et kort
      //der allerede er blevet klikket på, altså kan man ikke få et stik ved at klikke
      //på det samme kort to gange i træk.
      nytKort[i].displayFront();
      valgt[i] = true;
      kortOp[vendt] = i;
      
      vendt ++;
      
      if (vendt == 2){
        vendt = 0;
        println("vendtOmIgen?");
        println("0: ", fs[kortOp[0]]);
        println("1: ", fs[kortOp[1]]);
        //dette skulle gerne "reset" de to valgte kort
        
        if (fs[kortOp[0]] == fs[kortOp[1]]){
          nytKort[kortOp[0]].stik();
          nytKort[kortOp[1]].stik();
          //Hvis de to kort matcher, så bliver de begge "fjernet"
          win += 1;
          //Og du kommer 1 skridt tættere på at vinde!
        }
      }
    
    }
  }
}


void shuffle(){
  int test = 0;
  int vaerdi = 0;
  
  for (int i = 0; i < 16; i++){
    vaerdi = int(random(0,8));
    test = fs[i];
    fs[i] = fs[vaerdi];
    fs[vaerdi] = test;
  }
}
