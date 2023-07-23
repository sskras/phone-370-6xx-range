all:
	@cat numeracija.rrt.lt-responses.json | ./extract-phone-num-ranges.awk > phone-num-ranges.txt
	@# Via: https://stackoverflow.com/questions/5143795/how-can-i-check-in-a-bash-script-if-my-local-git-repository-has-changes/5143914#comment11054534_5143914
	@git diff --exit-code phone-num-ranges.txt || \
	 git commit -m 'phone-num-ranges.txt: Range update' phone-num-ranges.txt

list: all
	@echo
	@cat phone-num-ranges.txt | awk '$$1 == $$3 { gsub(/./, " ", $$3); print; next } { print }'

state-%:
	@echo
	@cat phone-num-ranges.txt | awk 'BEGIN { while (getline < "phone-num-state.txt") state[$$1] = $$2 } /$</ { num = $$1; print num" "state[num] }'
