#!/bin/bash

echo "starting check sidekiq"

#check whether the process Sidekiq exists
processConfirmation=`ps aux | grep sidekiq`

if [ -z $processConfirmation ]
then
  echo "oops! not running... restarting sidekiq"
  #Changing the directory to the location where sidekiq.pid is located
  cd /Users/subuddhis/Documents/Project/Server/aqua-gybe-erp-server && bundle exec sidekiq -e production -C config/deploy/shared/sidekiq.yml.erb -d -P tmp/pids/sidekiq.pid
  sidekiq start
fi
echo "finished sidekiq check"

