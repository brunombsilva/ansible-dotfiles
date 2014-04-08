#!/bin/bash
ansible-playbook -i hosts playbook.yml --connection=local
