all:
	@cat numeracija.rrt.lt-responses.json | ./extract-phone-num-ranges.awk > phone-num-ranges.txt
	@# Via: https://stackoverflow.com/questions/5143795/how-can-i-check-in-a-bash-script-if-my-local-git-repository-has-changes/5143914#comment11054534_5143914
	@# Via: https://stackoverflow.com/questions/367069/how-can-i-negate-the-return-value-of-a-process/367076#367076
	@git diff --quiet --exit-code . || \
	 git commit -m 'phone-num-ranges.txt: Range update' phone-num-ranges.txt

list:
	@echo
	@cat phone-num-ranges.txt | awk '$$1 == $$3 { gsub(/./, " ", $$3); print; next } { print }'

telia:
	@echo
	@cat phone-num-ranges.txt | awk 'BEGIN { while (getline < "phone-num-state.txt") state[$$1] = $$2 } /Telia/ { num = $$1; print num" "state[num] }'
