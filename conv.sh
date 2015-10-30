function conv {
	printf '%s\0' *.avi | xargs -0 -I {} -P 1 avconv -i "{}" -c copy "{}".mp4
}
