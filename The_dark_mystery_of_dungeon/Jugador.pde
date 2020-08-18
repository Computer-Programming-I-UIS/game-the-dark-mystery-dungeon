class Jugador{
  PImage []imagenes= new PImage[2];
  float x;
  float y;
  int frame;
  
  Jugador(float tempX, float tempY){
    x=tempX;
    y=tempY;
    frame=0;
    for(int i=0; i< imagenes.length; i++){
      String nombreImagen = "jugador" + i +".png";
      imagenes[i]= loadImage(nombreImagen);
    }
  }
  
 void mover(){
    if(keyPressed && (key == CODED)){
      if(keyCode == LEFT){
        if(x>=0){ //si esta lejos del limite izquierdo puede moverse a la izquierda
          x -=2; 
        }
      }
      if(keyCode == RIGHT){
        if(x<=600){ //si está lejos del limite derecho de la pantalla puede moverse a la derecha
          x +=2;
        }
      }
      if(keyCode == UP){
        if(y>=0){ //si está lejos del limite superior de la pantalla puede moverse hacia arriba
            y -=2;
        }
      }
      if(keyCode == DOWN){
        if(y<=600){ //si está lejos del limite inferior de la pantalla puede moverse hacia abajo
          y +=2; 
        }
      }
    }
  }
  
  void atacar(){
    if(keyPressed){
      if((key == 'a') || (key == 'A')){
        image(imagenes[frame],x,y);
        frame++;
        if(frame>=imagenes.length){
          frame=0;
        }      
      }
    }
   }

   
  
  void display(){
    image(imagenes[0], x,y);
    atacar();
    mover();
  }
 }


  
