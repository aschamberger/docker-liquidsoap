# aschamberger/liquidsoap

http://liquidsoap.info/

## Usage

```
docker create \
	--name=Liquidsoap \
	--device=/dev/snd/ \
	-v <path to data>:/config \
	-e USER_ID=<uid> -e GROUP_ID=<gid> -e UMASK=<umask> \
	aschamberger/liquidsoap
```

## Parameters

* `--device=/dev/snd/` - pass sound devices to container
* `-v /config` - icecast data (config/logs)
* `-e USER_ID` - match UID of user *nobody* of host system
* `-e GROUP_ID` - match GID of group *users* of host system
* `-e UMASK` - match UMASK of host system
