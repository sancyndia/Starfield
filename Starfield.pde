Particle[] particles;
void setup()
{
  size(500,500);
  particles = new Particle[300];
  for(int i = 0; i < particles.length; i++)
  {
    particles[i] = new NormalParticle();
  }
  particles[0] = new OddballParticle();
  particles[1] = new JumboParticle();
}
void draw()
{
  background(0);
  for(int i = 0; i < particles.length; i++)
  {
    particles[i].move();
    particles[i].show();
  }
}
class NormalParticle implements Particle
{
  double myX, myY, dSpeed, dDirection;
  int myColor;
  NormalParticle()
  {
   myColor = color((int)(Math.random()*255),(int)( Math.random()*255), (int)(Math.random()*255));
   myX = 250; 
   myY = 250; 
   dSpeed = Math.random()*10;
   dDirection = Math.PI*2*Math.random();
  }
  
  public void move()
  {
    myX=myX+ Math.cos(dDirection) * dSpeed;
    myY=myY+ Math.sin(dDirection) * dSpeed;
  }
  
  public void show()
  {
    fill(myColor);
    noStroke();
    ellipse((float)myX,(float)myY,10,5);
    ellipse((float)myX,(float)myY,5,10);
  }
}
interface Particle
{
  public void show();
  public void move();
}

class OddballParticle implements Particle
{
  double myX, myY, dSpeed, dDirection;
  int myColor;
  OddballParticle()
  {
   myColor = color(255,0,0);
   myX = 300; 
   myY = 300; 
   dSpeed = Math.random()*1;
   dDirection = Math.PI*1*Math.random();
  }
  public void move()
  {
    myX=myX+ Math.cos(dDirection) * dSpeed + (int)(Math.random()*5)-2;
    myY=myY+ Math.sin(dDirection) * dSpeed+ (int)(Math.random()*5)-2;
  }
  
  public void show()
  {
    fill(myColor);
    ellipse((float)myX,(float)myY,10,10);
  }
}

class JumboParticle extends NormalParticle 
{
  public void show()
  {
    fill(0,255,0);
    ellipse((float)myX,(float)myY,30,15);
    ellipse((float)myX,(float)myY,15,30);
  }
}