all: build

build:
	g++ -std=c++17 test.cpp read_support.cpp -o test
clean:
	rm -f test