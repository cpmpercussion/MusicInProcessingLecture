import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;
Oscil wave0, wave1, wave2, wave3, wave4, wave5, wave6, wave7;
float waveAmplitude;
float baseFrequency;

void setup() {
  size(1000, 400);
  minim = new Minim(this);
  out = minim.getLineOut();

  waveAmplitude = 0.1;
  baseFrequency = 220;

  //float[] partials = {1,1.5,1.75,2,2.25,2.4,2.6,2.9}; // inharmonic
  
  float[] partials = {1, 2, 3, 4, 5, 6, 7, 8}; // harmonic (odd and even)
  //float[] partials = {1, 2, 2, 4, 4, 6, 6, 8}; // harmonic (just even)
  //float[] partials = {1, 1, 3, 3, 5, 5, 7, 7}; // harmonic (just odd)


  float[] amps = {1, 0.9, 0.8, 0.7, 0.6, 0.5, 0.4, 0.3};

  wave0 = new Oscil(partials[0] * baseFrequency, waveAmplitude * amps[0], Waves.SINE);
  wave1 = new Oscil(partials[1] * baseFrequency, waveAmplitude * amps[1], Waves.SINE);
  wave2 = new Oscil(partials[2] * baseFrequency, waveAmplitude * amps[2], Waves.SINE);
  wave3 = new Oscil(partials[3] * baseFrequency, waveAmplitude * amps[3], Waves.SINE);
  wave4 = new Oscil(partials[4] * baseFrequency, waveAmplitude * amps[4], Waves.SINE);
  wave5 = new Oscil(partials[5] * baseFrequency, waveAmplitude * amps[5], Waves.SINE);
  wave6 = new Oscil(partials[6] * baseFrequency, waveAmplitude * amps[6], Waves.SINE);
  wave7 = new Oscil(partials[7] * baseFrequency, waveAmplitude * amps[7], Waves.SINE);

  wave0.patch(out);
  wave1.patch(out);
  wave2.patch(out);
  wave3.patch(out);
  wave4.patch(out);
  wave5.patch(out);
  wave6.patch(out);
  wave7.patch(out);
}

void draw()
{
  background(255);
  stroke(0);
  strokeWeight(1);
  
  // draw the waveform of the output
  for(int i = 0; i < out.bufferSize() - 1; i++)
  {
    line( i, 200  - out.left.get(i)*400,  i+1, 200  - out.left.get(i+1)*400 );
  }
}
