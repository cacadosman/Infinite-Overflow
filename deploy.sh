#!/bin/bash

# hugo && rsync -rlt -v --groupmap=*:www-data  public/ ubuntu@18.188.165.136:/home/ubuntu/cacadosman.web.id/
hugo && rsync -rlt -v public/ cacadosman@54.80.228.73:/home/cacadosman/cacadosman.web.id/
