FROM dockerfile/java:openjdk-7-jre

ADD http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz \
  /tmp/dynamodb_local_latest.tar.gz

RUN mkdir /usr/local/lib/dynamodb-local
WORKDIR /usr/local/lib/dynamodb-local
RUN tar -zxvf /tmp/dynamodb_local_latest.tar.gz

EXPOSE 8000
ENTRYPOINT ["/usr/bin/java", "-Djava.library.path=./DynamoDBLocal_lib", "-jar", "DynamoDBLocal.jar"]
