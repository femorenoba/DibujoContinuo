//pocision de los nodos
 int [] nodox = {100,300,500,300,200,400,300,100,300,500};
 int [] nodoy = {100,100,100,200,300,300,400,500,500,500};
 int [] nodo2x = {300,200,400,100,300,500};
 int [] nodo2y = {100,200,200,500,500,500};

 //donde existe conexion de nodos
int[][]conexion={{0,1,0,0,0,0,0,1,0,0},//1
                {1,0,1,1,0,0,0,0,0,0},
                {0,1,0,0,0,0,0,0,0,1},
                {0,1,0,0,1,1,1,0,0,0},
                {0,0,0,1,0,0,1,0,0,0},
                {0,0,0,1,0,0,1,0,0,0},
                {0,0,0,1,1,1,0,0,1,0},
                {1,0,0,0,0,0,0,0,1,0},
                {0,0,0,0,0,0,1,1,0,1},
                {0,0,1,0,0,0,0,0,1,0}};
int[][]conexionl1={{0,1,1,1,1,0},//1
                {1,0,1,1,1,0},
                {1,1,0,0,1,1},
                {0,1,0,0,1,0},
                {0,1,1,1,0,1},
                {0,0,1,0,1,0}};

 //Lineas
 int [] x1 = {100,500,300,100,300,300,300,300,300,300,300,100,500};
 int [] y1 = {500,500,200,100,100,100,200,200,400,400,400,500,500};
 int [] x2 = {100,500,300,300,500,300,200,400,400,200,300,300,300};
 int [] y2 = {100,100,400,100,100,200,300,300,300,300,500,500,500};
 int [] x11 = {300,300,400,200,300,500,400,300,100};
 int [] y11 = {100,100,200,200,500,500,200,500,500};
 int [] x12 = {200,400,200,100,500,400,300,200,300};
 int [] y12 = {200,200,200,500,500,200,500,200,500};
//variables 
int a,c,aux=0,cont=0,nivel = 0;
int f,g,auxl=0,contl=0;
// crear arreglo para guardar las pocisiones de las lineas que se van dibujando.
int []lineas=new int[4];
int []lineasl=new int[4];
//nueva matriz que se rellena para saber si pierde o gana.
int [][]conexion2=new int[10][10];
int [][]conexionl2=new int[10][10];

void setup() { 

size(600, 600);
background(0); 
}

void draw(){
  
  switch(nivel){
  
  case 0:
     
     fill(210,250,280);
     textSize(20);
     text("Seleccione un nivel para empezar", 10,30);
     
     fill(250,0,0);
     rect(350,22,90,50);
     fill(0);
     textSize(25);
     text("Nivel 1", 351, 52);
     fill(250,0,0);
     rect(450,22,90,50);
     fill(0);
     textSize(25);
     text("Nivel 2", 451,52);
     
     if(mousePressed){
       if(350 <= mouseX && mouseX <= 440 && 22 <= mouseY && mouseY <= 72){
         nivel += 1;
       }
       if(450 <= mouseX && mouseX < 540 && 22 <= mouseY && mouseY <= 72){
         nivel += 2;
       }
     }
    
  break;
  
  case 1:
  
  //dibujar las lineas de guia 
  stroke(0,250,0);
  strokeWeight(10);
  for(int i=0; i < x1.length; i++) {
  line(x1[i],y1[i],x2[i],y2[i]); 
 }
 //dibujar puntos de guia
 fill(100,100,250);
 strokeWeight(0);
 for(int i=0; i< nodox.length; i++) {
  ellipse(nodox[i],nodoy[i],30,30); 
} 

 if(cont == 13){
    fill(255);
    rect(0,0,height,width);
    fill(0);
    textSize(25);
    text("Ganaste, felicitaciones.",(height/2)-100,width/2);
  }
  break;
  
  case 2:
  
  //dibujar las lineas de guia 
  stroke(0,250,0);
  strokeWeight(10);
  for(int i=0; i < x11.length; i++) {
  line(x11[i],y11[i],x12[i],y12[i]); 
 }
 //dibujar puntos de guia
 fill(100,100,250);
 strokeWeight(0);
 for(int i=0; i< nodo2x.length; i++) {
  ellipse(nodo2x[i],nodo2y[i],30,30); 
} 
 
 if(contl == 9){
    fill(255);
    rect(0,0,height,width);
    fill(0);
    textSize(25);
    text("Ganaste, felicitaciones.",(height/2)-100,width/2);
  }
  
  break;
  }
}

