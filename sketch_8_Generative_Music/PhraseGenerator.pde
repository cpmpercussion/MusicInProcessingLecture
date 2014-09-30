class PhraseGenerator {
  float lastTimePlayed;
  float timeToNextNote;
  float minPlayTime;
  float maxPlayTime;
  Oscil wave;
  Damp envelope;

  PhraseGenerator(AudioOutput out) {
    lastTimePlayed = 0;
    minPlayTime = 2000;
    maxPlayTime = 10000;
    timeToNextNote = 1000;

    wave = new Oscil(0, 0.5, Waves.SINE);
    envelope = new Damp(0.1, 4.0, 0.5);
    wave.patch(envelope);
    envelope.patch(out);
  }

  void playNote() {
    wave.setFrequency(random(1000) + 50);
    envelope.activate();
    println("playing a note!");
  }

  void checkPlayTime() {
    if (millis() > lastTimePlayed + timeToNextNote) {  
      playNote();
      timeToNextNote = minPlayTime + random(minPlayTime, maxPlayTime);
      println("scheduled a note in: " + timeToNextNote + " milliseconds");
      lastTimePlayed = millis();
    }
  }
}
