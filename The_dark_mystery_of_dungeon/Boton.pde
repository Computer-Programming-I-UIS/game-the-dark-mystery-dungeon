class Boton{
  float x, y;
  float ancho, alto;
  int r, g, b;
  String texto;
  boolean estado;
  
  Boton(float tempX, float tempY, float tempAncho, float tempAlto, String tempTexto){
    x=tempX;
    y=tempY;
    ancho=tempAncho;
    alto=tempAlto;
    texto=tempTexto;
    r=206;
    g=206;
    b=206;
    estado= false;
  }
  
  public boolean opcion(){ //funcion que verifica cuando se haya hecho clic en una zona en especidfica
    if(x<mouseX && x+ancho>mouseX && y<mouseY && y+alto>mouseY){//si el cursor esta en el boton reset
      if(mousePressed && (mouseButton == LEFT)){//clic izquierdo y presionado
        return true;
      }
    }
    return false;
  }

      
    
  void display(){
    
  }
}