void mouseClicked(){
  
  //condicion si el aux es 0 entonces cuando precione algun nodo sera la pocision inicial de la linea
  if(aux==0){
  for(a=0;a<nodoy.length;a++){  
  if((mouseX>=(nodox[a]-15))&&(mouseX<=(nodox[a]+15))&&(mouseY>=(nodoy[a]-15))&&(mouseY<=(nodoy[a]+15))){
  lineas[0]=nodox[a];
  lineas[1]=nodoy[a];
  c=a;
  aux++; 
      }
    }
  }
 else{
   // segunda condicion para rellenar la pocision final de la linea.
 for(a=0;a<nodoy.length;a++){
  if((mouseX>=(nodox[a]-15))&&(mouseX<=(nodox[a]+15))&&(mouseY>=(nodoy[a]-15))&&(mouseY<=(nodoy[a]+15))){
  lineas[2]=nodox[a];
  lineas[3]=nodoy[a];
  
  // si en la pocision de la matriz conexion es 1 entonces dibuja la linea.
  if(conexion[c][a]==1){
    stroke(250,0,0);
    strokeWeight(30);
    line(lineas[0],lineas[1],lineas[2],lineas[3]);
  lineas[0]=lineas[2];
  lineas[1]=lineas[3];
  conexion2[a][c]=conexion2[a][c]+1;
  conexion2[c][a]=conexion2[c][a]+1;
  
  // Perder si repite linea, cuando el valor de la matriz es mayor a 1 gracias al contador
  if((conexion2[a][c]>1)&&(conexion2[c][a]>1)){
  fill(30,30,230);
  textSize(29);//tamaño del texto  
  text("Lo sentimos, repetiste linea :(",30,60);
  }; c=a;cont++;}
      }
    }
  }
  
  //condicion si el aux es 0 entonces cuando precione algun nodo sera la pocision inicial de la linea
  if(auxl==0){
  for(f=0;f<nodo2y.length;f++){  
  if((mouseX>=(nodo2x[f]-15))&&(mouseX<=(nodo2x[f]+15))&&(mouseY>=(nodo2y[f]-15))&&(mouseY<=(nodo2y[f]+15))){
  lineasl[0]=nodo2x[f];
  lineasl[1]=nodo2y[f];
  g=f;
  auxl++; 
      }
    }
  }
 else{
   // segunda condicion para rellenar la pocision final de la linea.
 for(f=0;f<nodo2y.length;f++){
  if((mouseX>=(nodo2x[f]-15))&&(mouseX<=(nodo2x[f]+15))&&(mouseY>=(nodo2y[f]-15))&&(mouseY<=(nodo2y[f]+15))){
  lineasl[2]=nodo2x[f];
  lineasl[3]=nodo2y[f];
  
  // si en la pocision de la matriz conexion es 1 entonces dibuja la linea.
  if(conexionl1[g][f]==1){
    stroke(250,0,0);
    strokeWeight(30);
    line(lineasl[0],lineasl[1],lineasl[2],lineasl[3]);
  lineasl[0]=lineasl[2];
  lineasl[1]=lineasl[3];
  conexionl2[f][g]=conexionl2[f][g]+1;
  conexionl2[g][f]=conexionl2[g][f]+1;
  
  // Perder si repite linea, cuando el valor de la matriz es mayor a 1 gracias al contador
  if((conexionl2[f][g]>1)&&(conexionl2[g][f]>1)){
  fill(30,30,230);
  textSize(29);//tamaño del texto  
  text("Lo sentimos, repetiste linea :(",30,60);
  }; g=f;contl++;}
      }
    }
  }
}

  
