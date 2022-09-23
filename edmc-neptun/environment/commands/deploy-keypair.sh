#!/bin/bash

PROJECT="environments"
STAGE="prod"


#########  Params ###########

COMPONENT="EC2"
STACK="key-pair"
TEMPLATE="key-pair"
PARAMETERS="analytics"
ENVIRONMENT="LearnEnv"
keyname="new-servers"
keynameJupm="JumphostKey"
######### common part #########

TEMPLATE_FILE="cloudformation/beaconcure/$PROJECT/$COMPONENT/templates/$TEMPLATE.yaml"
PARAM_FILE="cloudformation/beaconcure/$PROJECT/parameters/parameters.json"

 aws ec2 create-key-pair --key-name $keyname \
    --key-type rsa \
    --query "KeyMaterial" \
    --output text > ~/.ssh/$keyname.pem 


