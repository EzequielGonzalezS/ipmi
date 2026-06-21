PImage referencia;

boolean animacionActiva = false; 
float tiempo = 0;         
float desfaseAnima = 0;    

void setup() {
  size(800, 400);
  referencia = loadImage("02.jpg");
}

void draw() {
  float colorFondo = animacionActiva ? random(215, 225) : 220;
  background(colorFondo);

  image(referencia, 0, 0, 400, 400);
  
  fill(0);
  noStroke();
  rect(400, 0, 400, 400);
  
  if (animacionActiva) {
    tiempo += 0.04; 
    desfaseAnima = abs(sin(tiempo)) * 25; 
  } else {
    tiempo = 0;        
    desfaseAnima = 0;  
  }
  
  pushMatrix();
  translate(600, 200); 
  float anguloRotacion = map(desfaseAnima, 0, 25, 0, TWO_PI);
  if (animacionActiva) {
    rotate(anguloRotacion); 
  }
  fill(255); 
  rect(-21, -21, 42, 42); 
  fill(0);   
  rect(-7, -7, 14, 14);
  popMatrix();

  fill(255);
  int cantidad = 6;

  for (int i = 0; i < cantidad; i++) {
    rect(560, i * 29, 78, 14); 
    rect(561, 239 + i * 29, 77, 14); 
    rect(400 + i * 29, 161, 15, 77); 
    rect(785 - i * 29, 161, 14, 77); 
  }
  
  dibujarEsquinaSupIzq(400, desfaseAnima); 
  dibujarEsquinaSupDer(desfaseAnima);
  dibujarEsquinaInfIzq(desfaseAnima);
  dibujarEsquinaInfDer(desfaseAnima);
  
  noFill();
  stroke(0); 
  for (int x = 400; x <= 800; x += 400) {
    for (int y = 0; y <= 400; y += 400) { 
      if (dist(x, y, 600, 200) > 100) { 
        rect(x - 5, y - 5, 10, 10);
      }
    }
  }
}

int calcularMovimiento(float posOriginal, float anima, boolean sumar) {
  if (sumar) {
    return int(posOriginal + anima); 
  } else {
    return int(posOriginal - anima); 
  }
}

void dibujarEsquinaSupIzq(int desplazarX, float anima) {
  int cantidadEscalones = 5; 
  int grosor = 14;
  for (int i = 0; i < cantidadEscalones; i++) {
    int posY = calcularMovimiento(15 + (i * 29), anima, true);
    int largoH = 131 - (i * 29);
    int largoV = 145 - (i * 29);
    
    int posX_Horizontal = calcularMovimiento(desplazarX + 28 + (i * 29), anima, true); 
    int posX_Vertical = calcularMovimiento(desplazarX + 14 + (i * 29), anima, true);

    rect(posX_Horizontal, posY, largoH, grosor); 
    rect(posX_Vertical, posY, grosor, largoV); 
  }
}

void dibujarEsquinaSupDer(float anima) {
  int cantidadEscalones = 5;
  int grosor = 14;
  for (int i = 0; i < cantidadEscalones; i++) {
    int posY = calcularMovimiento(15 + (i * 29), anima, true); 
    int largoH = 132 - (i * 29); 
    int largoV = 145 - (i * 29);
    int posX_Vertical = calcularMovimiento(771 - (i * 29), anima, false); 

    rect(calcularMovimiento(639, anima, false), posY, largoH, grosor); 
    rect(posX_Vertical, posY, grosor, largoV);
  }
}

void dibujarEsquinaInfIzq(float anima) {
  int cantidadEscalones = 5;
  int grosor = 14;
  for (int i = 0; i < cantidadEscalones; i++) {
    int posY = calcularMovimiento(370 - (i * 29), anima, false); 
    int largoH = 131 - (i * 29); 
    int largoV = 145 - (i * 29);
    int posX_Horizontal = calcularMovimiento(428 + (i * 29), anima, true); 
    
    rect(posX_Horizontal, posY, largoH, grosor); 
    rect(calcularMovimiento(415 + (i * 29), anima, true), calcularMovimiento(239, anima, false), grosor, largoV); 
  }
}

void dibujarEsquinaInfDer(float anima) {
  int cantidadEscalones = 5;
  int grosor = 14;
  for (int i = 0; i < cantidadEscalones; i++) {
    int posY = calcularMovimiento(370 - (i * 29), anima, false); 
    int largoH = 132 - (i * 29);
    int largoV = 145 - (i * 29);
    int posX_Vertical = calcularMovimiento(771 - (i * 29), anima, false); 

    rect(calcularMovimiento(639, anima, false), posY, largoH, grosor); 
    rect(posX_Vertical, calcularMovimiento(239, anima, false), grosor, largoV); 
  }
}

void keyPressed() {
  animacionActiva = !animacionActiva; 
}
