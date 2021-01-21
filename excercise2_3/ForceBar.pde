class ForceBar{
  PVector location;
  PVector force;
  float range;
  float w, h;
  
  public ForceBar(float x, float y, float _w, float _h, float fx, float fy){
    location = new PVector(x, y);
    force = new PVector(fx, fy);
    range = 250;
    w = _w;
    h = _h;
  }
  
  public PVector getForceWidth(PVector targetObj){
    float dist = getDistWidth(targetObj);
    if(dist < range){
      return PVector.mult(force, (range - dist)/range);
    }
    return new PVector(0,0,0);
  }
  
  public PVector getForceHeight(PVector targetObj){
    float dist = getDistHeight(targetObj);
    if(dist < range){
      return PVector.mult(force, (range - dist)/range);
    }
    return new PVector(0,0,0);
  }
  
  public boolean isCollided(PVector targetObj){
    boolean condition;
    condition = location.x < targetObj.x;
    condition &= location.x+w > targetObj.x;
    return condition;
  }
  
  public float getDistEllipse(PVector targetObj){
    float x = targetObj.x - location.x;
    float y = targetObj.y - location.y;
    float r = mag(x, y);
    return r;
  }
  public float getDistWidth(PVector targetObj){
    return abs(targetObj.x - location.x);
  }
  public float getDistHeight(PVector targetObj){
    return abs(targetObj.y - location.y);
  }
  
  public void Draw(){
    fill(200);
    stroke(255,125,125);
    rect(location.x, location.y, w, h);
    fill(255);
    text("f: "+force, location.x+w*0.5, location.y+h*0.5);
  }
}