# README

<p>Before start lets change configuration for PostgreSQL.
Check your subnet where will be deployed instances, run command:</p>
<p><code>docker network inspect docker_default </code></p>
There will be writen you subnet: e.g. "Subnet": "192.168.16.0/20"</br>
Then in file pg_hba-master.conf in line 98 change subnet to your subnet:<br>

<img width="559" alt="image" src="https://user-images.githubusercontent.com/73527990/201532909-da9e0f59-53f8-4414-817a-6e37cf2f15af.png">


1.Create folder with docker files, then enter it and run command in termnal:</br>
<code>docker-compose up -d</code> 

Instances are created:<br>
<img width="341" alt="image" src="https://user-images.githubusercontent.com/73527990/201532031-fc0ca743-6480-491e-b4d3-76dc4342087c.png">

2. Enter in PostgreSQL Slave instance "docker exec -it postgresql-slave bash" and run this commands:
<p>rm -rf /var/lib/postgresql/data/*
su - postgres -c "pg_basebackup --host=postgresql-master --username=repluser --pgdata=/var/lib/postgresql/data --wal-method=stream --write-recovery-conf"</p>

We need to wait and 1 minute and instance will restarts and we will have replication with Master database.
We can check it with this command:
docker exec -it postgresql-slave su - postgres -c "psql -c 'select * from pg_stat_wal_receiver;'"

<img width="1440" alt="image" src="https://user-images.githubusercontent.com/73527990/201532381-05093308-a906-4103-8a92-d7ce71ee2973.png">


