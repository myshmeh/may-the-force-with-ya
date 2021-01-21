Mover[] m = new Mover[25];
ForceBar[] fbar = new ForceBar[4];
//define forces
final PVector grav = new PVector(0,0.35,0);
final PVector wind = new PVector(0.2,0,0);
void setup(){
  size(640, 480);
  Init();
}

void Init(){
  for(int i=0; i<m.length; i++)
    m[i] = new Mover(width*0.5,height*0.5, random(1, 5));
  fbar[0] = new ForceBar(0, 0, 50, height, 1, 0);
  fbar[1] = new ForceBar(width-50, 0, 50, height, -1.3, 0);
  fbar[2] = new ForceBar(0, 0, width, 50, 0, 1.6);
  fbar[3] = new ForceBar(0, height-50, width, 50, 0, -1);
}

void draw(){
  Update();
  background(20);
  Draw();
}

void Update(){
  //Update movers
  //Apply Force towards movers
  for(int i=0; i<m.length; i++){
    if(mousePressed) m[i].applyForce(getForceMoused(m[i].location));
    m[i].applyForce(fbar[0].getForceWidth(m[i].location));
    m[i].applyForce(fbar[1].getForceWidth(m[i].location));
    m[i].applyForce(fbar[2].getForceHeight(m[i].location));
    m[i].applyForce(fbar[3].getForceHeight(m[i].location));
    m[i].Update();
  }
}

PVector getForceMoused(PVector targetObj){
  PVector f = new PVector(mouseX-targetObj.x, mouseY-targetObj.y);
  f.normalize();
  f.mult(1);
  return f;
}

void Draw(){
  //Draw Force Bar
  for(int i=0; i<fbar.length; i++)
    fbar[i].Draw();
  //Draw Mover
  for(int i=0; i<m.length; i++)
    m[i].Draw();
}

void keyPressed(){
  if(key == ' ' || key == 'r')
    Init();
}