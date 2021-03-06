ArrayList<Flue> flueListe = new ArrayList<Flue>();//laver en liste over variabler.
//float distanceFlyttet;//
float c=20;
float a=0.0;
float s=0.0;
float d=5;
float b=random(0,height);
float g =random(0,width);
Flue Flueliste1  = new Flue(b,g); //min form for konstruktør som skal opdatere fluens størrelse.
Flue liste1 =new Flue();//hver gang du trykket laver den en ny flue som spawner ved siden af den anden flue.
void setup(){//laver et setup der kører 1 gang
  size(500,500);//laver et vindue der har størrelsen på 500 * 500 pixels, bredde og længde.
}

void draw(){//kører 60 gange i sekundet.
  for(int i=0; i<flueListe.size(); i++){//laver et for-loop, i sammearbejde med arraylisten over variabler.
    Flue f = flueListe.get(i);
    f.tegnFlue();//her gør den muligt til void tegnflue længere nede
    f.flyt();// samme som tegnFlue.
    liste1.tegnFlue2();//gør så der bliver tegnet 2. 
  }
  }

void keyPressed(){//en funktion det tegnes hvis en given knap bliver trykket.

  if(keyPressed){
    if(key=='e'){//hvis du trykker e aktivere dette.
         a=a+0.5;
      s=a*12;
     
      translate(width/2,height/2);
      scale(s); //her fortæller jeg at den skal scale i størrelse forhold til værdierne når man trykker e.
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
 
  
  Flue(){
    positionX  = random(0,height);//tilfældig mellem 0 og højden. på fluen.
    positionY  = random(0,width);// gør det tilfældigt mellem 0 og bredden.
    vinkel     = random(0,2*PI);//vinkel er tilfældig.
  }
  
  Flue(float a, float b){
    positionX = a;
    positionY = b;
    vinkel    = random(0,2*PI);
  }
  
  void flyt(){
    distanceFlyttet = distanceFlyttet + 0.5;// her hvor fluen bevæger sig.
  }

  void tegnFlue(){//her tegner den selve fluen, med en matrix da de er en transformerene flue,
      pushMatrix();
      translate(positionX,positionY);
      rotate(vinkel);//rotere den med en vinkel på 0,2 * pi.
      translate(distanceFlyttet,0);
      scale(1,1);//ny addet scale som gør det 10% større.
        ellipse(0,0,c,8);//tegner fluens krop (alle ellipse)
        ellipse(0,0-d,c-5,d+5);
        ellipse(0,0+d,c-5,d+5);
        ellipse(0+6,0,c-12,d+3);
  } 


void tegnFlue2(){
  
  translate(b,g);//her translater den så der kommer en stor ved siden af den lille
  //rotate(vinkel);
  //translate(distanceFlyttet,0);
  scale(1.3);
  ellipse(0,0,c,8+s); // bliver først aktiveret når man trykke e, da værdien er nuværende 0,0.
        ellipse(0+0,0+0,s,a);
        ellipse(0+0,0+d+0,s,a);
        ellipse(0+6+0,0+0,s,a);
   popMatrix(); // bruges da flere fluer bevæger sig i sammenhæng med et koordinatsystem.
}
  

     
    }



//////////////////////////////////////////////////////
