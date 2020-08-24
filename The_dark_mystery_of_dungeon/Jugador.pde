class Jugador{
  PImage []imagenes= new PImage[5];
  float x;
  float y;
  int frame;
  int vida, limite;
  
  Jugador(float tempX, float tempY, int tempVida){
    x=tempX;
    y=tempY;
    vida=tempVida;                              
    frame=0;
    for(int i=0; i< imagenes.length; i++){
      String nombreImagen = "Jugador" + i +".png";
      imagenes[i]= loadImage(nombreImagen);
    }
  }
  
 void mover(){
    if(keyPressed && (key == CODED)){
      if(keyCode == LEFT){
        if(x>=0){ //si esta lejos del limite izquierdo puede moverse a la izquierda
          x -=2; 
          frame=0;
        }
      }
      if(keyCode == RIGHT){
        if(x<=600){ //si está lejos del limite derecho de la pantalla puede moverse a la derecha
          x +=2;
          frame=1;
        }
      }
      if(keyCode == UP){
        if(y>=0){ //si está lejos del limite superior de la pantalla puede moverse hacia arriba
            y -=2;
            frame=2;
        }
      }
      if(keyCode == DOWN){
        if(y<=600){ //si está lejos del limite inferior de la pantalla puede moverse hacia abajo
          y +=2;
          frame=0;
        }
      }
    }
  }
  
  void atacar(){
    if(keyPressed){
      if((key == 'a') || (key == 'A')){
        if(frame==1){
          frame=3;
        }
        if(frame==0){
          frame=4;
        }
      }
    }
   }
  

   
  
  void display(){
    image(imagenes[frame], x,y);
    if(frame==3){
      frame=1;
    }
    if(frame==4){
      frame=0;
    }
    atacar();
    mover();
  }
 }
