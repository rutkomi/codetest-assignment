FROM ubuntu:18.04

USER root
RUN apt-get update
RUN apt-get install -y git default-jre maven curl

COPY bin /codetest-assignment/bin
RUN chmod -R a+x /codetest-assignment/bin
CMD ["/codetest-assignment/bin/start.sh"]
