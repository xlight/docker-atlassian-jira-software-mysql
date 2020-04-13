FROM atlassian/jira-software

#WORKDIR /root

#RUN curl -o atlassian-agent.tgz https://gitee.com/pengzhile/atlassian-agent/attach_files/283101/download
#RUN tar -zxvf atlassian-agent.tgz && rm -f atlassian-agent.tgz


VOLUME /var/atlassian/application-data/jira

#ADD  http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.30.tar.gz /opt/atlassian/jira/lib/
COPY  mysql-connector-java-5.1.30-bin.jar /opt/atlassian/jira/lib/
ENV ATL_DB_DRIVER com.mysql.jdbc.Driver
ENV ATL_DB_TYPE mysql

ENV JAVA_OPTS "-javaagent:/opt/atlassian-agent.jar"

#RUN ln -s /opt/atlassian/jira/logs/catilina.out


COPY atlassian-agent.jar /opt/
