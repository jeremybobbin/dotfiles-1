#!/bin/bash
mov=$1
mov_out=$2
tmpaud=/tmp/audio.$$.mp3
tmpaud_l=/tmp/audio.$$.left.mp3
tmpaud_r=/tmp/audio.$$.right.mp3
ffmpeg -i out_yt.mov -b:a 192K -vn atrack.mp4
ffmpeg -i $mov -b:a 192K -vn $tmpaud
ffmpeg -i $tmpaud -map_channel 0.0.0 $tmpaud_l -map_channel 0.0.1 $tmpaud_r
ffmpeg -i $mov -i audio.wav -c:v copy -c:a aac -strict experimental -map 0:v:0 -map 1:a:0 output.mp4
ffmpeg -i $mov -i $tmpaud_l -c:v copy -c:a aac -strict experimental -map 0:v:0 -map 1:a:0 $mov_out
