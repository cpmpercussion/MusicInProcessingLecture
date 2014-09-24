import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;
MultiChannelBuffer sampleBuffer;
Sampler unilodge;
Line envelope;

void setup() {
  size(200, 200);
  minim = new Minim(this);
  out = minim.getLineOut();
  
  sampleBuffer = new MultiChannelBuffer(1,1024);
  minim.loadFileIntoBuffer("unilodge.wav",sampleBuffer);
  
  unilodge = new Sampler(sampleBuffer, 44100, 1);
  unilodge.patch(out);
  
  envelope = new Line();
  envelope.patch(unilodge.amplitude);
}

void draw() {
  background(0);
}

void mouseClicked() {
 unilodge.rate.setLastValue(mouseX / 100.0 );
 envelope.activate( 3.0 * mouseY / 100.0, 0.5f, 0 );
 unilodge.trigger(); 
}
