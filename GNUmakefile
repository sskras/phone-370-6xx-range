all:
	@cat numeracija.rrt.lt-responses.json | ./extract-phone-num-ranges.awk > phone-num-ranges.txt
	@git diff .
	@git commit -m 'phone-num-ranges.txt: Format update' phone-num-ranges.txt

list:
	@echo
	@cat phone-num-ranges.txt | awk '$$1 == $$3 { gsub(/./, " ", $$3); print; next } { print }'

telia:
	@echo
	@awk 'FNR == NR { alive[$$0]; next } /Telia/ { num = $$1; sign = num in alive ? "!" : "-"; print num" "sign }' phone-num-alive.txt phone-num-ranges.txt
