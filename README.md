Build client image:
```
docker build -t client-smb:1 .
```

Run server:
```
docker run -it --rm --name samba -p 139:139 -p 445:445 -v $PWD/exports:/share dperson/samba -s "public;/share"
```

Run client in a loop:
```
while true; do
    date
    docker run -it --rm --name client-smb --cap-add=SYS_ADMIN --cap-add DAC_READ_SEARCH --security-opt apparmor:unconfined --link samba:samba client-smb:1
    date
    sleep 1
done
```
