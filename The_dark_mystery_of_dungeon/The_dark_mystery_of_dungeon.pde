Jugador j1;

Boton Creditos;//sirve tambien para atras

boolean menu; //variable para instanciar el menu
String nombreImagen;
int sala;
PImage []imagenes= new PImage[4];

void setup(){
  size(1200,700);
  j1= new Jugador(500, 300, 100);
  Creditos= new Boton(948, 617, 238, 55, "Creditos");
  menu=true;
  
  nombreImagen= "Menu.png";
  imagenes[0]= loadImage(nombreImagen);
  for(int i=1; i< imagenes.length; i++){
    nombreImagen = "sala" + i +".png";
    imagenes[i]= loadImage(nombreImagen);
  }
}

void draw(){
  if(menu==true){
    image(imagenes[0], 0,0);
  }
  
  if(Creditos.opcion()==true && menu==true){
    image(imagenes[1], 0, 0);
    menu=false;
  }
  
  
  
  if(cr==true){
    rect(948, 617, 238, 55);
    menu=false;
  }
  

  
  if(keyPressed == true && cr==false){
    menu=false;
  }


  if(menu==false&&cr==false){
    background(0);
    image(imagenes[1], 0,0);
    j1.display();
  }
  
  

}
