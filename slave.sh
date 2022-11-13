#!/bin/bash

echo "postgresql-master:5432:*:repluser:replpass" > /var/lib/postgresql/.pgpass
chown postgres:postgres /var/lib/postgresql/.pgpass
chmod 0600 /var/lib/postgresql/.pgpass
#sleep 10 && rm -rf /var/lib/postgresql/data/*
#sleep 10 && su - postgres -c "pg_basebackup --host=postgresql-master --username=repluser --pgdata=/var/lib/postgresql/data --wal-method=stream --write-recovery-conf"
