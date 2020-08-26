Jugador j1;
Enemigo orco1;
Enemigo orco2;
Enemigo orco3;
Enemigo orco4;
Enemigo orco5;
Enemigo orco6;
Enemigo orco7;
Enemigo orco8;
Enemigo orco9;
Enemigo orco10;
Enemigo orco11;
Enemigo orco12;
Enemigo orco13;
Enemigo orco14;
Enemigo orco15;
int cont;
Enemigo array[] = new Enemigo[15]; //array con todos los enemmigos
Boton Creditos; //boton usado para los creditos y para siguiente
Boton Siguiente; //boton siguiente
Boton Atras; //boton de atras usado en los creditos 
Boton Restart;
int score; //

boolean menu; //variable para instanciar el menu
String nombreImagen;
int frame;
PImage []imagenes= new PImage[10];//array de fondos usados como el menu creditos historia y escenas

void setup(){
  size(1200,700);
  j1= new Jugador(98, 272, 100);
  
  orco1= new Enemigo( 466, 272, 616, 272);
  array[0]=orco1;
  orco2= new Enemigo( 812, 160, 812, 272);
  array[1]=orco2;
  orco3= new Enemigo( 130, 494, 130, 494);
  array[2]=orco3;  
  orco4= new Enemigo( 816, 494, 816, 494);
  array[3]=orco4;  
  orco5= new Enemigo( 466, 272, 616, 272);
  array[4]=orco5;
  orco6= new Enemigo( 812, 160, 812, 272);
  array[5]=orco6;
  orco7= new Enemigo( 130, 494, 130, 494);
  array[6]=orco7;
  orco8= new Enemigo( 816, 494, 816, 494);
  array[7]=orco8;
  orco9= new Enemigo( 466, 272, 616, 272);
  array[8]=orco9;
  orco10= new Enemigo( 812, 160, 812, 272);
  array[9]=orco10;
  orco11= new Enemigo( 130, 494, 130, 494);
  array[10]=orco11;
  orco12= new Enemigo( 816, 494, 816, 494);
  array[11]=orco12;
  
  
  
  cont=0;
  Creditos= new Boton(948, 617, 238, 55, "Creditos");
  Atras= new Boton(46, 32, 104, 95, "Atras");
  Siguiente= new Boton(499,651,211,30, "Siguiente");
  Restart = new Boton(938, 600, 200, 100, "restart");
  menu=true;
  frame=0;
  for(int i=0; i< imagenes.length; i++){ //carga de fondos en array
    nombreImagen = "background" + i +".png";
    imagenes[i]= loadImage(nombreImagen);
  }
}

