FROM maven:3.5.3-jdk-8
COPY . /temp/
WORKDIR /temp
RUN mvn install:install-file -Dfile=additional_libs/jss-4.2.5.jar -DgroupId=org.mozilla -DartifactId=jss -Dversion=4.2.5 -Dpackaging=jar
RUN mvn install:install-file -Dfile=additional_libs/MITyCLibAPI-1.0.4.jar -DgroupId=es.mityc.javasign -DartifactId=api -Dversion=1.0.4 -Dpackaging=jar
RUN mvn install:install-file -Dfile=additional_libs/MITyCLibCert-1.0.4.jar -DgroupId=es.mityc.javasign -DartifactId=cert -Dversion=1.0.4 -Dpackaging=jar
RUN mvn install:install-file -Dfile=additional_libs/MITyCLibOCSP-1.0.4.jar -DgroupId=es.mityc.javasign -DartifactId=ocsp  -Dversion=1.0.4 -Dpackaging=jar
RUN mvn install:install-file -Dfile=additional_libs/MITyCLibPolicy-1.0.4.jar -DgroupId=es.mityc.javasign -DartifactId=policy -Dversion=1.0.4 -Dpackaging=jar
RUN mvn install:install-file -Dfile=additional_libs/MITyCLibTrust-1.0.4.jar -DgroupId=es.mityc.javasign -DartifactId=trust -Dversion=1.0.4 -Dpackaging=jar
RUN mvn install:install-file -Dfile=additional_libs/MITyCLibTSA-1.0.4.jar -DgroupId=es.mityc.javasign -DartifactId=tsa -Dversion=1.0.4 -Dpackaging=jar
RUN mvn install:install-file -Dfile=additional_libs/MITyCLibXADES-1.0.4.jar -DgroupId=es.mityc.javasign -DartifactId=xades -Dversion=1.0.4 -Dpackaging=jar
RUN mvn install:install-file -Dfile=additional_libs/xmlsec-1.4.2-ADSI-1.0.jar -DgroupId=org.apache.xmlsec-adsi -DartifactId=xmlsec-adsi -Dversion=1.4.2 -Dpackaging=jar
RUN mvn clean package install
EXPOSE 8080
WORKDIR /temp/app
CMD ["mvn", "spring-boot:run", "-Pdevelopment" ]