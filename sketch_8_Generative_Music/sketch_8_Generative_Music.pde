import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;
PhraseGenerator generator;
PhraseGenerator generator2;
PhraseGenerator generator3;
PhraseGenerator generator4;

void setup() {
  size(1000, 400);
  minim = new Minim(this);
  out = minim.getLineOut();
  generator = new PhraseGenerator(out);
  generator2 = new PhraseGenerator(out);
  generator3 = new PhraseGenerator(out);
  generator4 = new PhraseGenerator(out);
}

void draw()
{
  generator.checkPlayTime();
  generator2.checkPlayTime();
  generator3.checkPlayTime();
  generator4.checkPlayTime();

  background(255);
  stroke(0);
  strokeWeight(1);

  // draw the waveform of the output
  for (int i = 0; i < out.bufferSize () - 1; i++)
  {
    line( i, 200  - out.left.get(i)*400, i+1, 200  - out.left.get(i+1)*400 );
  }
}
