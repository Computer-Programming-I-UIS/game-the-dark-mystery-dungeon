class Enemigo{
  PImage []imagenes= new PImage[2];
  float x;
  float y;
  int frame;
  int vida;
  boolean combate;
  
  Enemigo(float tempX, float tempY, int tempVida){
    x=tempX;
    y=tempY;
    frame=0;
    combate=false;
    vida=tempVida;
    for(int i=0; i< imagenes.length; i++){
      String nombreImagen = "enemigo" + i +".png";
      imagenes[i]= loadImage(nombreImagen);
    }
  }
  
 /*void mover(){
   while(combate==false){
     int numero = (int)(Math.random()*3+1);
   distancia=this.
   if(Jugador.x<*/
    
    
  
  
  
  void display(){
    image(imagenes[0], x,y);
    
  }
}
