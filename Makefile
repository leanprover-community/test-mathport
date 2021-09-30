tar = mathport-09-29-2021.tar.gz

download-release:
	rm -rf Lib4 Logs PreData
	curl -L -o $(tar) -C - https://github.com/leanprover/mathport/releases/download/v0.0.0.0/$(tar)
	tar zxvf $(tar)

build:
	lake build