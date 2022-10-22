# eeprom-presenter
Simple container with command to show EEPROM on interface

## How to build on any Linux
Prepare EEPROM files for interfaces and move them to `eeproms` (remove default `eth1` folder before).

**Note**: folders' names in `eeproms` directory should reflect network interfaces' names (what is not cover here).

Then:
```
docker build -t pi-wegrzyn/eeprom-presenter:latest .
```

## How to run on any Linux
```
docker run -ti pi-wegrzyn/eeprom-presenter
```

## How to run in GNS3's project
SSH to our GNS3 server and build container as above. Then follow [that guide](https://docs.gns3.com/docs/emulators/docker-support-in-gns3).

**Note**: Default GNS3 interfaces are enumerating as eth0, eth1 and so on.

**Note**: Do not type `exit` in console because it leads to shutdown container.

## License
All software is under GNU GPL version 3.
