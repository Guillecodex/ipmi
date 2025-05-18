// Guillermo Matías Martínez Escalante
//Legajo 122685/9
//Comisión cinco

PImage img1, img2, img3, img4, img5;
float posX, posY, posY2;
int pantalla;
int contador;
int opacidad;

void setup() {
  size(640, 480);

// Cargo las imágenes

  img1 = loadImage("pantallauno.jpg");
  img2 = loadImage("pantallados.jpg");
  img3 = loadImage("pantallatres.jpg");
  img4 = loadImage("pantallacuatro.jpg");
  img5 = loadImage("pantallacinco.jpg");
  pantalla = 1;
  contador = 0;
  posX = 16;
  posY = 340;
  posY2 = 0;
  opacidad = 222;
}

void draw() {
  println("pantalla=" + pantalla);

// Pantalla uno

  if (pantalla == 1) {
    // Pantalla uno
    pushStyle();
    image(img1, 0, 0, width, height);
    filter(GRAY);
    fill(12, opacidad);
    PFont fuente;
    fuente = loadFont ("TimesNewRomanPSMT-48.vlw");
    textFont(fuente);
    textSize(40);
    text("El Conde de Montecristo", 20, 40, 240, 200);
    opacidad -= 1;
    if (opacidad <= 0) {
      pantalla = 2;
      contador = 0;
      posX = 20;
      posY = 320;
      opacidad = 255;
    }
    popStyle();

// Pantalla dos

  } else if (pantalla == 2) {
    // Pantalla dos
    pushStyle();
    image(img2, 0, 0, width, height);
    fill(250, 2, 255);
    PFont fuente;
    fuente = loadFont ("CambriaMath-48.vlw");
    textFont(fuente);
    String parrafodos;
    parrafodos = "disponibles públicamente que fueron intervenidas con IA.";
    textSize(24);
    text(parrafodos, posX, posY2, 600, 200);
    posY2 += 2;
    if (posY2 >= 486) {
      pantalla = 3;
      contador = 0;
      posX = 20;
      posY = 320;
      posY2 = 0;
    }
    popStyle();

// Pantalla tres

  } else if (pantalla == 3) {
    // Pantalla tres
    pushStyle();
    image(img3, 0, 0, width, height);
    String parrafotres = "El día de su compromiso, es arrestado y llevado a prisión sin juicio, encerrado en el castillo de If";
    textSize(24);
    textAlign(LEFT, TOP);
    fill(222);
    text(parrafotres, posX, posY, 480, 200);

     // Movimiento del texto
    if (contador == 0) {
      posX = -40;
      contador = 1;
    }

    if (posX < 200) {
      posX += 1;
    } else {
      contador++;
      if (contador > 100) {
        pantalla = 4;
        posY = height + 50;
      }
    }

    popStyle();

// Pantalla cuatro

  } else if (pantalla == 4) {
    // Pantalla cuatro
    pushStyle();
    image(img4, 0, 0, width, height);
    String parrafocuatro = "Este es el texto de la cuarta pantalla que sube desde abajo.";
    textSize(24);
    textAlign(LEFT, TOP);
    fill(222);
    text(parrafocuatro, posX, posY, 600, 200);
    popStyle();

    if (posY > 120) {
      posY -= 1;
    } else {
      contador++;
      if (contador > 100) {
        pantalla = 5;
        // Se reinicia la opacidad, así se evita tener conflictos con la animación de la pantalla cinco
        opacidad = 0;
      }
    }

// Pantalla cinco

  } else if (pantalla == 5) {
    // Pantalla cinco
    pushStyle();
    image(img5, 0, 0, width, height);

    // Incrementa opacidad hasta 255, haciendo lo contrario a la pantalla uno
    if (opacidad < 255) {
      opacidad += 2;
    }

    fill(255, opacidad);
    textSize(24);
    text("Al final, Edmond comprende que el odio lo consumió durante años, y decide dejar atrás su identidad como Conde de Montecristo y parte en busca de una nueva vida.", 20, 40);

    // Botón
    fill(178, 54, 8);
    rect(520, 420, 100, 40, 8);
    fill(255);
    text("Reiniciar", 532, 448);
    popStyle();
  }

}

void mousePressed() {
  if (pantalla == 5) {
    // Colisión
    if (mouseX > 520 && mouseX < 520 + 100
      && mouseY > 420 && mouseY < 420 + 40) {
      pantalla = 1;
    }
  }
}
