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
<p>Enter password: <b>replpass</b></p>
<p>Then need to restart Slave instance <code>docker restart postgresql-slave</code> and we will have replication with Master database.
We can check it with this command:</p>
<p><code>docker exec -it postgresql-slave su - postgres -c "psql -c 'select * from pg_stat_wal_receiver;'"</code></p>
</br>
<img width="1440" alt="image" src="https://user-images.githubusercontent.com/73527990/201532381-05093308-a906-4103-8a92-d7ce71ee2973.png">


<h2>Prometheus</h2>

Link: http://localhost:9090/targets?search=

<p>There we can check stutus if connection to instances are good</p>
<img width="1437" alt="image" src="https://user-images.githubusercontent.com/73527990/201536449-25154754-6001-47c1-8abe-12d26d6a6b42.png">

Link: http://localhost:3000/login

<p>Login: <b>admin</b></br>
Password: <b>admin</b></p>

<img width="1436" alt="image" src="https://user-images.githubusercontent.com/73527990/201535010-38f17cb9-9df8-47e6-b8de-fe78a15598b3.png">


<p>After successful login go to Configuration -> Data souces (http://localhost:3000/datasources)</p>


<p>Then press Add data source and choose Prometheus</p>
<img width="1349" alt="image" src="https://user-images.githubusercontent.com/73527990/201535158-fff06cd4-c34c-4beb-8568-cf1576c9a882.png">

<p>Enter link to Prometheus: <b>http://prometheus:9090</b></p>
<img width="1100" alt="image" src="https://user-images.githubusercontent.com/73527990/201535398-b75c6c9a-ecf1-48bc-8829-13d3d4833da3.png">


<p>And press Save & Test</p>
<img width="716" alt="image" src="https://user-images.githubusercontent.com/73527990/201535506-3080c6e1-fdca-4b86-862a-d67f78622028.png">


<p>Then import Dashboard from Grafana - ID: <b>9628</b></p>
<img width="228" alt="image" src="https://user-images.githubusercontent.com/73527990/201535575-ef504e6b-c302-4ebd-a198-699cd47080b7.png"><img width="650" alt="image" src="https://user-images.githubusercontent.com/73527990/201535588-170dc001-6697-43e0-9870-486eaa2114c7.png">


<p>Select Prometheus</b></p>
<img width="663" alt="image" src="https://user-images.githubusercontent.com/73527990/201535712-4cfc04d1-fdf2-4733-93b4-c1d75d8ac927.png">



<p>We will see dashboard with data</p>
<img width="1364" alt="image" src="https://user-images.githubusercontent.com/73527990/201536421-9d392b2d-57d2-44d3-8f94-19f3bad7119e.png">


<p>Also in the dashboard can be changed instance</p>
<img width="284" alt="image" src="https://user-images.githubusercontent.com/73527990/201536175-38c33774-d968-483c-88ba-84c9dcea57b0.png">


