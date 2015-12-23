FROM alpine

MAINTAINER Jacob Blain Christen <mailto:dweomer5@gmail.com, https://github.com/dweomer, https://twitter.com/dweomer>

ENV NGINX_VERSION=1.9.9

RUN set -x \
 && mkdir -p /tmp/src/nginx \
 && export BUILD_DEPS=" \
        autoconf \
        automake \
        curl \
        g++ \
        gcc \
        gzip \
        libtool \
        linux-headers \
        make \
        openldap-dev \
        openssl-dev \
        pcre-dev \
        tar \
        unzip \
        zlib-dev \
    " \
 && apk add --update ${BUILD_DEPS} \
        libldap \
        openssl \
        pcre \
        zlib \
# Install Nginx from source, see http://nginx.org/en/linux_packages.html#mainline
 && curl -fsSL https://github.com/nginx/nginx/archive/release-${NGINX_VERSION}.tar.gz | tar xz --strip=1 -C /tmp/src/nginx \
 && curl -fsSL https://github.com/kvspb/nginx-auth-ldap/archive/master.zip -o /tmp/nginx-auth-ldap-master.zip \
 && cd /tmp/src \
 && unzip /tmp/nginx-auth-ldap-master.zip \
 && cd /tmp/src/nginx \
 && ./auto/configure \
        --prefix=/usr/share/nginx \
        --sbin-path=/usr/sbin/nginx \
        --conf-path=/etc/nginx/nginx.conf \
        --error-log-path=/var/log/nginx/error.log \
        --http-log-path=/var/log/nginx/access.log \
        --pid-path=/var/run/nginx.pid \
        --lock-path=/var/run/nginx.lock \
        --http-client-body-temp-path=/var/cache/nginx/client_temp \
        --http-proxy-temp-path=/var/cache/nginx/proxy_temp \
        --http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp \
        --http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp \
        --http-scgi-temp-path=/var/cache/nginx/scgi_temp \
        --user=nginx \
        --group=nginx \
        --with-http_ssl_module \
        --with-http_realip_module \
        --with-http_addition_module \
        --with-http_sub_module \
        --with-http_dav_module \
        --with-http_flv_module \
        --with-http_mp4_module \
        --with-http_gunzip_module \
        --with-http_gzip_static_module \
        --with-http_random_index_module \
        --with-http_secure_link_module \
        --with-http_stub_status_module \
        --with-http_auth_request_module \
        --with-mail \
        --with-mail_ssl_module \
        --with-file-aio \
        --with-http_v2_module \
        --with-ipv6 \
        --with-threads \
        --with-stream \
        --with-stream_ssl_module \
        --with-http_slice_module \
        --add-module=/tmp/src/nginx-auth-ldap-master \
 && make \
 && make install \
 && ln -sf /dev/stdout /var/log/nginx/access.log \
 && ln -sf /dev/stderr /var/log/nginx/error.log \
 && addgroup -S nginx \
 && adduser -S nginx \
# Clean up build-time packages
 && apk del --purge ${BUILD_DEPS} \
# Clean up anything else
 && rm -fr \
    /etc/nginx/*.default \
    /tmp/* \
    /var/tmp/* \
    /var/cache/apk/*

COPY src/main/resources/etc/ /etc/

VOLUME ["/var/cache/nginx"]

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]