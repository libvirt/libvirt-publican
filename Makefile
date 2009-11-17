
all:
	publican build --langs=en-US --formats=xml --publish

rpm:
	publican package --binary

clean:
	publican clean
