#!/bin/bash
echo "Reseting database"
rake db:restart
rake db:test:restart
