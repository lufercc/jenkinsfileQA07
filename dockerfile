FROM openjdk:17

WORKDIR /automation

RUN microdnf update \
 && microdnf install --nodocs wget unzip \
 && microdnf clean all \
 && rm -rf /var/cache/yum
 

COPY . .


RUN wget https://services.gradle.org/distributions/gradle-8.1.1-bin.zip -P /tmp
RUN unzip -d /opt/gradle /tmp/gradle-*.zip
ENV GRADLE_HOME=/opt/gradle/gradle-8.1.1
RUN echo $GRADLE_HOME
ENV PATH=$GRADLE_HOME/bin:$PATH
RUN echo $PATH

EXPOSE 7070


ENTRYPOINT ["gradle", "clean"]
CMD ["executeFeature"]
 