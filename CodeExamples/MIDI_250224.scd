// Intro to midi.
//:First steps - from help file
(
var notes, on, off;

MIDIClient.init;
MIDIIn.connectAll;

notes = Array.newClear(128);    // array has one slot per possible MIDI note

on = MIDIFunc.noteOn({ |veloc, num, chan, src|
    notes[num] = Synth(\default, [\freq, num.midicps,
        \amp, veloc * 0.00315]);
});

off = MIDIFunc.noteOff({ |veloc, num, chan, src|
    notes[num].release;
});

q = { on.free; off.free; };
)
//: First steps, one by one.
// Initialize MIDI client to find connected midi devices.
MIDIClient.init;
// Connect all midi devices available
MIDIIn.connectAll;
//List connected sources
MIDIClient.sources;
//Activate midi input and post any incomming MIDI messages
//Post incoming noteOn messages
MIDIIn.addFuncTo(\noteOn, { | ... args |
	postln("MIDIIn received" + args);
})
