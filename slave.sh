#!/bin/bash

echo "postgresql-master:5432:*:repluser:replpass" > /var/lib/postgresql/.pgpass
chown postgres:postgres /var/lib/postgresql/.pgpass
chmod 0600 /var/lib/postgresql/.pgpass
