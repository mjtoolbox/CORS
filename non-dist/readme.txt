Tomcat 7 setup
- Install Tomcat in the directory
- Update C:\DevApps\apache-tomcat-7.0.69\conf\tomcat-users.xml by adding below lines.
  <role rolename="admin"/>
  <role rolename="manager-script"/>
  <role rolename="manager-gui"/>
  <role rolename="manager-jmx"/>
  <user username="admin" password="admin" roles="manager-gui,admin,manager-jmx,manager-script" />
 - Update settings.xml in your maven. Navigate to C:\DevApps\apache-maven-3.2.1\conf\settings.xml
 <servers>
    <server>
      <id>tomcat7</id>
      <username>admin</username>
      <password>admin</password>
    </server> 
 </servers>
 - Add tomcat maven plugin in pom.xml with configuration information
 - mvn tomcat7:redeploy can't delete jar fiels in WEB-INF. To prevent this, modify <Context> tag in context.xml with below.
  <Context antiResourceLocking="true">
 - Build your war > mvn clean package
 - Deploy war > mvn tomcat7:deploy or mvn tomcat7:redeploy 