all:
	@cat numeracija.rrt.lt-responses.json | ./extract-phone-num-ranges.awk > phone-num-ranges.txt
	@git diff .
	@git commit -m 'phone-num-ranges.txt: Format update' phone-num-ranges.txt

list:
	@echo
	@cat phone-num-ranges.txt | awk '$$1 == $$3 { gsub(/./, " ", $$3); print; next } { print }'

telia:
	@echo
	@awk '/Telia/ { print $$1" "$$2 }' phone-num-ranges.txt
