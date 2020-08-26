class Objetos{//en proceso
  float x;
  float y;
  int frame;
  
  Objetos(float tempX, float tempY){
    x=tempX;
    y=tempY;
    frame=0;
    for(int i=0; i< imagenes.length; i++){
      String nombreImagen = "Objeto" + i +".png";
      imagenes[i]= loadImage(nombreImagen);
    }
  }
  
    void display(){
    //image(imagenes[0], x,y);
    
  }
}
    
