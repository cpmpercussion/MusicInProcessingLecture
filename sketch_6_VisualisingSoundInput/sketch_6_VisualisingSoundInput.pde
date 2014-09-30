import ddf.minim.*;

Minim minim;
AudioInput in;

void setup()
{
  size(200, 200, P3D);
  minim = new Minim(this);
  in = minim.getLineIn();
}

void draw()
{
  background(255);
  stroke(0);    
  for (int i = 0; i < in.bufferSize() - 1; i++) {
    line(i, 100 + in.left.get(i)*100, i+1, 100 + in.left.get(i+1)*100);
  }
}
