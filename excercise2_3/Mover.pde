class Mover{
  PVector acceleration;
  PVector velocity;
  PVector location;
  float mass;
  color c;
  //radius
  float radius;
  public Mover(float x, float y, float _mass){
    acceleration = new PVector(0,0,0);
    velocity = new PVector(0,0,0);
    location = new PVector(x, y, 0);
    mass = _mass;
    if(mass*10 < 255) c = color(255,255-mass*10,255-mass*10);
    else c = color(0);
    //radius
    radius = 16;
  }
  
  public void Update(){
    //newton method
    velocity.add(acceleration);
    velocity.limit(10);
    location.add(velocity);
    acceleration.mult(0); //init acc
    //check edges
    checkEdge();
  }
  
  public void applyForce(PVector force){
    PVector acc = PVector.div(force, mass);
    acceleration.add(acc);
  }
  
  private void checkEdge(){
    if(location.x < 0){
      location.x = 0;
      velocity.x *= -1;
    }
    if(location.x > width){
      location.x = width;
      velocity.x *= -1;
    }
    if(location.y < 0){
      location.y = 0;
      velocity.y *= -1;
    }
    if(location.y > height){
      location.y = height;
      velocity.y *= -1;
    }
  }
  
  public void Draw(){
    fill(c);
    stroke(255,125,125);
    ellipse(location.x, location.y, mass*radius, mass*radius);
  }
  
  public PVector getLocation(){
    return location;
  }
}