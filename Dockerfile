FROM redmine:4.1-passenger
MAINTAINER Markus Amshove "scm@amshove.dev"

USER root
ENV DEBIAN_FRONTEND=noninteractive
RUN mkdir -p /usr/share/man/man1 \
    && apt-get update \
    && apt-get install -y \
        default-jre \
        graphviz \
        curl

RUN mkdir -p /opt/plantuml/ \
    && curl -L -o /opt/plantuml/plantuml.jar http://sourceforge.net/projects/plantuml/files/plantuml.jar/download \
    && chown redmine:redmine /opt/plantuml/plantuml.jar
ADD --chown=redmine:redmine plantuml /opt/plantuml/plantuml
RUN chmod +rwx /opt/plantuml/plantuml*

USER redmine
ENV GRAPHVIZ_DOT=/usr/bin/dot
