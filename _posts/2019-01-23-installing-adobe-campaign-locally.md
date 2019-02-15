---
title: Install Adobe Campaign Architecture locally (Virtualbox)
categories: [opensource,adobe campaign]
redirect_from: /install-acc
---

<p class="text-center">⏬📦✔️</p>

<!--more-->

## Introduction
1. Install Centos on VirtualBox
1. Install Java 8 JDK
1. Download and install Adobe Campaign `.rpm` package
1. Configure `~/.profile` for user `neolane` and start AC Application server
1. Configure the firewall
1. Change the default password
1. Install postgresql
1. Connect from your client

- Installation guide for AC6.1 https://docs.campaign.adobe.com/doc/archives/en/610/installation-v6.1-en.pdf
- `thirdparty6-XXXX-.rpm` is now included in the main package, cf https://docs.campaign.adobe.com/doc/AC/en/RN_legacy.html#8763
- Installation guide for AC7 https://docs.campaign.adobe.com/doc/AC/en/INS_Installing_Campaign_in_Linux__Prerequisites.html

## Prerequisites: CentOS 7 x64 on Virtualbox
1. Get virtual box from [virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)
1. Get Fedora ISO from [centos.org/download](https://www.centos.org/download/). I'll be using [CentOS-7-x86_64-DVD-1810.iso](http://isoredirect.centos.org/centos/7/isos/x86_64/CentOS-7-x86_64-DVD-1810.iso)
1. Spin up a Fedora instance with the ISO loaded, and install it with the Software Selection "Server with a GUI" and "Connected to Ethernet" ([instructions on youtube](https://www.youtube.com/watch?v=Pcl417NR2xc)), and a user `fco` with `sudo` privileges.
![](/assets/images/2019/02/fedora-workstation-install-disk.jpg)
1. Shutdown the machine, remove the ISO from the boot settings, restart the machine, accept the licence and log in
1. Open up a terminal. You should have the following:
![](/assets/images/2019/02/fedora-workstation-first-terminal.jpg)
1. Install Virtual Box Guest Addition to enable copy/paste
1. Optional: Install Gnome instead of Gnome Classic, see [tuto on stackexchange](https://unix.stackexchange.com/questions/181503/how-to-install-desktop-environments-on-centos-7)
1. see https://www.tecmint.com/things-to-do-after-minimal-rhel-centos-7-installation/#C1 for details

## Java 8 JDK
The JRE is not enough, we need the JDK via the `java-1.8.0-openjdk-devel` package:
```bash
[fco@localhost ~]$ java -version
openjdk version "1.8.0_191"
OpenJDK Runtime Environment (build 1.8.0_191-b12)
OpenJDK 64-Bit Server VM (build 25.191-b12, mixed mode)
[fco@localhost ~]$ sudo yum install java-1.8.0-openjdk-devel
[fco@localhost ~]$ javac -version
javac 1.8.0_191
```

## AC7 rpm package
Let's do all of our work in `~/ac`.

Download the `.rpm` file from the Download Center, see the instructions in [this post](#). Then:
```bash
[fco@localhost ~]$ cd && mkdir ac && cd ac
[fco@localhost ~/ac]$ sudo yum install -y ./nlserver6-8864-x86_64_rh7.rpm
[fco@localhost ~/ac]$ sudo service nlserver6 start # quick check
Starting nlserver6 (via systemctl):                        [  OK  ]
[fco@localhost ~/ac]$ sudo service nlserver6 status # check 2
14:20:41 >   Application server for Adobe Campaign (6.1.1 build 8864) of 03/02/2018
watchdog (3956) - 4.8 MB
syslogd@default (3529) - 12.7 MB
web@default (3740) - 106.4 MB
[fco@localhost ~/ac]$ sudo service nlserver6 stop
```

## Configure `~/.profile` for user `neolane`

```bash
[fco@localhost ~/ac]$ sudo su - neolane
[neolane@localhost ~]$ id && pwd && ll
uid=1001(neolane) gid=1001(neolane) groups=1001(neolane)
/usr/local/neolane
drwxrwxr-x. 14 neolane neolane 187 Feb 13 14:01 nl6
[neolane@localhost ~]$ vim ~/.profile
export LD_LIBRARY_PATH=/usr/local/neolane/nl6/lib/:/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.191.b12-1.el7_6.x86_64/jre/lib/amd64/:/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.191.b12-1.el7_6.x86_64/jre/lib/amd64/server/
export PATH=$PATH:/usr/local/neolane/nl6/bin/
[neolane@localhost ~]$ nlserver start web
14:01:32 >   Application server for Adobe Campaign (6.1.1 build 8864) of 03/02/2018
14:01:32 >   Launching task 'web@default' ('nlserver web -tracefile:web@default -instance:default -detach -tomcat -autorepair') in a new process
14:01:32 >   Application server for Adobe Campaign (6.1.1 build 8864) of 03/02/2018
14:01:32 >   Starting Web server module (pid=9376, tid=9376)...
14:01:32 >   Tomcat started
14:01:32 >   Server started
[neolane@localhost ~]$ nlserver pdump
14:03:23 >   Application server for Adobe Campaign (6.1.1 build 8864) of 03/02/2018
web@default (9376) - 143.4 MB
```
![](/assets/images/2019/02/adobe-campaign-virtualbox-install-pdump.jpg)

## Configure the firewall

To be able to connect from our Host, we need to create new Firewall rules.

By default CentOS uses `firewall-cmd` to block incoming connections. We have to allow the ACC default port `8080` (Which is the Tomcat default port).

```bash
[fco@localhost ~]$ sudo firewall-cmd --zone=public --add-port=8080/tcp --permanent
[fco@localhost ~]$ sudo firewall-cmd --zone=public --add-port=8080/udp --permanent
[fco@localhost ~]$ sudo firewall-cmd --reload
```

## Change password

The default user is `internal` with an empty password `''` (See ). Let's change it (See https://docs.campaign.adobe.com/doc/AC/en/INS_Initial_configuration_Configuring_Campaign_server.html#Internal_identifier):

```bash
[neolane@localhost ~]$ nlserver config -internalpassword
```

## Install postgresql
(See https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-centos-7)

```bash
[fco@localhost ~]$ sudo yum install postgresql-server postgresql-contrib
[fco@localhost ~]$ sudo postgresql-setup initdb
[fco@localhost ~]$ sudo vim /var/lib/pgsql/data/pg_hba.conf # replace ident by md5
host    all             all             127.0.0.1/32            md5
host    all             all             ::1/128                 md5
[fco@localhost ~]$ sudo su - postgres
[postgres@localhost ~]$ createuser --interactive # create a PostgreSQL role (user)
dbuser1
[postgres@localhost ~]$ createdb dbuser1 # create a PostgreSQL database with the same name
[postgres@localhost ~]$ exit
[fco@localhost ~]$ sudo adduser dbuser1 # create a Linux user with the same name
```

![](/assets/images/2019/02/adobe-campaign-postgresql-install.png)

You can check your PostreSQL setup by connecting to your Guest via SqlEctron (or any SQL client). To do so, some extra steps need to be taken, see [Allow external PostgreSQL access](#allow-external-postgresql-access) at the end of this article.

## Update the Db
1. First import: core schema [db.sql](/assets/adobe-campaign/adobe-campaign-install-db.sql) (This file can be found in your Support Download Center)
```bash
$ psql -U dbuser1 -d dbuser1  -h localhost -f adobe-campaign-install-db.sql
```
1. Second import: public procedures [update.sql](/assets/adobe-campaign/adobe-campaign-update.sql) (See Appendix to generate this file)
```bash
$ psql -U dbuser1 -d dbuser1  -h localhost -f adobe-campaign-update.sql
```
*Note: I also had to `DROP` `xtksessioninfo`, then re-create manually with [this script](/assets/adobe-campaign/adobe-campaign-update-xtksessioninfo.sql).*

## Appendixes
### Install Apache
```bash
$ sudo yum install -y httpd
$ sudo systemctl start httpd # start now
$ sudo systemctl enable httpd # start at boot
$ service httpd status && curl localhost # check
● httpd.service - The Apache HTTP Server
   Loaded: loaded (/usr/lib/systemd/system/httpd.service; enabled; vendor preset: disabled)
   Active: active (running) since Wed 2019-02-06 16:53:12 EST; 1min 22s ago
[...]</body></html>
$ sudo firewall-cmd --add-service=http --permanent # allow firewall http
$ sudo firewall-cmd --add-service=https --permanent # allow firewall https
$ sudo firewall-cmd --reload
```

### Allow external PostgreSQL access
Allow external access to postgresql, see https://blog.bigbinary.com/2016/01/23/configure-postgresql-to-allow-remote-connection.html
```bash
$ sudo vim /var/lib/pgsql/data/postgresql.conf # replace listen_addresses = 'localhost' to
listen_addresses = '*'
$ sudo vim /var/lib/pgsql/data/pg_hba.conf # add at the end:
host    all             all              0.0.0.0/0                       md5
host    all             all              ::/0                            md5
$ sudo firewall-cmd --zone=public --add-port=5432/udp --permanent
$ sudo firewall-cmd --zone=public --add-port=5432/tcp --permanent
$ sudo firewall-cmd --reload
```
![](/assets/images/2019/02/adobe-campaign-install-sqlectron-connect.jpg)

### Download your PostreSQL procedures
Create a JS activity with below code:

```bash
var f = new File('/sftp/my-instance/incoming/my-ftp-folder/my-procedures.sql');
f.open('w');

var fields = "collection,pg_get_functiondef:string";
var sql = "SELECT pg_get_functiondef(f.oid) "+
  "FROM pg_catalog.pg_proc f "+
  "INNER JOIN pg_catalog.pg_namespace n ON (f.pronamespace = n.oid) "+
  "WHERE n.nspname = 'public';";

var res = sqlSelect(fields, sql)

for each(var proc in res.collection){
  logInfo('- '+proc);
  f.writeln(proc.pg_get_functiondef.toString().replace('PARALLEL SAFE ', '')+';')
};

f.close()
```

Example of output for `GetDate()`:
```sql
CREATE OR REPLACE FUNCTION public.getdate()
 RETURNS timestamp with time zone
 LANGUAGE sql
 IMMUTABLE
AS $function$
  select clock_timestamp() as result
$function$;
```

### Download your PostgreSQL tables
Create a JS activity with below code:

```js
var f = new File('/sftp/my-instance/incoming/my-ftp-folder/my-tables.sql');
f.open('w');

var table = 'nmsextaccount';

var sqlSchema = NLWS.xtkSqlSchema.BuildSqlSchema('default', table);
var sql = 'CREATE TABLE '+table+'(\n';
for each(var field in sqlSchema.getFirstElement('table').getElements('field')){
  //logInfo(field.$name, field.$type, field.$length);
  var type = field.$type.toLowerCase();
  switch(type){ // see https://www.postgresql.org/docs/9.3/datatype.html for datatypes
    case 'short': type = 'INTEGER'; break;
    case 'long': type = 'INTEGER'; break;
    case 'double': type = 'DOUBLE PRECISION'; break;
    case 'string': type = 'VARCHAR'; break;
    case 'memo': type = 'TEXT'; break;
    case 'datetimetz': type = 'TIMESTAMP'; break;
  };
  sql += '  '+field.$name+' '+type;
  if(field.$length){
    sql += '('+field.$length+')';
  }
  sql += ',\n';
}
sql = sql.substr(0, sql.length-2) // remove last ,\n
sql += '\n);'
logInfo(sql);
f.writeln(sql);
f.close();
```

Example of output for `NmsExtAccount`:
```sql
CREATE TABLE nmsextaccount(
  iactive INTEGER,
  iunicodedata INTEGER,
  mdata TEXT,
  saccount VARCHAR(80),
  sawskey VARCHAR(128),
  tscreated TIMESTAMP,
  tslastmodified TIMESTAMP
);
```

### Execute JS code from the commande line with `nlserver javascript`

```bash
$ cat test.js
var o = NLWS.xtkOperator.load(2); loginfo(o);
$ nlserver javascript -instance:instance1 -file test.js
17:59:09 >   Application server for Adobe Campaign (6.1.1 build XXXX) of XX/XX/XXXX
17:59:09 >   Starting 1 connection(s) on pool 'default instance1' (postgresql, server='localhost', login='dbuser1:dbuser1')
17:59:09 >   Executing JavaScript from file 'test.js'...
```
