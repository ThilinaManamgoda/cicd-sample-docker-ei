FROM maven:3.3.9
RUN mvn -v
COPY ./helloworld /projects/helloword
RUN mkdir /artifacts && \
cd /projects/helloword/Helloworld && \
mvn clean install && \
cd ../HelloworldCompositeApplication/ && \
mvn clean install && \
cp -r /projects/helloword/HelloworldCompositeApplication/* /artifacts

FROM <BASE>

COPY --from=0 /artifacts/* /home/wso2carbon/wso2mi/repository/deployment/server/carbonapps/
