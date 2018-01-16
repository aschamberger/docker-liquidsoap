#!/usr/bin/liquidsoap

# set the path and permissions for the logfile
set("log.file",true) 
set("log.file.path","/config/liquidsoap.log")
#set("log.file.perms",755)

# input from soundcard
input = input.alsa(bufferize=true,fallible=false,device="default:SND_A")
#input = amplify(2.0,input.alsa(bufferize=true,fallible=false,device="default:SND_A"))

# stream it to local icecast, default port and password
output.icecast(%ogg(%flac(samplerate=44100,channels=2,compression=5,bits_per_sample=16)), host="localhost", port=8000, password="hackme", mount="/input.ogg", name="Input", format="audio/ogg", description="Input Stream", input)
