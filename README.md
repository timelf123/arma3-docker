# Arma III

## How to use this image?

```bash
docker run -it \
	--env-file credentials \
	--env-file modset \
	-v $PWD/arma3:/arma3 \
	-v $PWD/profiles:/profiles \
	-p 2302:2302/udp \
	-p 2303:2303/udp \
	-p 2304:2304/udp \
	-p 2305:2305/udp \
	houki/arma3
```

## Sample `credentials` file

```
STEAM_USERNAME=your_steam_username
STEAM_PASSWORD=your_steam_password
```

## Sample `modset` file

```
MODS="@mod1;@mod2"
```

## Custom mission

```bash
docker run -it \
	--env-file credentials \
	--env-file modset \
	-v $PWD/arma3:/arma3 \
	-v $PWD/profiles:/profiles \
	-v $PWD/my_mission/main.cfg:/server/main.cfg \
	-v $PWD/my_mission/basic.cfg:/server/basic.cfg \
	-p 2302:2302/udp \
	-p 2303:2303/udp \
	-p 2304:2304/udp \
	-p 2305:2305/udp \
	houki/arma3
```

## Stop externally

```bash
docker exec [container name/id] kill -s SIGINT $(docker exec arma3server ps aux | grep '[a]rma3server' | awk '{print $2}')
```

This sends SIGINT to all processes running within container that have 'arma3server' in their launch command. Typically this only includes 'sh' and (the true target) 'arma3server'. 'sh' ignores. 'arma3server' shuts down gracefully. It's not ideal but will do for now. This is an effective way to reboot the server if you're launching the container with ```--restart=unless-stopped``` or something similar.
