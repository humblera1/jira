FROM atlassian/jira-software:latest
USER root

COPY crack/atlassian-agent.jar /opt/atlassian/jira/

# Копируем deb пакет MySQL Connector в контейнер
COPY mysql-connector/mysql-connector-j_8.1.0-1ubuntu22.04_all.deb /tmp/

RUN echo 'export CATALINA_OPTS="-javaagent:/opt/atlassian/jira/atlassian-agent.jar ${CATALINA_OPTS}"' >> /opt/atlassian/jira/bin/setenv.sh

# Устанавливаем deb пакет, копируем jar и очищаем временные файлы
RUN apt-get update && \
    apt-get install -y dpkg && \
    dpkg -i /tmp/mysql-connector-j_8.1.0-1ubuntu22.04_all.deb && \
    cp /usr/share/java/mysql-connector-java*.jar /opt/atlassian/jira/lib/ && \
    rm /tmp/mysql-connector-j_8.1.0-1ubuntu22.04_all.deb && \
    apt-get clean && rm -rf /var/lib/apt/lists/*