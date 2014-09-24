import ddf.minim.*;

Minim minim;
AudioPlayer player;

void setup() {
  size(200, 200);
  minim = new Minim(this);
  player = minim.loadFile("unilodge.mp3");
  player.play();
  player.loop();
}

void draw() {
}

void mouseClicked() {
  player.pause();
  player.rewind();
  player.play();
}
