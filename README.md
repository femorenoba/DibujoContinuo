# DibujoContinuo
 //Puntos
 PImage img;
 int [] x = {100,100,300,300,300,300,200,400,500,500};
 int [] y = {100,500,100,500,200,400,300,300,100,500};
 //Lineas
 int [] x1 = {100,500,300,100,300,300,300,300,300,300,300,100,500};
 int [] y1 = {500,500,200,100,100,100,200,200,400,400,400,500,500};
 int [] x2 = {100,500,300,300,500,300,200,400,400,200,300,300,300};
 int [] y2 = {100,100,400,100,100,200,300,300,300,300,500,500,500};

void setup() { 
img = loadImage("Figura.jpg");
size(900, 600);
background(0); 
}

void draw(){
  image(img, 650 , 100);
 /*//lineas 
  stroke(0,250,0);
  strokeWeight(10);
  for(int i=0; i < x1.length; i++) {
  line(x1[i],y1[i],x2[i],y2[i]); 
 }*/
 //puntos
 fill(100,100,250);
 strokeWeight(0);
 for(int i=0; i< x.length; i++) {
  ellipse(x[i],y[i],30,30); 
}
 
}
