 //Conexion de nodos
 int pos = 0;
 int[][] conexion = {   {0,1,0,0,0,0,0,1,0,0},
                        {1,0,1,1,0,0,0,0,0,0},
                        {0,1,0,0,0,0,0,0,0,1},
                        {0,1,0,0,1,1,0,0,0,0},
                        {0,0,0,1,0,0,1,0,0,0},
                        {0,0,0,1,0,0,1,0,0,0},
                        {0,0,0,0,1,1,0,0,1,0},
                        {1,0,0,0,0,0,0,0,1,0},
                        {0,0,0,0,0,0,1,1,0,1},
                        {0,0,1,0,0,0,0,0,1,0}  };
 //Puntos

 int [] x = {100,300,500,300,200,400,300,100,300,500};
 int [] y = {100,100,100,200,300,300,400,500,500,500};
 //Lineas
 int [] x1 = {100,500,300,100,300,300,300,300,300,300,300,100,500};
 int [] y1 = {500,500,200,100,100,100,200,200,400,400,400,500,500};
 int [] x2 = {100,500,300,300,500,300,200,400,400,200,300,300,300};
 int [] y2 = {100,100,400,100,100,200,300,300,300,300,500,500,500};

void setup() { 

size(600, 600);
background(0); 
}

void draw(){

 //lineas 
  stroke(0,250,0);
  strokeWeight(10);
  for(int i=0; i < x1.length; i++) {
  line(x1[i],y1[i],x2[i],y2[i]); 
 }
 //puntos
 fill(100,100,250);
 strokeWeight(0);
 for(int i=0; i< x.length; i++) {
  ellipse(x[i],y[i],30,30); 
} 

}
void mouseClicked() {
/*int i=0;
 int j=0;
int[][] conexion = new int[i][j]; 
  */
  x[pos] = mouseX;
  y[pos] = mouseY;
  pos = (pos+1) ;

  for (int a = 0; a < conexion.length; a++) {
   //if ( conexion [i][j] == 1) {
   
    stroke(0,25,250);
    strokeWeight(10);
    line(  x[pos], y[pos], mouseX, mouseY); 
}  
}
