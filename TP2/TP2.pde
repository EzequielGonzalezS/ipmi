// VARIABLES PARA LA ARENA 
float arenaX1, arenaY1, arenaVel1;
float arenaX2, arenaY2, arenaVel2;
float arenaX3, arenaY3, arenaVel3;
boolean arenaInicializada = false;    
float alphaFin = 0;                  

// POSICIONES Y MOVIMIENTO
float yTitulo = -100;
float yProta = 500;
float yProta2 = 500;
float yJoe = 500;
float yMaxFuriosa = 480;
float yFondo3 = 480;

// TRANSPARENCIAS
int alphaFuriosa = 255;
int alphaMax = 255;
int alphaTexto1 = 0;
int alphaTexto2 = 0;
int alphaTexto3 = 0;
int alphaMaxFuriosa = 0;
int inicioPantalla4 = 0;
int alphaJoe = 255;

// TIEMPOS Y PAUSAS
int pausaTexto = 0;
int pausaTexto2 = 0;
int tiempoTexto1 = 0;
int tiempoTexto2 = 0;
int pausaTexto3 = 0;
int tiempoTexto3 = 0;

int pantalla = 0;
int tiempo;

// FUENTES
PFont fuenteTitulo;
PFont fuenteTexto;

// IMÁGENES
PImage fondo1;
PImage fondo2;
PImage fondo3;
PImage fondo4;
PImage fondo5;
PImage prota;
PImage prota2;
PImage malo1;
PImage maxyfuriosa;

void setup() {
  size(640, 480);
  fuenteTexto = loadFont("LucidaConsole-48.vlw");
  fuenteTitulo = loadFont("Arial-Black-48.vlw");
  
  fondo1 = loadImage("madmax1.jpg");
  fondo2 = loadImage("fondodesierto.jpg");
  fondo3 = loadImage("cuidadela.jpg");
  fondo4 = loadImage("fondo4.png");
  fondo5 = loadImage("fondo5.jpg");
  prota = loadImage("prota.png");
  prota2 = loadImage("furiosa.png");
  malo1 = loadImage("joe2.png");
  maxyfuriosa = loadImage("maxyfuriosa.png");
  
  tiempo = millis(); 
}

void draw() { 
  // CAMBIO DE PANTALLAS AUTOMÁTICO 
  if (pantalla > 0 && millis() - tiempo > 30000) {
    pantalla++;
    tiempo = millis();
  }

  // EVITA QUE AUMENTE INFINITAMENTE
  if (pantalla > 4) {
    pantalla = 4;
  }

  // CONTROL DE PANTALLAS
  if (pantalla == 0) {
    pantalla1();
  } else if (pantalla == 1) {
    pantalla2();
  } else if (pantalla == 2) {
    pantalla3();
  } else if (pantalla == 3) {
    pantalla4();
  } else if (pantalla == 4) {
    pantalla5();
  }
}

void pantalla1() {
  background(0);
  image(fondo1, 0, 0, width, height);
  
  // SOMBRA
  fill(0, 120);
  textFont(fuenteTitulo, 80);
  if (yTitulo < 120) {
    yTitulo += 0.9;
  }
  text("MAD MAX", 115, yTitulo);
  
  // TEXTO AMARILLO
  fill(214, 180, 52);
  textFont(fuenteTitulo, 80);
  if (yTitulo < 130) {
    yTitulo += 0.9;
  }
  text("MAD MAX", 130, yTitulo);
  
  // APARICIÓN DEL BOTÓN PLAY
  if (yTitulo >= 130) {
    if (mouseX > 240 && mouseX < 400 && mouseY > 320 && mouseY < 380) {
      fill(200, 50, 50);
    } else {
      fill(120, 20, 20);
    }
    rect(240, 320, 160, 60, 10);

    fill(255);
    textFont(fuenteTitulo, 28);
    text("PLAY", 275, 360);
  }
}

