class Enemigo{
  PImage []imagenes= new PImage[4]; //array de sprites
  float xini, xfin, x;
  float yini, yfin, y;
  int frame; //indica el sprite mostrado
  boolean vida;
  boolean combate;
  int dire;// direccion del enemigo para moverse 0 o 1
  
  Enemigo(float tempX, float tempY, float xfTemp, float yfTemp){//constructor
    x=tempX;
    xini=tempX;
    y=tempY;
    yini=tempY;
    xfin=xfTemp;
    yfin=yfTemp;
    frame=0;
    vida=true;
    
  //  vida=tempVida;
    for(int i=0; i< imagenes.length; i++){//se cargan las imagenes para enemigo usando un array
      String nombreImagen = "Enemigo" + i +".png";
      imagenes[i]= loadImage(nombreImagen);
    }
  }
  
  float getX(){
    return x;
  }
  float getY(){
    return y;
  }
  
  boolean getVida(){
    return vida;
  }
  void setVida(boolean tempV){
    vida=tempV;
  }
  
  void restart(){
    vida=true;
  }
  
  void mover(){ //los enemigos se mueven de (x,y) inicial a (x,y) final
    if(xini!=xfin){//si las x son distintas se mueve horizontalmente
      
      if(x==xini){//cuando la posicion sea igual a la inicial se movera a la derecha
        dire=1;
      }
      if(x==xfin){// cuando la posicion sea igual que la final se movera a la izquierda
        dire=0;
      }
      
      if(dire==0){//usando la instancia direccion se cambian los valores de x
        x -=1;
        if(frame==0){
          frame=1;
        }
        else{
          frame=0;
        }
      }
      
      if(dire==1){
        x +=1;
        if(frame==0){
          frame=1;
        }
        else{
          frame=0;
        }
      }
      
    }
    
    if(yini!=yfin){//para verificar si su movimiento será vertical
      if(y==yini){
        dire=1;
      }
      
      if(y==yfin){
        dire=0;
      }
      
      if(dire==0){
        y -=1;
        if(frame==3){
          frame=2;
        }
        else{
          frame=3;
        }
      }
      
      if(dire==1){
        y +=1;
        if(frame==0){
          frame=1;
        }
        else{
          frame=0;
        }
      }
    }
  }
  
  
  void display(){
    if(vida==true){
      mover();
      image(imagenes[frame], x,y);
    }
  }
}
