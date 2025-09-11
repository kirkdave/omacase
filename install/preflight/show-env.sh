#!/usr/bin/env bash

echo -e "Installation environment:"
env | grep -E "^(USER|HOME|OMACASE_USER_NAME|OMACASE_USER_EMAIL|OMACASE_REPO|OMACASE_REF)="
echo -e ""
