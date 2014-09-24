import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;
Oscil wave;

void setup() {
  size(200, 200);
  minim = new Minim(this);
  out = minim.getLineOut();
  wave = new Oscil(440, 0.5f, Waves.SINE);
  wave.patch(out);
}

void draw() {}

// Try changing "Waves.SINE" to: 
// "Waves.TRIANGLE", 
// "Waves.SAW", 
// "Waves.SQUARE", or 
// "Waves.QUARTERPULSE"
