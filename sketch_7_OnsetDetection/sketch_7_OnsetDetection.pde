import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
BeatDetect beat;
AudioInput in;

void setup()
{
  size(200, 200, P3D);
  minim = new Minim(this);
  in = minim.getLineIn();
  beat = new BeatDetect();
}

void draw()
{
  background(255);
  stroke(0);    
  for (int i = 0; i < in.bufferSize () - 1; i++) {
    line(i, 100 + in.left.get(i)*100, i+1, 100 + in.left.get(i+1)*100);
  }

  beat.detect(in.mix);
  if ( beat.isOnset() ) {
    background(255, 0, 0);
  }
}
