FROM hashload/delphi-dev:10.3.1-rio
RUN apt-get -y update \
    && apt-get -y install \
        libpq5 \
    && ln -s /usr/lib/x86_64-linux-gnu/libpq.so.5 /usr/lib/x86_64-linux-gnu/libpq.so