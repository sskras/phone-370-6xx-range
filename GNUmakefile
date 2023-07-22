all:
	@cat numeracija.rrt.lt-responses.json | ./extract-phone-num-ranges.awk | tee phone-num-ranges.txt
	@git commit -m 'phone-num-ranges.txt: The initial format' phone-num-ranges.txt
