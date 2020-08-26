class Jugador{
  PImage []imagenes= new PImage[10]; //array de sprites
  float x;
  float y;
  int dire;
  int frame;//variable para mostrar el sprite deseado
  int vida, limite;//vida actual y limite de la misma
  int bloq; //variable usada para bloquear el movimiento en las direcciones 0(arriba), 1(derecha), 2(abajo), 3(izquierda)
  
  Jugador(float tempX, float tempY, int tempVida){
    bloq=4; 
    x=tempX;
    y=tempY;
    vida=tempVida;                              
    frame=0;
    for(int i=0; i< imagenes.length; i++){
      String nombreImagen = "Jugador" + i +".png";
      imagenes[i]= loadImage(nombreImagen);
    }
  }
  
  float getFrame(){
    return frame;
  }
  
  float getX(){
    return x;
  }
  
  float getY(){
    return y;
  }
  
  void setPosicion(float tempX,float tempY){
    x=tempX;
    y=tempY;
  }
  
  
  void setBloq(int bloqTemp){//
    bloq=bloqTemp;
  }
  
  int getVida(){
    return vida;
  }
  
  void restart(){
    vida=100;
  }
    
  
  void setVida(){
    vida =vida-10;
  }
    
  
 void mover(){
    if(keyPressed && (key == CODED)){
      if(keyCode == LEFT){
        if(x>=100){ //si esta lejos del limite izquierdo puede moverse a la izquierda
          if(bloq!=3){
            x -=2; 
            if(frame==0){
              frame=7;
            }
            else{
              frame=0;
            }
            dire=3;
            bloq=4;
          }
        }
      }
      if(keyCode == RIGHT){
        if(x<=840){ //si está lejos del limite derecho de la pantalla puede moverse a la derecha
          if(bloq!=1){
              x +=2;
              if(frame==1){
                frame=6;
              }
              else{
                frame=1;
              }
            }
            dire=1;
            bloq=4;
        }
        else if(x>=842){
          if(240<=y && y<=288){
            x =x+2;
          }
        }
      }
      if(keyCode == UP){
        if(y>=138){ //si está lejos del limite superior de la pantalla puede moverse hacia arriba
            if(bloq!=0){
              y -=2;
              if(frame==2){
                frame=5;
              }
              else{
                frame=2;
              }
            }
            dire=0;
            bloq=4;
        }
      }
      if(keyCode == DOWN){
        if(y<=515){ //si está lejos del limite inferior de la pantalla puede moverse hacia abajo
          if(bloq!=2){
            y +=2;
            if(frame==0){
              frame=6;
            }
            else{
              frame=0;
            }
          }
          dire=2;
          bloq=4;
        }
      }
    }
    //println(x+ "          "+ y+ "      "+ bloq); pruebas de posicion
  }
  
  void atacar(){
    if(keyPressed){//con la tecla a activa el ataque
      if((key == 'a') || (key == 'A')){
        if(frame==1||frame==6){
          frame=3;
        }
        if(frame==0||frame==7){
          frame=4;
        }
        if(dire==0){
          frame=8;
        }
        if(dire==2){
          frame=9;
        }
      }
    }
   }
  

   
  
  void display(){
    image(imagenes[frame], x,y);
    atacar();
    mover();
  }
 }
