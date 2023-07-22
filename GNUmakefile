all:
	@cat numeracija.rrt.lt-responses.json | ./extract-phone-num-ranges.awk | tee phone-num-ranges.txt
	@git diff .
	@git commit -m 'phone-num-ranges.txt: Format update' phone-num-ranges.txt
