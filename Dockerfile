FROM quay.io/pires/docker-jre:8u151

LABEL maintainer pjpires@gmail.com

ENV HBASE_VERSION 1.3.1

# Download and prepare HBase installation
RUN mkdir -p /opt ; \
  cd /opt ; \
  apk add --update bash curl ca-certificates ; \
  ( curl -Lskj http://www-eu.apache.org/dist/hbase/1.3.0/hbase-$HBASE_VERSION-bin.tar.gz | gunzip -c - | tar xf - ) ; \
  mv hbase-$HBASE_VERSION hbase ; \
  rm -rf $(find . | egrep "(\.(exe|bat)$)") ; \
  apk del curl

# Copy configuration files
ADD hbase-site.xml /etc/hbase/conf/hbase-site.xml

# Set needed environment variable
ENV JAVA_HOME /usr

# Run
CMD /opt/hbase/bin/hbase master start
