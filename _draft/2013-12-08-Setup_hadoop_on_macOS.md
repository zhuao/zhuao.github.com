----

title:Steps to setup Hadoop on MacXOS
layout:defaul
tag:hadoop
author:
	name: Zhu Ao
	url: zhuao.me
	
----


Setup guid line:

http://codesfusion.blogspot.com/2013/10/setup-hadoop-2x-220-on-ubuntu.html?m=1

##Preparation
1. Download hadoop from hadoop.apache.org
2. Setup JAVA_HOME
3. Setup HADOOP_HOME

##Architecture of Hadoop
HDFS(Hadoop distributed file system) - start-dfs.sh
 Thread:namenode, datanode, secondary namenode
MapReduce - start-mapred.sh
 Thread:



##Steps to
1. Setup core-site.xml
	
		<property>
			<name>fs.default.name</name>
			<value>hdfs://localhost:9000</value>
			<description>namenode uri. should use localhost, not IP</description>
		</property>
2. yarn-site.xml

		<property>
			<name>yarn.nodemanager.aux-services</name>
			<value>mapreduce_shuffle</value>
			<description>Configuration for ResourceManage. Shuffle service that needs to be set for Map Reduce applications.</description>
		</property>
		<property>
			<name>yarn.nodemanager.aux-services.mapreduce.shuffle.class</name>
			<value>org.apache.hadoop.mapred.ShuffleHandler</value>
		</property>
3. mapred-site.xml
		
		<property>
			<name>mapreduce.framework.name</name>
			<value>yarn</value>
			<decription>Configuration for Mapredure application. Execution framework set to Hadoop YARN.</description>
		</property> 		
4. Creat datanode and name node directory

5. hdfs-site.xml

		<property>
			<name>dfs.replication</name>
			<value>1</value>
			<description>Default block replication.</description>
		</property>	
		<property>
			<name>dfs.namenode.name.dir</name>
		    <value>file:/Users/zhuao/run/hadoop/work_home/hdfs/namenode</value>
		    <description>Determines where on the local filesystem the DFS name node should store the name table(fsimage)</description>
		</property>
		<property>
			<name>dfs.datanode.data.dir</name>
		    <value>file:/Users/zhuao/run/hadoop/work_home/hdfs/datanode</value>
		    <description>Determines where on the local filesystem an DFS data node should store its blocks.</description>
		</property>

6. Format namenode
Call command 
	> &gt;&gt; hdfs namenode -format

7. start hadoop
> &gt;&gt; start-all.sh


Issue:
Can’t load datanode deamon
Exception:Unable to load realm info from SCDynamicStore
Solution:
Add the following options to hadoop-env.sh
export HADOOP_OPTS="-Djava.security.krb5.realm=OX.AC.UK -Djava.security.krb5.kdc=kdc0.ox.ac.uk:kdc1.ox.ac.uk"



Issue:
Can’t start data nod deamon
Exception:org.apache.hadoop.ipc.RemoteException(org.apache.hadoop.hdfs.server.protocol.DisallowedDatanodeException): Datanode denied communication with namenode: DatanodeRegistration
Solution:
Make sure core-site.xml is configured right. couldn’t use ip to instead of localhost
     <property>
          <name>fs.default.name</name>
          <value>hdfs://localhost:9000</value>
     </property> 

Issue:
/bin/bash: /bin/java: No such file or directory
Solution:
setup JAVA_HOME in ./etc/hadoop/hadoop-env.sh
More details:https://issues.apache.org/jira/browse/HADOOP-8717 



Issue:
Name node is in safe mode. when running sample
Solution:
Clean up logs folder

$ bin/hadoop jar ./share/hadoop/mapreduce/hadoop-mapreduce-client-jobclient-2.2.0-tests.jar minicluster -rmport RM_PORT -jhsport JHS_PORT

