function ytdl4 {
	youtube-dl -f 18 $@
}

function nconv {
	avconv -i "$@.mkv" "$@.mp4"
}

function comb {
	MP4Box -cat "$1_1.mp4" -cat "$1_2.mp4" -cat "$1_3.mp4" -new "$1.mp4"
}
