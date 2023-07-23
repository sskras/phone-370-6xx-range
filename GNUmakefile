all:
	@cat numeracija.rrt.lt-responses.json | ./extract-phone-num-ranges.awk > phone-num-ranges.txt
	@git diff .
	@git commit -m 'phone-num-ranges.txt: Format update' phone-num-ranges.txt

list:
	@echo
	@cat phone-num-ranges.txt | awk '$$1 == $$3 { gsub(/./, " ", $$3); print; next } { print }'

telia:
	@echo
	@awk '{ do { if (FNR != NR) break; alive[$$1] } while (getline < "phone-num-alive.txt") } /Telia/ { num = $$1; sign = (num in alive) ? "!" : "-"; print num" "sign }' phone-num-ranges.txt
