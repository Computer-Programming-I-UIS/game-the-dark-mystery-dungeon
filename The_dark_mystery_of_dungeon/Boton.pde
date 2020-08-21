class Boton{
  float x, y;
  float ancho, alto;
  int r, g, b;
  String texto;
  
  
  Boton(float tempX, float tempY, float tempAncho, float tempAlto, String tempTexto){
    x=tempX;
    y=tempY;
    ancho=tempAncho;
    alto=tempAlto;
    texto=tempTexto;
    r=206;
    g=206;
    b=206;
  ;  }
  

      
    
  void display(){
    strokeWeight(1);
    fill(r, g, b);
    rect(x, y, ancho, alto);
    fill(0);
    textSize(30);
    textAlign(CENTER);
    text(texto, x+ancho/2, y+alto/2+5);
  }
}
