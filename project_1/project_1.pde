color[][] allColor = new color[20][20]; //store the color info of all triangles 
int[][] allTriangleAngle = new int[20][20]; //store the type info of all triangless

void setup() {
  size( 800, 800 );
  background( #ffffff );
  drawTriangles();
}

void draw() {
  //press different keys to change the color of triangles
  if (keyPressed) {
    if (key == 'b' || key == 'B') {
      color newColor = color(#303958);
      changeColor(mouseX, mouseY, newColor);
    }
    if (key == 'r' || key == 'R') {
      color newColor = color(#a13614);
      changeColor(mouseX, mouseY, newColor);
    }
     if (key == 'g' || key == 'G') {
      color newColor = color(#36543c);
      changeColor(mouseX, mouseY, newColor);
    }
     if (key == 'o' || key == 'O') {
      color newColor = color(#da7c0e);
      changeColor(mouseX, mouseY, newColor);
    }
     if (key == 'd' || key == 'D') {
      color newColor = color(#000000);
      changeColor(mouseX, mouseY, newColor);
    }
     if (key == 'c' || key == 'c') {
      color newColor = color(#d39c73);
      changeColor(mouseX, mouseY, newColor);
    }
     if (key == 'y' || key == 'Y') {
      color newColor = color(#efc83c);
      changeColor(mouseX, mouseY, newColor);
    }  
  }
}

void mouseClicked() {
  //click on one tiangle to change it's angle
    println(mouseX, mouseY);
    rotateTriangle(mouseX, mouseY);
}

void changeColor( float mx, float my, color nColor ) {
  //When change the color, fill it with white and draw a new triangle with new color
  int jumpWidth = 40;
  int jumpHeight = 40;
 
  for ( int j = 0; j < ( width + 1 ); j = j + jumpHeight ) {
    for ( int i = 0; i < ( height + 1 ); i = i + jumpWidth ) {
      if ( i < mx && mx < (i+jumpWidth) && j < my && my < (j+jumpHeight)) {
        int indexi = i/jumpWidth;
        int indexj = j/jumpHeight;
        allColor[indexi][indexj] = nColor;
        fill(#ffffff);
        rect(i, j, jumpWidth, jumpHeight);
        fill(nColor);
        if (  allTriangleAngle[indexi][indexj] == 0 ) {
          triangle( i, j, i + jumpWidth, j, i, j + jumpHeight ); //Type 0
        } else if ( allTriangleAngle[indexi][indexj] == 1 ) {
          triangle( i, j, i + jumpWidth, j+jumpHeight, i, j + jumpHeight ); //Type 1
        } else if ( allTriangleAngle[indexi][indexj] == 2 ) {
          triangle( i, j, i+jumpWidth, j, i+jumpWidth, j+jumpHeight ); //Type 2
        } else {
          triangle( i+jumpWidth, j, i+jumpWidth, j+jumpHeight, i, j+jumpHeight ); //Type 3
        }
      }
    }
  }
}

void rotateTriangle( float mx, float my ) {
  //When click on the triangle, change the type of it to implement the rotation.
  int jumpWidth = 40;
  int jumpHeight = 40;
  int newType = 0;
  int indexi = 0;
  int indexj = 0;
  for ( int j = 0; j < ( width + 1 ); j = j + jumpHeight ) {
    for ( int i = 0; i < ( height + 1 ); i = i + jumpWidth ) {
      if ( i < mx && mx < (i+jumpWidth) && j < my && my < (j+jumpHeight)) {
        indexi = i/jumpWidth;
        indexj = j/jumpHeight;
        fill(#ffffff);
        rect(i, j, jumpWidth, jumpHeight);
        fill( allColor[indexi][indexj]);
       
        if ( allTriangleAngle[indexi][indexj] == 0 ) {
          triangle( i, j, i+jumpWidth, j, i+jumpWidth, j+jumpHeight ); // Change it to Typt 2
          newType = 2;
        } else if (allTriangleAngle[indexi][indexj] == 1 ) {
          triangle( i, j, i + jumpWidth, j, i, j + jumpHeight );//Change it to Typt 0
          newType = 0;
        } else if ( allTriangleAngle[indexi][indexj] == 2 ) {
          triangle( i+jumpWidth, j, i+jumpWidth, j+jumpHeight, i, j+jumpHeight );//Change it to Typt 3
          newType = 3;
        } else if ( allTriangleAngle[indexi][indexj] == 3 ) {
          triangle( i, j, i + jumpWidth, j+jumpHeight, i, j + jumpHeight ); //Change it to Typt 1
          newType = 1;
        }
        
      }
    }
  }
  
  allTriangleAngle[indexi][indexj] = newType;
  println( allTriangleAngle[indexi][indexj] );
}

void drawTriangles() {
  noStroke();
  int jumpWidth = 40;
  int jumpHeight = 40;
  //Make a colorPalette to store 7 colors of triangles.
  color[] colorPalette = new color[7];
  colorPalette[0] = color(#303958); //blue
  colorPalette[1] = color(#efc83c); //yellow
  colorPalette[2] = color(#d39c73); //light carnatio
  colorPalette[3] = color(#a13614); //red
  colorPalette[4] = color(#da7c0e); //orange
  colorPalette[5] = color(#000000); //black 
  colorPalette[6] = color(#36543c); //green


  for ( int j = 0; j < width; j = j + jumpHeight ) {
    for ( int i = 0; i < height; i = i + jumpWidth ) {
      int ranColor = (int) random( 0, 7 ); 
      fill( colorPalette[ ranColor ] );
      int indexi = i/jumpWidth;
      int indexj = j/jumpHeight;
      allColor[ indexi ][ indexj ] =  colorPalette[ ranColor ] ; //store the color
      int whichAngle = (int) random( 0, 3 );
      if ( whichAngle == 0 ) {
        triangle( i, j, i + jumpWidth, j, i, j + jumpHeight ); //Type 0
      } else if ( whichAngle == 1 ) {
        triangle( i, j, i + jumpWidth, j+jumpHeight, i, j + jumpHeight ); //Type 1
      } else if ( whichAngle == 2 ) {
        triangle( i, j, i+jumpWidth, j, i+jumpWidth, j+jumpHeight ); //Type 2
      } else if( whichAngle == 3 ){
        triangle( i+jumpWidth, j, i+jumpWidth, j+jumpHeight, i, j+jumpHeight ); //Type 3
      }

      allTriangleAngle[ indexi ][ indexj ] = whichAngle; //store the angle
    }
  }
}

