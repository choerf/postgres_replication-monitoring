# README

<p>Before start lets change configuration for PostgreSQL.
Check your subnet where will be deployed instances, run command:</p>
<p><code>docker network inspect docker_default </code></p>
There will be writen you subnet: e.g. "Subnet": "192.168.16.0/20"</br>
Then in file pg_hba-master.conf in line 98 change subnet to your subnet:<br>

<img width="559" alt="image" src="https://user-images.githubusercontent.com/73527990/201532909-da9e0f59-53f8-4414-817a-6e37cf2f15af.png">


1. Create folder with docker files, then enter it and run command in termnal:</br>
<code>docker-compose up -d</code> 

Instances are created:<br>
<img width="296" alt="image" src="https://user-images.githubusercontent.com/73527990/201534538-b655ef05-cc1b-4cd1-b4ef-05096757d995.png">

2. Enter in PostgreSQL Slave instance <code>docker exec -it postgresql-slave bash</code> and run this commands:
<p><code>rm -rf /var/lib/postgresql/data/*</code></br>
<code>su - postgres -c "pg_basebackup --host=postgresql-master --username=repluser --pgdata=/var/lib/postgresql/data --wal-method=stream --write-recovery-conf"</code></p>
<p>Enter password: replpass</p>
<p>Then need to restart Slave instance <code>docker restart postgresql-slave</code> and we will have replication with Master database.
We can check it with this command:</p>
<p><code>docker exec -it postgresql-slave su - postgres -c "psql -c 'select * from pg_stat_wal_receiver;'"</code></p>
</br>
<img width="1440" alt="image" src="https://user-images.githubusercontent.com/73527990/201532381-05093308-a906-4103-8a92-d7ce71ee2973.png">


<p>Then lets start with Prometheus and Grafana</p>

Prometheus link: http://localhost:9090/targets?search=
