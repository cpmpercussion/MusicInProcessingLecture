import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import ddf.minim.*; 
import ddf.minim.ugens.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_5_Performing_with_Soundfiles extends PApplet {




Minim minim;
AudioOutput out;
MultiChannelBuffer sampleBuffer;
Sampler unilodge;

public void setup() {
  size(200, 200);
  minim = new Minim(this);
  out = minim.getLineOut();
  
  sampleBuffer = new MultiChannelBuffer(1,1024);
  minim.loadFileIntoBuffer("unilodge.mp3",sampleBuffer);
//  println("Sample Rate: " + sampleRate);
  
  unilodge = new Sampler(sampleBuffer, 44100, 1);
  unilodge.patch(out);
//  unilodge.trigger();
}

public void draw() {
}
//
//void mouseClicked() {
//  
//}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_5_Performing_with_Soundfiles" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
