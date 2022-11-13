#!/bin/bash

psql -U postgres -c "CREATE USER repluser WITH REPLICATION ENCRYPTED PASSWORD 'replpass';"