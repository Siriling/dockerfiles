FROM java:8
LABEL maintainer="Siriling <Siriling@siriling.com>"

WORKDIR /app
#RUN java -Dmaven.multiModuleProjectDirectory=/blog_server -Dmaven.home=C:\Users\Ling\.m2\wrapper\dists\apache-maven-3.8.3-bin\5a6n1u8or3307vo2u2jgmkhm0t\apache-maven-3.8.3 -Dclassworlds.conf=C:\Users\Ling\.m2\wrapper\dists\apache-maven-3.8.3-bin\5a6n1u8or3307vo2u2jgmkhm0t\apache-maven-3.8.3\bin\m2.conf "-Dmaven.ext.class.path=D:\IDEA\IntelliJ IDEA 2022.1.4\plugins\maven\lib\maven-event-listener.jar" "-javaagent:D:\IDEA\IntelliJ IDEA 2022.1.4\lib\idea_rt.jar=4408:D:\IDEA\IntelliJ IDEA 2022.1.4\bin" -Dfile.encoding=UTF-8 -classpath C:\Users\Ling\.m2\wrapper\dists\apache-maven-3.8.3-bin\5a6n1u8or3307vo2u2jgmkhm0t\apache-maven-3.8.3\boot\plexus-classworlds-2.6.0.jar;C:\Users\Ling\.m2\wrapper\dists\apache-maven-3.8.3-bin\5a6n1u8or3307vo2u2jgmkhm0t\apache-maven-3.8.3\boot\plexus-classworlds.license org.codehaus.classworlds.Launcher -Didea.version=2022.1.4 -s D:\Environment\Maven\apache-maven-3.8.5\conf\settings.xml -Dmaven.repo.local=D:\Environment\Maven\apache-maven-3.8.5\maven-repo -DskipTests=true package
COPY start.sh ./
RUN chmod a+x /app/start.sh

ADD movie-server.jar movie.jar
EXPOSE 8080
CMD [ "sh", "-c", "/app/start.sh" ]