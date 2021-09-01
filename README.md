# kobo-qt-dev-docker

A complete development environment for cross compiling Qt apps for Kobo Arm targets, see https://github.com/Rain92/kobo-qt-setup-scripts.
Running the docker file can launch a Bash shell or Qt Creator instance.
The docker image will contain the kobo platform plugin, UMR and a simple scribble sample app. 
Qt creator is preconfigured to be able to build both for linux desktop and kobo targets.

## Docker Image
The docker image is hosted on https://hub.docker.com/r/rain92/kobo-qt-dev and can be pulled via: 

docker pull rain92/kobo-qt-dev

Usage:
docker run -it -v /tmp:/tmp kobo-qt-dev [qtcreator [$DISPLAY]]

The -v flag will mount a shared folder on the docker image, "-v /tmp:/tmp" is necessary to run in GUI mode
The qtcreator flag will run Qt Creator otherwise it will just launch a bash shell.
The display flag will set the output display and defaults to ":0"
