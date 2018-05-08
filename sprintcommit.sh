#!/bin/sh
# A tool for commiting code changes during 'in the zone' sprints.

# Development sprint branch
BRANCH="development-sprint/`whoami`/`date +%Y-%b`"

while [ 1 ];
do
# Checkout development branch
git checkout -b $BRANCH

# Pull
git pull

# A commit.
git commit -a -m "`date`"

# Push upstream
git push --set-upstream origin $BRANCH

# Sleep for 15 minutes
sleep 900
done
