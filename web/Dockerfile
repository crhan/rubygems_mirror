FROM nginx:latest
MAINTAINER qhwa <qhwa@pnq.cc>

RUN apt-get update && apt-get install wget curl sudo -y

# -- web
ADD htdocs /app/web
ADD nginx_conf /etc/nginx/conf.d/

# -- source mirrors
# 源码来源
ENV RUBY_SRC_UPSTREAM=http://cache.ruby-lang.org/pub/ruby/
# 使用 gira 加速网络请求
ENV GIRA_API_TOKEN=""
ADD cron /app/cron
VOLUME /ruby_sources

CMD ["nginx", "-g", "daemon off;"]
