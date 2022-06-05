[![CC BY 4.0][cc-by-shield]][cc-by]
This work is licensed under a [Creative Commons Attribution 4.0 International License][cc-by].
[![CC BY 4.0][cc-by-image]][cc-by]
[cc-by]: http://creativecommons.org/licenses/by/4.0/
[cc-by-image]: https://i.creativecommons.org/l/by/4.0/88x31.png
[cc-by-shield]: https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg

 <span class="badge-opencollective"><a href="https://github.com/ZarTek-Creole/DONATE" title="Donate to this project"><img src="https://img.shields.io/badge/open%20collective-donate-yellow.svg" alt="Open Collective donate button" /></a></span>
with :
```
version: "3.9"
services:
  multi-stages:
    build: 
      context: .
      args:
        - VAR1=CONTENT1
    environment:
      VAR2: CONTENT2
```
resultat:
```
└> docker-compose up --build --force-recreate
Building multi-stages
Sending build context to Docker daemon   42.5kB
Step 1/9 : FROM debian:sid-slim AS multistages_BUILDER
 ---> 715e7b66ebe0
Step 2/9 : ARG VAR1="testcontent1"
 ---> Using cache
 ---> 70a0a896dee6
Step 3/9 : ENV VAR2="testcontent2"
 ---> Using cache
 ---> 333fc26ecb38
Step 4/9 : RUN echo "ON multistages_BUILDER 'VAR1' is '$VAR1' and 'VAR2' is '$VAR2'"
 ---> Using cache
 ---> bfb198b952cb
Step 5/9 : FROM multistages_BUILDER as multistages_BUILD
 ---> bfb198b952cb
Step 6/9 : RUN echo "1 -> ON multistages_BUILD 'VAR1' is '$VAR1' and 'VAR2' is '$VAR2'"
 ---> Running in 33799dcd0551
1 -> ON multistages_BUILD 'VAR1' is '' and 'VAR2' is 'testcontent2'
Removing intermediate container 33799dcd0551
 ---> 14308ac5b1dd
Step 7/9 : ARG VAR1=""
 ---> Running in fd4c6b3fe31f
Removing intermediate container fd4c6b3fe31f
 ---> 3089dea4ab56
Step 8/9 : ENV VAR2=""
 ---> Running in 0b661970d08c
Removing intermediate container 0b661970d08c
 ---> 5ed0e9459cec
Step 9/9 : RUN echo "2 -> ON multistages_BUILD 'VAR1' is '$VAR1' and 'VAR2' is '$VAR2'"
 ---> Running in f3f313ca0545
2 -> ON multistages_BUILD 'VAR1' is 'CONTENT1' and 'VAR2' is ''
Removing intermediate container f3f313ca0545
 ---> fc6a855706fe
Successfully built fc6a855706fe
Successfully tagged docker-multi-stages-test_multi-stages:latest
Recreating docker-multi-stages-test_multi-stages_1 ... done
Attaching to docker-multi-stages-test_multi-stages_1
docker-multi-stages-test_multi-stages_1 exited with code 0
```
ENVs VAR2 work on first FROM and not on multistages_BUILD