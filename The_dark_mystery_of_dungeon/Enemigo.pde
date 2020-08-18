class Enemigo{
  PImage []imagenes= new PImage[2];
  float x;
  float y;
  int frame;
  
  Enemigo(float tempX, float tempY){
    x=tempX;
    y=tempY;
    frame=0;
    for(int i=0; i< imagenes.length; i++){
      String nombreImagen = "enemigo" + i +".png";
      imagenes[i]= loadImage(nombreImagen);
    }
  }
  
  
  void display(){
    image(imagenes[0], x,y);
    
  }
}
