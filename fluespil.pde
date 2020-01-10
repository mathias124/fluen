ArrayList<Flue> flueListe = new ArrayList<Flue>();//laver en liste over variabler.



Flue flue1  = new Flue(); //min form for konstruktør som skal opdatere fluens størrelse.
Flue flue2 =new Flue();//hver gang du trykket på e laver den en ny type flue som er større.

void setup(){//laver et setup der kører 1 gang
  size(500,500);//laver et vindue der har størrelsen på 500 * 500 pixels, bredde og længde.

  
}

void draw(){//kører 60 gange i sekundet.
    flue2.flyt();//laver det muligt til at love en void flue flyt(farten for storre fluer)

  for(int i=0; i<flueListe.size(); i++){//laver et for-loop, i sammearbejde med arraylisten over variabler.
    Flue f = flueListe.get(i);
    f.tegnFlue();//her gør den muligt til void tegnflue længere nede
    f.flyt();// samme som tegnFlue.

  }
  }
  
void keyPressed(){//en funktion det tegnes hvis en given knap bliver trykket.

  if(keyPressed){//har gjort så man selv kan justere den
    if(key=='e'){//hvis du trykker e aktivere dette.
 
      translate(width/2,height/2);
      Flue f = new Flue(random(width), random(height));//her gør jeg så flyverne er involveret i classen flue.
      f.bigness=random(1,4);//her tilføjer det så det er tilfældigt for hvilken storhed de nye flyer har.
        flueListe.add(f);//tilføjer fluen til arraylisten.

      
    }
    if(keyPressed){//gør det muligt at restarter programmeret dræbe flugerne for et øjeblik.
    if(key=='f'){
      clear();//rengører entities.
  }
    }
}
}
void mousePressed(){
  flueListe.add(new Flue(mouseX, mouseY));//laver en ny flue ud fra mus-pixel y og x værdi i koordinatsystemet.
}

/////////////////////////////////////////////////////////
class Flue{// laver klassen flue.
  
  float positionX,positionY;//kommaværdier for X og Y position.
  float distanceFlyttet;//distancen for fluen den har bevæget sig.
  float vinkel = 0; //vinkel når man placere fluen
  float yretning=1.05;//bruges under flytning af flue hvilken retning hastighed.
  float xretning=1.05;
  float b=random(0,height);
float g =random(0,width);

float bigness = 1;//størrelse af e-fluer.
  
  Flue(){//her skrives fluens egenskaber, og nedarving.
    positionX  = random(0,height);//tilfældig mellem 0 og højden. på fluen.
    positionY  = random(0,width);// gør det tilfældigt mellem 0 og bredden.
    vinkel     = random(0,2*PI);//vinkel er tilfældig.
  }
  
  Flue(float a, float b){//her skrives der fluens værdier.
    positionX = a;
    positionY = b;
    vinkel    = random(0,2*PI);

  }
  
  void flyt(){
    positionX= positionX+(distanceFlyttet*xretning);
    positionY= positionY+(distanceFlyttet*yretning);
    distanceFlyttet = distanceFlyttet +0.5;// her hvor fluen bevæger sig. 
    
  }
      void flyt2(){
    positionX= positionX+(distanceFlyttet*xretning);
    positionY= positionY+(distanceFlyttet*yretning);
    distanceFlyttet = distanceFlyttet +0.3;// her hvor fluen bevæger sig. 
    
  }

  void tegnFlue(){//her tegner den selve fluen, med en matrix da de er en transformerene flue,
      pushMatrix();
  if ((positionX > width) || (positionX < 0)) {// her har jeg tilføjet at den bouncer tilbage, dog er det helt mærkeligt, og ved ikke hvorfor.
    distanceFlyttet = distanceFlyttet * -1;//her gør det så det bouncer.
  }
  if (positionY > height || (positionY < 0)){
    distanceFlyttet = distanceFlyttet * -0.95; 
    positionY = height;
  }
      translate(positionX,positionY);
    rotate(vinkel);//rotere den med en vinkel på 0,2 * pi.
      translate(distanceFlyttet,0);
      scale(bigness);//ny addet scale som gør det 10% større.
              ellipse(0+0,0,20,8);//tegner fluens krop (alle ellipse)
        ellipse(0,0+0-5,20-5,5+5);
        ellipse(0,0+0+5,20-5,5+5);
        ellipse(0,0,20-12+0,5+3);
popMatrix();          

 
  } 

     
    }



//////////////////////////////////////////////////////
