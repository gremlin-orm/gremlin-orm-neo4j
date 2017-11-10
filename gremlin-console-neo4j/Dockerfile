FROM openjdk:8-alpine
MAINTAINER Ian Lai <os@fyianlai.com>

ARG GREMLIN_VERSION=3.2.1

ARG BUILD_DATE
ARG VCS_REF
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/MrSaints/docker-gremlin-neo4j"

RUN apk add --update bash coreutils && rm -rf /var/cache/apk/* && \
    wget -O /tmp/gremlin-console.zip http://mirror.catn.com/pub/apache/tinkerpop/$GREMLIN_VERSION/apache-gremlin-console-$GREMLIN_VERSION-bin.zip && \
    unzip /tmp/gremlin-console.zip -d / && \
    mv /apache-gremlin-console-$GREMLIN_VERSION/ /gremlin-console/ && \
    chmod +x /gremlin-console/bin/gremlin.sh && \
    rm /tmp/gremlin-console.zip

WORKDIR /gremlin-console/

COPY ./grapeConfig.xml /root/.groovy/grapeConfig.xml
COPY ./install-neo4j-gremlin.groovy /gremlin-console/install-neo4j-gremlin.groovy
RUN /bin/bash -c "/gremlin-console/bin/gremlin.sh -e install-neo4j-gremlin.groovy"

CMD ["/bin/bash", "/gremlin-console/bin/gremlin.sh"]