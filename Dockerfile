
FROM alpine:latest

ENV PERL_CPANM_OPT="--curl --no-wget --no-lwp --no-man-pages" \
    PERL_PRIVLIB=/usr/local/share/perl5/site_perl \
    USER=perl

RUN apk add --no-cache \
      curl \
      make \
      perl && \
    (curl -L https://cpanmin.us | perl - Mojolicious) && \
    adduser -D ${USER} && \
    apk del --no-cache \
      curl \
      make

COPY lib/CheckIP.pm     $PERL_PRIVLIB/
COPY script/checkip_app /home/$USER/

USER ${USER}

EXPOSE 8080

CMD ["hypnotoad", "-f", "/home/perl/checkip_app"]
