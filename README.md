# Docker Repository

These are docker recipies to build the driver for and with various mudlibs.

Currently the following mudlibs are provided:
 * LP-245 (using Port 4242 for TCP, 4246 for UDP)
 * [UNItopia](https://www.unitopia.de) (using Port 3333 for TCP, 3335 for UDP)

If you have a recipe for another mudlib, don't hesitate to create a pull request for it.

## Usage

### Build the image yourself

You can build the image yourself.

First clone the repository
```
git clone https://github.com/ldmud/docker.git
```

Build the docker image (in this example the LP-245 mudlib)
```
docker build -t lp245 docker/LP-245
```

The image has now the name `lp245`.

### Use the image from docker hub

The images are also built on docker hub, so you can just download them.

You can download images with
```
docker pull ldmuddev/lp245
```

But this isn't necessary. `docker run` will automatically download required images.

### Running the image

To execute the image (LP-245 uses Port 4242 and 4246) start
```
# When built yourself:
docker run -p 4242:4242 -p 4246:4246/udp --name lp245 lp245
# When using docker hub:
docker run -p 4242:4242 -p 4246:4246/udp --name lp245 ldmuddev/lp245
```

When you want to have write access to the mudlib, you have to
1. mount an external directory as the docker container's mudlib
2. run the docker container under your user account

Here we assume, that the external mudlib directory is named $HOME/mudlib.
If the directory doesn't contain a mudlib, the docker images will put
a fresh mudlib there.

```
docker run -p 4242:4242 -p 4246:4246/udp -u $UID -v $HOME/mudlib:/mud/lib --name lp245 ldmuddev/lp245
```

After that you can use `telnet localhost 4242` to play the game.

### Stopping the container

Stop the container simply with
```
docker stop lp245
```

Have fun!
