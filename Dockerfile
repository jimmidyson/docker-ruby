FROM tianon/centos:6.5
MAINTAINER Jimmi Dyson jimmi.dyson@specsavers.com

RUN yum update --setopt=tsflags=nodocs --setopt=group_package_types=mandatory -y
RUN yum install --setopt=tsflags=nodocs --setopt=group_package_types=mandatory -y tar git gcc-c++ patch readline readline-devel zlib zlib-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison iconv-devel
RUN yum clean all

ADD http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.1.tar.gz ruby-2.1.1.tar.gz
RUN tar xzvf ruby-2.1.1.tar.gz && cd ruby-2.1.1 && ./configure --disable-install-doc --prefix=/usr && make && make install && cd .. && rm -rf ruby-2.1.1*

RUN echo gem: --no-document >> /etc/gemrc

RUN gem update --system
RUN gem install bundler
