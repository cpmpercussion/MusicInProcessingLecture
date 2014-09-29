import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;
Oscil carrier, modulator;
float waveAmplitude;
float carrierFrequency;
float modulatorFrequency;
int timeSinceLastChange;

void setup() {
  size(800, 400);
  minim = new Minim(this);
  out = minim.getLineOut();
  
  waveAmplitude = 0.5;
  carrierFrequency = 220;
  modulatorFrequency = 440;
  
  carrier = new Oscil(carrierFrequency,waveAmplitude,Waves.SINE);
  modulator = new Oscil(modulatorFrequency,1000,Waves.SINE);
  modulator.offset.setLastValue(carrierFrequency); 
  
  modulator.patch(carrier.frequency);
  carrier.patch(out);
}

void draw() {
  background(255);
  stroke(0);
  strokeWeight(2);
  for( int i = 0; i < out.bufferSize() - 1; i++ )
  {
    float x1  = map( i, 0, out.bufferSize(), 0, width );
    float x2  = map( i+1, 0, out.bufferSize(), 0, width );
    line( x1, 200 + out.left.get(i)*200, x2, 200 + out.left.get(i+1)*200);
  }  
  text( "Modulation frequency: " + modulator.frequency.getLastValue(), 5, 15 );
  text( "Modulation amplitude: " + modulator.amplitude.getLastValue(), 5, 30 );
}

void mouseMoved() {
  float modulateAmount = map( mouseY, 0, height, 1200, 1 );
  float modulateFrequency = map( mouseX, 0, width, 0.1, 800 );
  modulator.setFrequency( modulateFrequency );
  modulator.setAmplitude( modulateAmount );
}