void pantalla2() {
  background(0);
  image(fondo2, 0, 0, width, height);

  // FURIOSA
  if (yProta2 > 180) {
    yProta2 -= 2;
  }

  tint(255, alphaFuriosa);
  image(prota2, 0, yProta2, 240, 300);
  noTint();

  if (yProta2 <= 180) {
    if (pausaTexto == 0) { pausaTexto = millis(); }
    if (tiempoTexto1 == 0) { tiempoTexto1 = millis(); }

    if (millis() - pausaTexto > 1000 && millis() - tiempoTexto1 < 7000) {
      if (alphaTexto1 < 255) { alphaTexto1 += 2; }
    }

    if (millis() - tiempoTexto1 > 7000) {
      alphaTexto1 -= 2;
      alphaFuriosa -= 2;
    }

    if (alphaTexto1 > 0) {
      fill(120, 0, 0, alphaTexto1);
      rect(240, 240, 320, 120, 20);

      fill(255, alphaTexto1);
      textFont(fuenteTexto, 18);
      text("Imperator Furiosa.\nUna pelada y feroz guerrera del desierto.", 255, 265, 280, 100);
    }
  }

  // MAX
  if (alphaFuriosa <= 0) {
    if (yProta > 180) {
      yProta -= 2;
    }

    tint(255, alphaMax);
    image(prota, 400, yProta, 220, 300);
    noTint();

    if (yProta <= 180) {
      if (pausaTexto2 == 0) { pausaTexto2 = millis(); }
      if (tiempoTexto2 == 0) { tiempoTexto2 = millis(); }

      if (millis() - pausaTexto2 > 1000) {
        if (alphaTexto2 < 255 && alphaMax == 255) { alphaTexto2 += 2; }
      }

      if (millis() - tiempoTexto2 > 7000) {
        if (alphaMax > 0) {
          alphaMax -= 2;
          alphaTexto2 -= 2; 
        }
      }

      if (alphaMax <= 0) {
        pantalla = 2;       
        tiempo = millis();  
      }

      if (alphaMax > 0 && alphaTexto2 > 0) {
        fill(120, 0, 0, alphaTexto2);
        rect(40, 240, 320, 120, 20);

        fill(255, alphaTexto2);
        textFont(fuenteTexto, 18);
        text("Max Rockatansky.\nEl prota, no es tan piola pero tiene huevos.", 55, 265, 280, 100);
      }
    }
  }
}

void pantalla3() {
  background(0);

  // FONDO SUBE
  if (yFondo3 > 0) {
    yFondo3 -= 2;
  }
  image(fondo3, 0, yFondo3, width, height);

  // JOE SUBE
  if (yFondo3 <= 0) {
    if (yJoe > 160) {
      yJoe -= 2;
    }
  }

  if (yJoe <= 160) {
    if (pausaTexto3 == 0) { pausaTexto3 = millis(); }
    if (tiempoTexto3 == 0) { tiempoTexto3 = millis(); }

    if (millis() - pausaTexto3 > 1000 && millis() - tiempoTexto3 < 7000) {
      if (alphaTexto3 < 255) { alphaTexto3 += 2; }
    }

    if (millis() - tiempoTexto3 > 7000) {
      alphaTexto3 -= 2;
      alphaJoe -= 2;
    }

    if (alphaJoe <= 0) {
      pantalla = 3;             
      inicioPantalla4 = millis(); 
      tiempo = millis();         
    }

    if (alphaTexto3 > 0) {
      fill(120, 0, 0, alphaTexto3);
      rect(300, 220, 300, 120, 20); 

      fill(255, alphaTexto3);
      textFont(fuenteTexto, 18);
      text("Immortan Joe.\nEl mas piola de toda \nCiudadela", 315, 255);
    }
  } 

  tint(255, alphaJoe);
  image(malo1, 40, yJoe, 280, 320);
  noTint();
}

void pantalla4() {
  background(0);

  if (inicioPantalla4 == 0) {
    inicioPantalla4 = millis();
  }

  if (millis() - inicioPantalla4 >= 0) { 
    image(fondo4, 0, 0, width, height);
  }

  // SUBEN MAX Y FURIOSA
  if (millis() - inicioPantalla4 > 1000) { 
    if (yMaxFuriosa > 175) { 
      yMaxFuriosa -= 2;
    }
    if (alphaMaxFuriosa < 255) {
      alphaMaxFuriosa += 3;
    }
    tint(255, alphaMaxFuriosa);
    image(maxyfuriosa, 50, yMaxFuriosa, 540, 340);
    noTint();
  }

  // TEXTO FINAL
  if (yMaxFuriosa <= 175) {
    fill(0, 195); 
    rect(0, 20, width, 150); 

    fill(255);
    textFont(fuenteTexto, 14);
    textAlign(CENTER); 
    
    text(
      "Al final, Furiosa y Max se terminan aliando en una\n" +
      "tremenda persecución por el desierto. Los dos se plantan\n" +
      "de manos contra Immortan Joe para cortarle el negocio\n" +
      "del agua y liberar a la Ciudadela.\n" +
      "¿Podrá esta dupla escapar de los más piolas del condado?", 
      width/2, 45 
    );
    
    textAlign(LEFT); 

    if (millis() - inicioPantalla4 > 12000) { 
      pantalla = 4;      
      tiempo = millis(); 
    }
  }
}

