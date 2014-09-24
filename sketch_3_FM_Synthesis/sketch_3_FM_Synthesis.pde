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
  size(400, 200);
  minim = new Minim(this);
  out = minim.getLineOut();
  
  waveAmplitude = 0.5;
  carrierFrequency = 220;
  
  carrier = new Oscil(carrierFrequency,waveAmplitude,Waves.SINE);
  modulator = new Oscil(50,10,Waves.SINE);
  modulator.offset.setLastValue(carrierFrequency); 
  
  modulator.patch(carrier.frequency);
  carrier.patch(out);
}

void draw()
{
  background(0);
  stroke(255);
  for( int i = 0; i < out.bufferSize() - 1; i++ )
  {
    float x1  =  map( i, 0, out.bufferSize(), 0, width );
    float x2  =  map( i+1, 0, out.bufferSize(), 0, width );
    line( x1, 50 + out.left.get(i)*50, x2, 50 + out.left.get(i+1)*50);
    line( x1, 150 + out.right.get(i)*50, x2, 150 + out.right.get(i+1)*50);
  }  
  text( "Modulation frequency: " + modulator.frequency.getLastValue(), 5, 15 );
  text( "Modulation amplitude: " + modulator.amplitude.getLastValue(), 5, 30 );
}

void mouseMoved()
{
  float modulateAmount = map( mouseY, 0, height, 220, 1 );
  float modulateFrequency = map( mouseX, 0, width, 0.1, 100 );
  
  modulator.setFrequency( modulateFrequency );
  modulator.setAmplitude( modulateAmount );
}
