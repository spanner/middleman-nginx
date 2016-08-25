FROM ruby/2.3.1-slim

RUN gem install middleman therubyracer haml haml_coffee_assets haml_assets --no-rdoc --no-ri

RUN add-apt-repository -y ppa:nginx/stable
RUN apt-get update
RUN apt-get -y install nginx

RUN mkdir /srv/www

ADD default /etc/nginx/sites-available/default
ADD nginx.conf /etc/nginx/nginx.conf