void pantalla5() {
  background(0); 
  image(fondo5, 0, 0, width, height);

  // Inicializar tormenta sin arreglos (Variables simples y random)
  if (!arenaInicializada) {
    arenaX1 = random(0, width);  arenaY1 = random(0, height);  arenaVel1 = random(4, 10);
    arenaX2 = random(0, width);  arenaY2 = random(0, height);  arenaVel2 = random(4, 10);
    arenaX3 = random(0, width);  arenaY3 = random(0, height);  arenaVel3 = random(4, 10);
    arenaInicializada = true;
  }

  // Mover y dibujar tormenta individualmente
  noStroke();
  
  // Grano 1
  arenaX1 -= arenaVel1; 
  arenaY1 += random(0.5, 1.5); 
  if (arenaX1 < 0) { arenaX1 = width; arenaY1 = random(0, height); }
  if (arenaY1 > height) { arenaY1 = 0; arenaX1 = random(0, width); }
  fill(214, 140, 50, random(40, 130)); 
  ellipse(arenaX1, arenaY1, arenaVel1 * 2.5, arenaVel1); 

  // Grano 2
  arenaX2 -= arenaVel2; 
  arenaY2 += random(0.5, 1.5); 
  if (arenaX2 < 0) { arenaX2 = width; arenaY2 = random(0, height); }
  if (arenaY2 > height) { arenaY2 = 0; arenaX2 = random(0, width); }
  fill(214, 140, 50, random(40, 130)); 
  ellipse(arenaX2, arenaY2, arenaVel2 * 2.5, arenaVel2); 

  // Grano 3
  arenaX3 -= arenaVel3; 
  arenaY3 += random(0.5, 1.5); 
  if (arenaX3 < 0) { arenaX3 = width; arenaY3 = random(0, height); }
  if (arenaY3 > height) { arenaY3 = 0; arenaX3 = random(0, width); }
  fill(214, 140, 50, random(40, 130)); 
  ellipse(arenaX3, arenaY3, arenaVel3 * 2.5, arenaVel3); 

  // CARTEL FINAL
  if (alphaFin < 255) { alphaFin += 2.5; }
  fill(20, 10, 5, alphaFin - 60); 
  stroke(214, 140, 50, alphaFin); 
  strokeWeight(2);
  rect(120, 40, 400, 180, 20); 
  noStroke();                                     

  textAlign(CENTER);
  fill(214, 180, 52, alphaFin);   
  textFont(fuenteTitulo, 55);
  text("FIN", width/2, 110); 

  fill(240, alphaFin);            
  textFont(fuenteTexto, 15);
  text("Ni Toretto\nestá preparado para este terreno...", width/2, 160); 
  textAlign(LEFT);

  // BOTÓN DE REINICIO
  dibujarBotonReiniciar(240, 240, 160, 40);
}

// ZONA DE CLICKS
void mouseClicked() {
  // CLIC EN EL BOTÓN "PLAY" 
  if (pantalla == 0 && mouseX > 240 && mouseX < 400 && mouseY > 320 && mouseY < 380) {
    pantalla = 1;
    tiempo = millis();
  }
  
  // CLIC EN EL BOTÓN "REINICIAR" 
  if (pantalla == 4 && mouseX > 240 && mouseX < 400 && mouseY > 240 && mouseY < 280) {
    pantalla = 0;
    tiempo = millis();
    
    // Reseteamos Pantalla 1
    yTitulo = -100;
    
    // Reseteamos Pantalla 2
    yProta2 = 500;
    yProta = 500;
    alphaFuriosa = 255;
    alphaMax = 255;
    alphaTexto1 = 0;
    alphaTexto2 = 0;
    pausaTexto = 0;
    pausaTexto2 = 0;
    tiempoTexto1 = 0;
    tiempoTexto2 = 0;
    
    // Reseteamos Pantalla 3
    yFondo3 = 480;
    yJoe = 500;
    alphaJoe = 255;
    alphaTexto3 = 0;
    pausaTexto3 = 0;
    tiempoTexto3 = 0;
    
    // Reseteamos Pantalla 4
    inicioPantalla4 = 0;
    yMaxFuriosa = 480;
    alphaMaxFuriosa = 0;
    
    // Reseteamos Pantalla 5 (Tormenta y botón)
    alphaFin = 0;
    arenaInicializada = false;
  }
}

// FUNCIÓN PARA RENDERIZAR EL BOTÓN REINICIAR
void dibujarBotonReiniciar(int rectX, int rectY, int rectAncho, int rectAlto) {
  if (mouseX > rectX && mouseX < rectX + rectAncho && mouseY > rectY && mouseY < rectY + rectAlto) {
    fill(214, 140, 50, alphaFin); 
  } else {
    fill(40, 20, 10, alphaFin - 30); 
  }
  
  stroke(214, 180, 52, alphaFin); 
  strokeWeight(2);
  rect(rectX, rectY, rectAncho, rectAlto, 10); 
  noStroke();
  
  textAlign(CENTER);
  if (mouseX > rectX && mouseX < rectX + rectAncho && mouseY > rectY && mouseY < rectY + rectAlto) {
    fill(0); 
  } else {
    fill(214, 180, 52, alphaFin); 
  }
  textFont(fuenteTexto, 14);
  text("REINICIAR", rectX + rectAncho/2, rectY + rectAlto/2 + 5);
  textAlign(LEFT);
}
