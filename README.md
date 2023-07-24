1. Atsiverčiame https://numeracija.rrt.lt/savitarna/user/#/number[RRT Numerio paiešką]
2. Suvedame numerį
3. Spaudžiame „Ieškoti numerio“
4. Galima užklausa `curl` formatu, tik ji reikalauj reCAPTCHA. Pvz.:
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
  --data-raw '{"number":"60504696","recaptcha":"03AAYGu2TXMUvSuLLW2flmgb9O-qOtSwf09jFDaTDf1yy5-19CuI-DnT3B396figJVj7FgiMuLCpSJFLk_N_-q4iEJrUzNJVPbu_M1FCauQKIdFTqjK2CX3ojXsD_Eg4cuam3n7RqQKqkQgHPvQT-faUN_A3FKmQgoYA3CD7DgCMfdhnKo8FnxLXssyVjBzCf0OAdoZ0L-T3R5Sg4FiC9BBSzwwQCIJYaP6OgryfyFrotwWvABueMb5E1paMhckjEd_hSvN9Dmyryk0l4Nh0xTBBUoKd9BvWlk5gnixN--2SxDV6HUmcEgiS_O9IbT0r8opU66fSk_nnnLZSi2w7ytWzSsst0z7_VgCOBCm2ozT-IeBhf4g4GiehyRs0z-AFOm3gpFYawiBpQsBYf7oGaxWMog_xd_RTIJucuKXmY4cA5RtIGvN8G3p3D0r7BctJZjtmieGzZ0WifAV2H0mkt6wauypJ3B6rvkX6XukZPC_7lYSbXzh7iDLCUePFS-P9Lnr993FAoy9ui5aaNle4V6tmHeolU8EdSUDYut8CBo0le3aTlIdWHrZI4"}' \
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
6. Įrašome į `numeracija.rrt.lt-responses.json`, pvz. f49cb7fdafea52cf9b9faded3afbe464cdfa228d
7. Ištraukiame numerių rėžius į failą `phone-num-ranges.txt`:
```
make all
```
8. Suformuojame vienmatį sąrašą:
```
make list
```
9. Tikriname numerio būseną kitais būdais
10. Įrašome būseną į failą `phone-num-state.txt`. Pvz. 8aab519aad84d4f827caa0d07a0cb59ae1200512
