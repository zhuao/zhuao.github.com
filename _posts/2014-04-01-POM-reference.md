---
  title: POM preference
  layout: post
  categories: Maven, POM
  author: Ao Zhu
  summary: Descript the structure of pom file to avoid forget how to run task.
    
---



<a name="top"></a>The simplest structure of POM file. [The Basics](#basic), [Build settings](#build), [Project info](#info), [Environment settings](#env) <a name="top"></a>

	<project xmlns="http://maven.apache.org/POM/4.0.0"
  	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
                     http://maven.apache.org/xsd/maven-4.0.0.xsd">
		<modelVersion>4.0.0</modelVersion>
	  	
	  	<!-- The Basics -->
 		<groupId>...</groupId>
 		<artifactId>...</artifactId>
 		<version>...</version>
 		<packaging>war</packaging>
 		<parent>...</parent>
 		<dependencies>...</dependencies>
		<dependencyManagement>...</dependencyManagement>
 	    <modules>
 	    	<module>my-project</module>
    	</modules>
		<properties>...	</properties>
		
		<!-- Build Settings -->  
		<build>
 			<defaultGoal>install</defaultGoal>
 			<directory>${basedir}/target</directory>
 			<finalName>${artifactId}-${version}</finalName>
 			<filters>...</filters>
			<resources>...</resources>
			<testResources>...</testResources> 
			<plugins>...</plugins>
			<extensions>
			</extensions>
		</build>
		<profiles>...</profiles>
		<reporting>
			<outputDirectory>${basedir}/target/site</outputDirectory>
		</reporting>

		<!-- More Project Information -->
		<name>...</name>
		<description>...</description>
		<url>...</url>
		<inceptionYear>...</inceptionYear>
		<licenses>...</licenses>
		<organization>...</organization>
		<developers>...</developers>
		<contributors>...</contributors>
		
		<!-- Environment Settings -->
		<issueManagement>...</issueManagement>
		<ciManagement>...</ciManagement>
		<mailingLists>...</mailingLists>
		<scm>...</scm>
		<prerequisites>...</prerequisites>
		<repositories>...</repositories>
		<pluginRepositories>...</pluginRepositories>
		<distributionManagement>...</distributionManagement>
		
	</project>


<a name="basic">The basic elements</a>&nbsp;&nbsp;&nbsp;&nbsp; [TOP](#top)

        <!--Required -->
		<modelVersion>4.0.0</modelVersion>
        
        <!-- The elements are inherited: dependencies, developers and contributors, plugin lists, reports lists, plugin executions with matching ids, plugin configuration -->
        <parent>
	    	<groupId>org.codehaus.mojo</groupId>
 		    <artifactId>my-parent</artifactId>
		    <version>2.0</version>
	    	<relativePath>../my-parent</relativePath>
	     </parent>
	  	
	  	<!-- The Basics -->
 		<groupId>...</groupId>
 		<artifactId>...</artifactId>
 		<version>...</version>
 		<!--packaging values: pom, jar, maven-plugin, ejb, war, ear, rar, par.-->
 		<packaging>war</packaging>
 		<parent>...</parent>
 		<dependencies>
 			<dependency>
				<groupId>junit</groupId>
		        <artifactId>junit</artifactId>
      			<version>3.8.1</version>
		        <scope>test</scope>
		        <systemPath>~/libs</systemPath>
		        <exclusions>
		        	<!-- It's dependency of this dependency(e.g. junit) -->
					<exclusion>
					  <groupId>org.apache.maven</groupId>
					  <artifactId>maven-core</artifactId>
					</exclusion>
      			</exclusions>
		    </dependency>
		    ...
		</dependencies>
		<!-- It clarify the dependency for child project, but won't include the dependecy jar for it. -->
		<dependencyManagement>...</dependencyManagement>
 	    <modules>
 	    	<module>my-project</module>
 	   		<module>another-project</module>
    	</modules>
    	<!-- It like properties in Ant. Their values are accessible anywhere within a POM by using the notation ${X}, where X is the property. -->
    	<!-- project.x, settings.x, java.x. e.g. ${java.home} -->
		<properties>
			<x>value</x>
		</properties>
		
<a name="build">Build settings</a>&nbsp;&nbsp;&nbsp;&nbsp; [TOP](#top)

		<build>
 			<defaultGoal>install</defaultGoal>
 			<directory>${basedir}/target</directory>
 			<finalName>${artifactId}-${version}</finalName>
 			<filters>
 				<filter>filters/filter1.properties</filter>
 			</filters>
			<resources>
				<resource>
					<targetPath>META-INF/plexus</targetPath>
					<filtering>false</filtering>
					<directory>${basedir}/src/main/plexus</directory>
					<includes>
					  <include>configuration.xml</include>
					</includes>
					<excludes>
					  <exclude>**/*.properties</exclude>
					</excludes>
				</resource>
			</resources>
			<testResources>...</testResources> 
			
			<!-- build/plugins similiar with pluginManagement sections of the parent -->
			<plugins>
				<plugin>
				  <artifactId>maven-antrun-plugin</artifactId>
				  <version>1.1</version>
				  <executions>
				    <execution>
				      <id>echodir</id>
				      <goals>
				      	<!-- execute it with command "mvn antrun:run" -->
				        <goal>run</goal>
				      </goals>
				      <phase>verify</phase>
				      <inherited>false</inherited>
				      <configuration>
				        <tasks>
				          <echo>Build Dir: ${project.build.directory}</echo>
				        </tasks>
				      </configuration>
				    </execution>
				  </executions>
			
				</plugin>
			</plugins>
			<!-- It's the extension of maven itself -->
			<extensions>
			  <extension>
			    <groupId>org.apache.maven.wagon</groupId>
			    <artifactId>wagon-ftp</artifactId>
			    <version>1.0-alpha-3</version>
			  </extension>
			</extensions>
		</build>
		<profiles>...</profiles>
		<reporting>
			<outputDirectory>${basedir}/target/site</outputDirectory>
			<plugins>
			  <plugin>
			    <artifactId>maven-project-info-reports-plugin</artifactId>
			    <version>2.0.1</version>
			    <reportSets>
			      <reportSet>
			        <id>sunlink</id>
			        <reports>
			          <report>javadoc</report>
			        </reports>
			        <inherited>true</inherited>
			        <configuration>
			          <links>
			            <link>http://java.sun.com/j2se/1.5.0/docs/api/</link>
			          </links>
			        </configuration>
			      </reportSet>
			    </reportSets>
			  </plugin>
			</plugins>
		</reporting>
<a name="info">Project information</a>&nbsp;&nbsp;&nbsp;&nbsp; [TOP](#top)

		<!-- It's only for clarification. -->
		<name>...</name>
		<description>...</description>
		<url>...</url>
		<inceptionYear>...</inceptionYear>
		<licenses>...</licenses>
		<organization>...</organization>
		<developers>...</developers>
		<contributors>...</contributors>

<a name="env">Environment settings</a>&nbsp;&nbsp;&nbsp;&nbsp; [TOP](#top)	

		<!-- It's only for clarification. -->
		<issueManagement>...</issueManagement>
		<ciManagement>...</ciManagement>
		<mailingLists>...</mailingLists>
		<scm>...</scm>
		<prerequisites>...</prerequisites>
		<repositories>...</repositories>
		<pluginRepositories>...</pluginRepositories>
		<distributionManagement>...</distributionManagement>
