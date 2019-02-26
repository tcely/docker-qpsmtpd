FROM debian:9-slim
LABEL maintainer="https://keybase.io/tcely"

ENV PAGER="less" PATH="/sbin:/usr/sbin:/bin:/usr/bin" QPSMTPD_CONFIG="/etc/qpsmtpd"
EXPOSE 25/tcp

RUN apt update && apt -y install qpsmtpd ca-certificates iproute2 less procps
RUN apt -y upgrade; apt -y autoremove

ENTRYPOINT ["/usr/bin/qpsmtpd-forkserver", "--user", "qpsmtpd", "--port", "25"]
CMD ["--help"]
