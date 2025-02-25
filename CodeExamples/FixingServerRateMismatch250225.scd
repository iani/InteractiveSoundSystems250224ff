// How to fix the error when the server boot says:
/*

ERROR: Input sample rate is 4410, but output is 4800. Mismatched sample rates are ...

*/
// In this case run the following line:
Server.default.options.sampleRate = 48000;
// Then try booting the server again.