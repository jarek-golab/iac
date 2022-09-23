#!/bin/bash

PROJECT="ad-hoc"
STAGE="devops"


#########  Params ###########

COMPONENT="ec2"
STACK="jenkins-master"
TEMPLATE="jenkins"
PARAMETERS="jenkins-master"
ENVIRONMENT="LearnEnv"


######### common part #########

TEMPLATE_FILE="$PROJECT/$COMPONENT/templates/$TEMPLATE.yaml"
#PARAM_FILE="$PROJECT/parameters/parameters.json"
#PARAMS=$(cat $PARAM_FILE | jq -jr 'map("\(.ParameterKey)=\(.ParameterValue)") | join (" ")')

deploy="aws cloudformation deploy \
    --template-file $TEMPLATE_FILE \
    --stack-name $PROJECT-$COMPONENT-$STACK \
    --no-fail-on-empty-changeset \
    --capabilities CAPABILITY_NAMED_IAM \
    --tags Project=$PROJECT Stage=$STAGE Component=$COMPONENT"

echo $deploy

$deploy
