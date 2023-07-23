all:
	@cat numeracija.rrt.lt-responses.json | ./extract-phone-num-ranges.awk > phone-num-ranges.txt
	@git diff .
	@git commit -m 'phone-num-ranges.txt: Range update' phone-num-ranges.txt

list:
	@echo
	@cat phone-num-ranges.txt | awk '$$1 == $$3 { gsub(/./, " ", $$3); print; next } { print }'

telia: all
	@echo
	@cat phone-num-ranges.txt | awk 'BEGIN { while (getline < "phone-num-state.txt") state[$$1] = $$2 } /Telia/ { num = $$1; print num" "state[num] }'
