FROM alpine

RUN apk update; apk add --no-cache cifs-utils
CMD set -x ; \
    mount.cifs //$SAMBA_PORT_445_TCP_ADDR/public /mnt/ -o vers=3.0,user=nobody,password= ; \
    ls -la /mnt ; \
    umount /mnt ; \
    echo "umount ok"

