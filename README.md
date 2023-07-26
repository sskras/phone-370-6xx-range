<details> <summary> <strong> Senas numerių atrinkimo kelias </strong> <summary>
1. Atsiverčiame [RRT Numerio paiešką](https://numeracija.rrt.lt/savitarna/user/#/number)
2. Suvedame numerį
3. Spaudžiame „Ieškoti numerio“
4. Galima užklausa `curl` formatu, tik ji reikalauja reCAPTCHA.  Sunkoka automatizuoti.  Pvz.:
```
curl 'https://numeracija.rrt.lt/api/public/number/checknumber' \
  -H 'authority: numeracija.rrt.lt' \
  -H 'accept: application/json, text/plain, */*' \
  -H 'accept-language: en-US,en;q=0.9,lt;q=0.8,ru;q=0.7' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json; charset=UTF-8' \
  -H 'cookie: ASP.NET_SessionId=jf5ybjfa2vs0f3m1il0kh0zy' \
  -H 'origin: https://numeracija.rrt.lt' \
  -H 'pragma: no-cache' \
  -H 'referer: https://numeracija.rrt.lt/savitarna/user/' \
  -H 'sec-ch-ua: "Not.A/Brand";v="8", "Chromium";v="114", "Google Chrome";v="114"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "Windows"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-origin' \
  -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36' \
  --data-raw '{"number":"60503999","recaptcha":"03AAYGu2Q-m0u8At-0zcNxGcTX2zsDsLq-VzsH0zh2rtsEvzYdnu5y4VXdfnlEIDc-XZzcZPGuiadnQqNpQ2d6L7t7jTGA5ZWUViX_G_NLgHYKPxQUjQ4_WXNpNcu4AgKdIVQb1K46x4l28xhiBSlYgM7P93bp0R8ePTvarlRHGYD9O729uYbN_flTQbW0M8bHW5B1gNY5m18SKmdZM2imdZbkclSezKvcoA5sZja5JLm2i0oK32GatqyaBO5cUnAjHWhIOUm7wSJtx4dvzSZ8PrsFqq2OOejYP3H3Sy-zWv4l7tUpOQSMrjMhSgytck7laASG0PVGtHkFCHXFCqfDkNYLfDsLjZk_q0C_Lto1aqZjJMfSSFWbeC1kw39V5eaqRC0gqUXzH4vhDS9aKww96qFFnH__KSTaUGrAF8iO0PkDgNTWPUwbjF2M_O8I9g11xeEHemafEYLcw39PZmOlyuDpbzWoRYJIZJVT6iulfc-rsNDr7WLbUbD81tPpSTzVhwp9LvVC8V4uJxcQBtegHE_MEOmKO2i5jokYFDl_fWdcxS5XA24tbhU"}' \
  --compressed
```
5. Gauname atsakymą JSON formatu:
```
{
    "id": 0,
    "numberFrom": 60504696,
    "numberTo": 60504720,
    "status": "Užimtas",
    "ownerFullName": "UAB \"Tele2\"",
    "numberCount": 0,
    "numberPlanId": 0,
    "personType": 0,
    "personalCode": "111471645",
    "range": "60504696 - 60504720",
    "canAssign": false,
    "canRevoke": false,
    "canTransfer": false
}
```
6. Įterpiame jį į `numeracija.rrt.lt-responses.json`, pvz. [`c59013e`](https://github.com/sskras/phone-370-6xx-range/commit/c59013e)
7. Ištraukiame numerių rėžius į failą `phone-num-ranges.txt`:
```
$ make all
diff --git a/phone-num-ranges.txt b/phone-num-ranges.txt
index bf79cb2..df59ab1 100644
--- a/phone-num-ranges.txt
+++ b/phone-num-ranges.txt
@@ -1,3 +1,4 @@
+60503989 - 60503999 UAB Tele2
 60504000 - 60504000 UAB Bitė Lietuva
 60504001 - 60504003 UAB Tele2
 60504004 - 60504004 Telia Lietuva, AB
[master 2e7a4b3] phone-num-ranges.txt: Range update
 1 file changed, 1 insertion(+)

```
8. Suformuojame vienmatį sąrašą:
```
$ make list
  ...
60504990 UAB Tele2
60504991 Telia Lietuva, AB
60504992 UAB Tele2
60504993 Telia Lietuva, AB
60504994 UAB Tele2
60504995 UAB Tele2
60504996 UAB Tele2
60504997 UAB Tele2
60504998 Telia Lietuva, AB
60504999 UAB Tele2
60505000 UAB Bitė Lietuva
60506391 UAB Tele2
  ...
```
9. Tikriname numerio būseną kitais būdais
10. Įrašome [būseną](https://github.com/sskras/phone-370-6xx-range/commit/5c529c1) į failą `phone-num-state.txt`.
Pvz. [`4447bba`](https://github.com/sskras/phone-370-6xx-range/commit/4447bba)
```
--- a/phone-num-state.txt
+++ b/phone-num-state.txt
@@ -35,6 +35,7 @@
 60504659 !
 60504668 !
 60504674 !
+60504679 ~
 60504681 !
 60504684 !
 60504693 !
```
11. Prijungiame sužymėtas numerių būsenas prie surastų numerių pagal tiekėjo vardą:
```
$ make list | make state-Bitė
  ...
$ make list | make state-Tele2
  ...
$ make list | make state-Teledema

60504052 !
60504566 !
60504633 ~
60504644 !

$ make list | make state-Telia
  ...
```
12. Filtruojame būsenas numerių, kurie atitinka Hardcoded prefiksą ir vieną iš trijų skaitmenų (`6`, `9` ir `6`):
```
$ make list | make state-Bitė | make filter
60504093 !
60504095 !
60504246 !
60504291 ++
60504297 !
60504546 !
60504586 !
60504616 !
60504631 !
60504652 !
60504659 !
60504681 !
60504693 !
60504695 !
60504736 !
60504793 ++
60504798 !
60504826 !
60504916 !
```
13. Filtruojame būsenas numerių, kurie atitinka Hardcoded prefiksą ir **du** iš trijų skaitmenų (`6`, `9` ir `6`):
```
$ make list | make state-Bitė | make filter-two
60504616 !
60504693 !
60504695 !
```
14. Filtruojame rastus visų tiekėjų numerius pagal Hardcoded reikšmes:
```
$ make list | make filter-two
60503996 UAB Tele2
60504096 UAB Tele2
60504196 UAB Tele2
60504296 UAB Tele2
60504396 UAB Tele2
60504496 UAB Tele2
60504596 UAB Tele2
60504606 UAB Tele2
60504616 UAB Bitė Lietuva
60504626 UAB Tele2
60504636 UAB Tele2
60504646 Telia Lietuva, AB
60504656 UAB Tele2
60504666 UAB Tele2
60504676 UAB Tele2
60504686 UAB Tele2
60504690 UAB Tele2
60504691 UAB Tele2
60504692 UAB Tele2
60504693 UAB Bitė Lietuva
60504694 UAB Tele2
60504695 UAB Bitė Lietuva
60504696 UAB Tele2
60504697 UAB Tele2
60504698 UAB Tele2
60504699 UAB Tele2
60504796 UAB Tele2
60504896 UAB Tele2
60504996 UAB Tele2
60506396 UAB Tele2
```
</details>

<details open> <summary> <strong> Naujas numerių atrinkimo kelias </strong> <summary>
1. Pasirenkame tel. nr., kuriam artimų kitų numerių ieškosime, pvz.: `60504696`.
2. Pasirenkame, kiekos daugiausiai skaitmenų skirtumas priimtinas, pvz. dviejų.
3. Fiksuojame, kurie numerio skaitmenys turi išlikti tokie patys, pvz. `605`.
4. Pasižymime likusią numerio dalį, pvz. `04696`.
```
$ cat numerio-generacija.txt
 _ Pastovioji dalis, priešdėlis / prefiksas
|
|   _ Kintanti dalis, noriu parinkti kuo artimesnę
|  |  (kad skirtųsi tik du skaitmenys ar vienas)
v  v
===.....
60504696
```
5. Ją kopijuojame į kelis šablonus, kur sužymime du skaitmenys, kuriems leista skirtis nuo originalo, pvz.:
```
$ cat numerio-generacija.txt
  ...
605046..
60504.9.

60504..6
6050.6.6

6050..96
605.4.96

605..696
6050.69.

605.469.
605.46.6
```
</details>
