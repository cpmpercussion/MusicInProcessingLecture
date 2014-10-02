MusicInProcessingLecture
========================

Examples that go with my lecture on making music in Processing.

## Lab Instructions!

- This is going to be a noisy lab! Maybe bring some headphones?
- The Minim library works fine for sound output on the iMacs in the Peter Karmell Building and the Linux machines in the CSIT labs.
- The iMacs have a microphone, but the CSIT lab computers don't. So if you're in the CSIT labs, don't worry about question 3, or maybe try it on your own computer.

### 0. Make sure you have the Minim code reference up and minim up and running.

Code Reference:

Minim isn't documented in the Processing website! You have to go to the following website to view the documentation of Minim objects and UGens.

- [Minim JavaDoc](http://code.compartmental.net/minim/javadoc/)
- [Minim Website](http://code.compartmental.net/minim/)


Examples and exercises:

- Download this Git Repo (Download ZIP in the right hand panel!).
- open up sketch_1 and make sure it works and makes a sound!

If you want to see more examples, download the [Minim library separately](http://code.compartmental.net/minim/distro/minim-2.2.0.zip) and check out the examples directory. There are lots!

### 1. Make a sketch that makes sounds

The idea of this excercise is to control sounds with a simple interactive sketch.

- open one of your old "zoog" sketches that you can interact with using the mouse.
- take the sound making components out of `sketch_3_FM_Synthesis` and put them into your zoog sketch.
- change the sketch so that the sound changes when the zoog moves!
- you might want to add a `Damp` envelope to the signal chain so that you only hear sound when the zoog moves and not at other times. 

### 2. Make some generative music with sound files.

You're going to combine my "Generative Music" sketch with the "Performing with Soundfiles" sketch. 

- open up my generative music sketch and check out the `PhraseGenerator` class.
- change this class so that it uses the `Sampler` UGen from `sketch_5` rather than an `Oscil` UGen.
- each time the `PhraseGenerator` class triggers a note, it should change the speed and starting point in the sample!
- you might want to add extra constructor arguments to `PhraseGenerator` so that you can make each instance of it sound a bit different! How about a range for the playback speed?

### 3. Use BeatDetect to control a sketch.

Open up my `sketch_7_OnsetDetection`. You're going to use this technique to control a sketch!

- open another old "zoog" sketch, or make a new simple one.
- take the sound detecting components out of my `sketch_7_OnsetDetection` and put them in yours!
- in each frame, check if there's been an onset, and if so, activate some kind of movement in your sketch!