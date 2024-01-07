FROM alpine AS build
RUN apk add build-base linux-headers
ADD mdns-repeater.c mdns-repeater.c
RUN gcc -o mdns-repeater mdns-repeater.c -DHGVERSION=\"master\"

FROM alpine
RUN apk add bash libcap vlan
COPY --from=build /mdns-repeater /app/mdns-repeater
RUN chmod +x /app/mdns-repeater
RUN setcap cap_net_raw=+ep /app/mdns-repeater
ADD --chmod=0755 run.sh /app/

ENTRYPOINT ["/app/run.sh"]
