all: clean download-release build

tar = mathport-10-02-2021.tar.gz

clean:
	rm -rf Lib4 Logs PreData

download-release:
	curl -L -o $(tar) -C - https://github.com/leanprover/mathport/releases/download/v0.0.0.0/$(tar)
	tar zxvf $(tar)

build:
	lake build