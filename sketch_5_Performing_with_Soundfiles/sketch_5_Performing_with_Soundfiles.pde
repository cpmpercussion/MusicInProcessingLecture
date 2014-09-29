import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;
MultiChannelBuffer sampleBuffer;
Sampler unilodge;
Line envelope;
int sampleBufferLength;

void setup() {
  size(800, 400);
  minim = new Minim(this);
  out = minim.getLineOut();
  
  sampleBuffer = new MultiChannelBuffer(1,1024);
  minim.loadFileIntoBuffer("unilodge.wav",sampleBuffer);
  sampleBufferLength = sampleBuffer.getBufferSize();
  
  unilodge = new Sampler(sampleBuffer, 44100, 1);
  unilodge.patch(out);
  
  envelope = new Line();
  envelope.patch(unilodge.amplitude);
}

void draw() {
  background(255);
  stroke(0);
  strokeWeight(2);

  for(int i = 0; i < out.bufferSize() - 1; i++) {
    line( i, 200  - out.left.get(i)*400,  i+1, 200  - out.left.get(i+1)*400 );
  }
}

void mouseClicked() {
 unilodge.rate.setLastValue(mouseX/(1.0 * width));
 unilodge.begin.setLastValue(random(sampleBufferLength));
 envelope.activate( 3.0 * mouseY / 100.0, 0.5f, 0 );
 unilodge.trigger();
}
