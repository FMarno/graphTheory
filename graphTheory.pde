Level level;
Menu menu;
int GOLD = #FFD700;
boolean SUCCESS;
boolean STARTUP = true;
PImage success;
int number = 4;

void setup() {
  fullScreen();
  rectMode(CENTER);
  textAlign(CENTER, CENTER);  
  menu = new Menu();
  menu.buttons.add(new NextButton(new PVector(width/2, height - height/4), width/2, width/(4*1.618)));
  level = new Level(number);
  success = loadImage("success.png"); 
  success.resize(width,success.height * ( width/success.width ));
}

void draw() {
  if (STARTUP){
    background(255);
    image(success, 0,height/2 - success.height/2);
    if (mousePressed){
    STARTUP = false;      
    }
    return;
  }
  background(255);
  level.display();
  if (SUCCESS) {
    menu.display();
  } else {
    level.update();
  }
}

void mousePressed() {
  if (SUCCESS) {
    menu.press(mouseX, mouseY);
  } else {
    level.press(mouseX, mouseY);
  }
}