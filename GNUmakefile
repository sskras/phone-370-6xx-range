.PHONY: all list

all:
	@cat numeracija.rrt.lt-responses.json | ./extract-phone-num-ranges.awk > phone-num-ranges.txt
	@# Via: https://stackoverflow.com/questions/5143795/how-can-i-check-in-a-bash-script-if-my-local-git-repository-has-changes/5143914#comment11054534_5143914
	@git diff --exit-code phone-num-ranges.txt || \
	 git commit -m 'phone-num-ranges.txt: Range update' phone-num-ranges.txt

list: all
	@echo
	@cat phone-num-ranges.txt | ./phone-num-linearize.awk

state-%: all
	@echo
	@cat phone-num-ranges.txt | awk 'BEGIN { while (getline < "phone-num-state.txt") state[$$1] = $$2 } $$0 ~ $* { num = $$1; print num" "state[num] }'

filter:
	@grep -E "^.....(6..|.9.|..6)"
