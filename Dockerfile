From vanillahsu/kks-elixir:latest

RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install dialog apt-utils -y

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python
RUN apt-get install -y git
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y zip
RUN apt-get install -y make
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y curl
RUN wget https://bootstrap.pypa.io/get-pip.py && python get-pip.py
RUN pip install boto3
RUN pip install pycli
RUN pip install requests



RUN DEBIAN_FRONTEND=noninteractive apt-get install -y netcat
# Install MySQL 5.6
RUN LC_ALL=C.UTF-8 DEBIAN_FRONTEND=noninteractive \
    apt-get install -y mysql-server-5.7
    
    #sed -e 's/^datadir\t.*$/datadir = \/data/' -i /etc/mysql/my.cnf && \
   # sed -e 's/^bind-address\t.*$/bind-address = 0.0.0.0/' -i /etc/mysql/my.cnf && \
   # cp /etc/mysql/my.cnf /usr/share/mysql/my-default.cnf && \
   # apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN echo [mysqld] >> /etc/mysql/my.cnf
RUN echo port = 3306 >> /etc/mysql/my.cnf
RUN echo bind-address = 127.0.0.1 >> /etc/mysql/my.cnf
RUN mkdir -p /var/run/mysqld
RUN chown mysql:mysql /var/run
RUN chown mysql:mysql /var/run/mysqld

ENTRYPOINT ["mysqld"]
# Add scripts
#ADD scripts /scripts
#RUN chmod +x /scripts/*.sh
#RUN touch /.firstrun

# Command to run
#ENTRYPOINT ["/scripts/run.sh"]
#CMD [""]

# Expose listen port
EXPOSE 3306

# Expose our data directory
VOLUME ["/data", "/var/log/mysql", "/etc/mysql"]


