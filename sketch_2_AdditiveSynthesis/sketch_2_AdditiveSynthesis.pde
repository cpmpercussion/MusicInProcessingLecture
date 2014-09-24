import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;
Oscil wave1, wave2, wave3;
float waveAmplitude;
float baseFrequency;
int timeSinceLastChange;

void setup() {
  size(200, 200);
  minim = new Minim(this);
  out = minim.getLineOut();
  
  waveAmplitude = 0.5/3;
  baseFrequency = 220;
  
  wave1 = new Oscil(baseFrequency,waveAmplitude, Waves.SINE);
  wave2 = new Oscil(1.5 * baseFrequency,waveAmplitude,Waves.SINE);
  wave3 = new Oscil(1.75 * baseFrequency,waveAmplitude,Waves.SINE);
  
  wave1.patch(out);
  wave2.patch(out);
  wave3.patch(out);
}

void draw() {
  
}

//void draw() {
//  if (millis() - timeSinceLastChange > 100) {
//    timeSinceLastChange = millis();
//    baseFrequency++;
//    wave1.setFrequency(baseFrequency);
//    wave2.setFrequency(1.5 * baseFrequency);
//    wave3.setFrequency(1.75 * baseFrequency);
//  }
//
//}

//void draw() {
//    wave1.setFrequency((millis()*1.0/15000) * baseFrequency);
//    wave2.setFrequency((millis()*1.0/10000 + 0.5) * baseFrequency);
//    wave3.setFrequency((millis()*1.0/12000 + 0.7) * baseFrequency);
//}



// Try changing "Waves.SINE" to: 
// "Waves.TRIANGLE", 
// "Waves.SAW", 
// "Waves.SQUARE", or 
// "Waves.QUARTERPULSE"