void draw(){
  if(menu==true){//siepre inicia con esta opcion la primera vez y cuando se da atras en creditos
    image(imagenes[frame],0 ,0);
    if(Creditos.opcion()==true && frame==0){//si se clickea en creditos se accede a ese fotograma
      frame=1;
    }
    else if(Atras.opcion()==true && frame==1){//atras lleva a menu
      frame=0;
    }
  }


  if(keyPressed == true && frame==0 && menu==true){//presionando cualquier tecla y cuando se esta en menu inicia el juego con la historia
    menu=false;
    frame=2;
  }
  
  if(frame==2){//historia 1
    image(imagenes[2],0 ,0);
    if(Creditos.opcion()==true){
      frame=3;
    }
  }
  
  if(frame==3){//historia 2
    image(imagenes[3],0 ,0);
    if(Siguiente.opcion()==true){
      frame=4;;
    }
  }
  
  
  
  

  if(frame==4){// sala 1 juego
    background(0);
    image(imagenes[4], 0,0);
    image(imagenes[9], 1001, 300);
    textSize(30);
    textAlign(CENTER);
    text(j1.getVida(),1100, 350);
    j1.display();
    for(int i=0; i<4; i++){//for usado para dibujar los enemigos del array
      array[i].display();
    }
    
    
    
    for(int i=0; i<4; i++){//enemigos atacando
      if(j1.getX()==array[i].getX()+50){//cuando el enemigo esta a la izquierda
        if(array[i].getY()<=j1.getY() && j1.getY()<=array[i].getY()+50){
          if(array[i].getVida()==true){
            if(cont<1){
              j1.setVida();
              cont +=1;
            }
            if(j1.getFrame()==4){
              array[i].setVida(false);
            }
          }
        }
      }
      if(j1.getY()==array[i].getY()+50){ //cuando el enemigo esta arriba
        if(array[i].getX() <= j1.getX() && j1.getX() <= array[i].getX()+50){
          if(array[i].getVida()==true){
            if(cont<1){
              j1.setVida();
              cont +=1;
            }
            if(j1.getFrame()==8){
              array[i].setVida(false);
            }
          }
        }
      }
      if(j1.getX()+50==array[i].getX()){//cuando el enemigo esta a la derecha
        if(array[i].getY() <= j1.getY() && j1.getY()<=array[i].getY() + 50){
          if(array[i].getVida()==true){
              if(cont<1){
                j1.setVida();
                cont +=1;
              }
              if(j1.getFrame()==3){
                array[i].setVida(false);
              }
            }
        }
      }
      if(j1.getY()+50== array[i].getY()){//abajo
        if(array[i].getX() <= j1.getX() && j1.getX() <= array[i].getX()+50){
          if(array[i].getVida()==true){
            if(cont<1){
              j1.setVida();
              cont +=1;
            }
            if(j1.getFrame()==9){
              array[i].setVida(false);
              print("acierto");
            }
          }
        }
      }
      if(cont==1){//cuando ya se ha completado dicho chance se reinicia
        cont=0;
      }
    }
    
    if(j1.getVida()<=0){//cuando el jugador muere
      frame=8;
    }
    
    if(j1.getX()>=892){
        frame=5;
        j1.setPosicion(98,272);
    }
    
    
    if(j1.getX()==166){//obstaculo 1 avion izquierda
      if(412<=j1.getY() && j1.getY()<=516){
        j1.setBloq(1);
      }
    }
    if(j1.getY()==404){//avion arriba
     if(166<=j1.getX()&& j1.getX()<=324){
       j1.setBloq(2);
     }
    }
    if(j1.getX()==324){//avion derecha
      if(412<=j1.getY() && j1.getY()<=516){
        j1.setBloq(3);
      }
    }
    
    
    //obstaculo cubo 1 
    if(166==j1.getX()){
      if(136<=j1.getY() && j1.getY()<=250){// izquierda
          j1.setBloq(1);
        }
    }
    if(j1.getX()==324){
      if(136<=j1.getY() && j1.getY()<=250){// derecha
        j1.setBloq(3);
      }
    }
    if(j1.getY()==250){
     if(166<=j1.getX() && j1.getX()<=324){// arriba
       j1.setBloq(0);
      }
    }
  
    //obstaculo cubo 2 medio
    if(390==j1.getX()){
      if(294<=j1.getY() && j1.getY()<=478){// izquierda
          j1.setBloq(1);
        }
    }
    if(j1.getX()==558){
      if(294<=j1.getY() && j1.getY()<=478){// derecha
        j1.setBloq(3);
      }
    }
    if(j1.getY()==478){
     if(390<=j1.getX() && j1.getX()<=558){// abajo
       j1.setBloq(0);
      }
    }
    if(j1.getY()==290){
     if(390<=j1.getX() && j1.getX()<=558){// arriba
       j1.setBloq(2);
      }
    }
  
      //obstaculo avion 2
    if(500==j1.getX()){
      if(136<=j1.getY() && j1.getY()<=250){// izquierda
          j1.setBloq(1);
        }
    }
    if(j1.getX()==676){
      if(136<=j1.getY() && j1.getY()<=250){// derecha
        j1.setBloq(3);
      }
    }
    if(j1.getY()==250){
     if(500<=j1.getX() && j1.getX()<=667){// arriba
       j1.setBloq(0);
      }
    }
    //obstaculo avion 3
 if(j1.getX()==616){//obstaculo avion 3 izquierda
      if(412<=j1.getY() && j1.getY()<=516){
        j1.setBloq(1);
      }
    }
    if(j1.getY()==404){//avion arriba
     if(616<=j1.getX()&& j1.getX()<=784){
       j1.setBloq(2);
     }
    }
    if(j1.getX()==784){//avion derecha
      if(412<=j1.getY() && j1.getY()<=516){
        j1.setBloq(3);
      }
    }
  }
 
    
  if(frame==5){ // SALA 2
    background(0);
    image(imagenes[5], 0,0);
    image(imagenes[9], 1001, 300);
    textSize(30);
    textAlign(CENTER);
    text(j1.getVida(),1100, 350);
    j1.display();
    for(int i=4; i<9; i++){//for usado para dibujar los enemigos del array
      array[i].display();
    }
    
    
    
    for(int i=4; i<9; i++){//enemigos atacando
      if(j1.getX()==array[i].getX()+50){//cuando el enemigo esta a la izquierda
        if(array[i].getY()<=j1.getY() && j1.getY()<=array[i].getY()+50){
          if(array[i].getVida()==true){
            if(cont<1){
              j1.setVida();
              cont +=1;
            }
            if(j1.getFrame()==4){
              array[i].setVida(false);
            }
          }
        }
      }
      if(j1.getY()==array[i].getY()+50){ //cuando el enemigo esta arriba
        if(array[i].getX() <= j1.getX() && j1.getX() <= array[i].getX()+50){
          if(array[i].getVida()==true){
            if(cont<1){
              j1.setVida();
              cont +=1;
            }
            if(j1.getFrame()==8){
              array[i].setVida(false);
            }
          }
        }
      }
      if(j1.getX()+50==array[i].getX()){//cuando el enemigo esta a la derecha
        if(array[i].getY() <= j1.getY() && j1.getY()<=array[i].getY() + 50){
          if(array[i].getVida()==true){
              if(cont<1){
                j1.setVida();
                cont +=1;
              }
              if(j1.getFrame()==3){
                array[i].setVida(false);
              }
            }
        }
      }
      if(j1.getY()+50== array[i].getY()){//abajo
        if(array[i].getX() <= j1.getX() && j1.getX() <= array[i].getX()+50){
          if(array[i].getVida()==true){
            if(cont<1){
              j1.setVida();
              cont +=1;
            }
            if(j1.getFrame()==9){
              array[i].setVida(false);
              print("acierto");
            }
          }
        }
      }
      if(cont==1){//cuando ya se ha completado dicho chance se reinicia
        cont=0;
      }
    }
    
    if(j1.getVida()<=0){//cuando el jugador muere
      frame=8;
    }
    
    if(j1.getX()>=892){
      if(frame==5){
        frame=6;  
        j1.setPosicion(98,272);
      }
    }
    
    
    
    //obstaculos
    
    
    if(j1.getX()==166){//obstaculo 1 avion izquierda
      if(412<=j1.getY() && j1.getY()<=516){
        j1.setBloq(1);
      }
    }
    if(j1.getY()==404){//avion arriba
     if(166<=j1.getX()&& j1.getX()<=324){
       j1.setBloq(2);
     }
    }
    if(j1.getX()==324){//avion derecha
      if(412<=j1.getY() && j1.getY()<=516){
        j1.setBloq(3);
      }
    }
    
    
    //obstaculo cubo 1 
    if(166==j1.getX()){
      if(136<=j1.getY() && j1.getY()<=250){// izquierda
          j1.setBloq(1);
        }
    }
    if(j1.getX()==324){
      if(136<=j1.getY() && j1.getY()<=250){// derecha
        j1.setBloq(3);
      }
    }
    if(j1.getY()==250){
     if(166<=j1.getX() && j1.getX()<=324){// arriba
       j1.setBloq(0);
      }
    }
  
      //obstaculo cubo 2 medio
    if(390==j1.getX()){
      if(294<=j1.getY() && j1.getY()<=478){// izquierda
          j1.setBloq(1);
        }
    }
    if(j1.getX()==558){
      if(294<=j1.getY() && j1.getY()<=478){// derecha
        j1.setBloq(3);
      }
    }
    if(j1.getY()==478){
     if(390<=j1.getX() && j1.getX()<=558){// abajo
       j1.setBloq(0);
      }
    }
    if(j1.getY()==290){
     if(390<=j1.getX() && j1.getX()<=558){// arriba
       j1.setBloq(2);
      }
    }
  
      //obstaculo avion 2
    if(500==j1.getX()){
      if(136<=j1.getY() && j1.getY()<=250){// izquierda
          j1.setBloq(1);
        }
    }
    if(j1.getX()==676){
      if(136<=j1.getY() && j1.getY()<=250){// derecha
        j1.setBloq(3);
      }
    }
    if(j1.getY()==250){
     if(500<=j1.getX() && j1.getX()<=667){// arriba
       j1.setBloq(0);
      }
    }
    //obstaculo avion 3
 if(j1.getX()==616){//obstaculo avion 3 izquierda
      if(412<=j1.getY() && j1.getY()<=516){
        j1.setBloq(1);
      }
    }
    if(j1.getY()==404){//avion arriba
     if(616<=j1.getX()&& j1.getX()<=784){
       j1.setBloq(2);
     }
    }
    if(j1.getX()==784){//avion derecha
      if(412<=j1.getY() && j1.getY()<=516){
        j1.setBloq(3);
      }
    }
  
  }
  
  
  if(frame==6){// sala 3 juego
    background(0);
    image(imagenes[6], 0,0);
    image(imagenes[9], 1001, 300);
    textSize(30);
    textAlign(CENTER);
    text(j1.getVida(),1100, 350);
    j1.display();
    for(int i=9; i<12; i++){//for usado para dibujar los enemigos del array
      array[i].display();
    }
    
    
    
    for(int i=9; i<12; i++){//enemigos atacando
      if(j1.getX()==array[i].getX()+50){//cuando el enemigo esta a la izquierda
        if(array[i].getY()<=j1.getY() && j1.getY()<=array[i].getY()+50){
          if(array[i].getVida()==true){
            if(cont<1){
              j1.setVida();
              cont +=1;
            }
            if(j1.getFrame()==4){
              array[i].setVida(false);
            }
          }
        }
      }
      if(j1.getY()==array[i].getY()+50){ //cuando el enemigo esta arriba
        if(array[i].getX() <= j1.getX() && j1.getX() <= array[i].getX()+50){
          if(array[i].getVida()==true){
            if(cont<1){
              j1.setVida();
              cont +=1;
            }
            if(j1.getFrame()==8){
              array[i].setVida(false);
            }
          }
        }
      }
      if(j1.getX()+50==array[i].getX()){//cuando el enemigo esta a la derecha
        if(array[i].getY() <= j1.getY() && j1.getY()<=array[i].getY() + 50){
          if(array[i].getVida()==true){
              if(cont<1){
                j1.setVida();
                cont +=1;
              }
              if(j1.getFrame()==3){
                array[i].setVida(false);
              }
            }
        }
      }
      if(j1.getY()+50== array[i].getY()){//abajo
        if(array[i].getX() <= j1.getX() && j1.getX() <= array[i].getX()+50){
          if(array[i].getVida()==true){
            if(cont<1){
              j1.setVida();
              cont +=1;
            }
            if(j1.getFrame()==9){
              array[i].setVida(false);
              print("acierto");
            }
          }
        }
      }
      if(cont==1){//cuando ya se ha completado dicho chance se reinicia
        cont=0;
      }
    }
    
    if(j1.getVida()<=0){//cuando el jugador muere
      frame=8;
    }
    
    if(j1.getX()>=892){
      if(frame==6){
        frame=7;  
        j1.setPosicion(98,272);
      }
    }
    
    
    //obstaculo cubo 1 
    if(166==j1.getX()){
      if(136<=j1.getY() && j1.getY()<=250){// izquierda
          j1.setBloq(1);
        }
    }
    if(j1.getX()==324){
      if(136<=j1.getY() && j1.getY()<=250){// derecha
        j1.setBloq(3);
      }
    }
    if(j1.getY()==250){
     if(166<=j1.getX() && j1.getX()<=324){// arriba
       j1.setBloq(0);
      }
    }
  
      //obstaculo cubo 2 medio
    if(390==j1.getX()){
      if(294<=j1.getY() && j1.getY()<=478){// izquierda
          j1.setBloq(1);
        }
    }
    if(j1.getX()==558){
      if(294<=j1.getY() && j1.getY()<=478){// derecha
        j1.setBloq(3);
      }
    }
    if(j1.getY()==478){
     if(390<=j1.getX() && j1.getX()<=558){// abajo
       j1.setBloq(0);
      }
    }
    if(j1.getY()==290){
     if(390<=j1.getX() && j1.getX()<=558){// arriba
       j1.setBloq(2);
      }
    }
  
      //obstaculo avion 2
    if(500==j1.getX()){
      if(136<=j1.getY() && j1.getY()<=250){// izquierda
          j1.setBloq(1);
        }
    }
    if(j1.getX()==676){
      if(136<=j1.getY() && j1.getY()<=250){// derecha
        j1.setBloq(3);
      }
    }
    if(j1.getY()==250){
     if(500<=j1.getX() && j1.getX()<=667){// arriba
       j1.setBloq(0);
      }
    }
    //obstaculo avion 3
 if(j1.getX()==616){//obstaculo avion 3 izquierda
      if(412<=j1.getY() && j1.getY()<=516){
        j1.setBloq(1);
      }
    }
    if(j1.getY()==404){//avion arriba
     if(616<=j1.getX()&& j1.getX()<=784){
       j1.setBloq(2);
     }
    }
    if(j1.getX()==784){//avion derecha
      if(412<=j1.getY() && j1.getY()<=516){
        j1.setBloq(3);
      }
    }
  }
  
  if(frame==7){
    image(imagenes[7], 0, 0);
    if(keyPressed == true){//presionando cualquier tecla y cuando se esta en menu inicia el juego con la historia
      menu=true;
      frame=0;
      j1.restart();
      for(int i=0; i<12 ; i++){
        array[i].restart();
      }
    }
  }
  
  if(frame==8){
   image(imagenes[8], 0, 0); 
   if(Restart.opcion()==true){//si se clickea en creditos se accede a ese fotograma
      menu=true;
      frame=0;
      j1.restart();
      for(int i=0; i<12 ; i++){
        array[i].restart();
      }
    }
  }
 
  print(frame);
  
  

}
