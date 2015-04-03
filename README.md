# Arma III

## How to use this image?

```bash
docker run -it --rm \
    -e STEAM_USERNAME=YOUR_STEAM_USERNAME \
	-e STEAM_PASSWORD=YOUR_STEAM_PASSWORD \
	-v $PWD/arma3:/arma3 \
	-v $PWD/profiles:/server/profiles \
	-p 2302:2302 \
	-p 2303:2303 \
	-p 2304:2304 \
	-p 2305:2305 \
	houki/arma3
```
