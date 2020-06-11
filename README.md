# Howto

Either pull the image from docker (\~7GB):

`docker pull christophkirsch/texlive:2020`

Or else build it yourself (\~3hrs):

`docker build --no-cache -t texlive .`

Then mount your current directory and run it:

`docker run -v $(pwd):/opt/home -it texlive`

with support of all texlive commands as well as `make` and `git`.

You may also push it to docker using your username:

`docker tag texlive christophkirsch/texlive:2020`

`docker push christophkirsch/texlive`