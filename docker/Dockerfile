# base image
FROM centos

# MAINTAINER
MAINTAINER 19548901@qq.com

# put nginx-1.12.2.tar.gz into /usr/local/src and unpack nginx
ADD nginx-1.15.9.tar.gz /usr/local/src

# running required command
RUN yum install -y gcc gcc-c++ glibc make autoconf openssl openssl-devel
RUN yum install -y libxslt-devel -y gd gd-devel GeoIP GeoIP-devel pcre pcre-devel
RUN useradd -M -s /sbin/nologin nginx

# mount a dir to container
VOLUME ["/data"]

# change dir to /usr/local/src/nginx-1.12.2
WORKDIR /usr/local/src/nginx-1.15.9

# execute command to compile nginx
RUN ./configure --user=nginx --group=nginx --prefix=/usr/local/nginx --with-file-aio  --with-http_ssl_module  --with-http_realip_module    --with-http_addition_module    --with-http_xslt_module   --with-http_image_filter_module    --with-http_geoip_module  --with-http_sub_module  --with-http_dav_module --with-http_flv_module    --with-http_mp4_module --with-http_gunzip_module  --with-http_gzip_static_module  --with-http_auth_request_module  --with-http_random_index_module   --with-http_secure_link_module   --with-http_degradation_module   --with-http_stub_status_module && make && make install

ENV PATH /usr/local/nginx/sbin:$PATH

EXPOSE 80

ENTRYPOINT ["nginx"]

CMD ["-g","daemon on;"]
