#!/bin/bash

PROJECT="environments"
STAGE="devops"


#########  Params ###########

COMPONENT="EC2"
STACK="jenkins-master"
TEMPLATE="jenkins-master"
PARAMETERS="jenkins-master"
ENVIRONMENT="LearnEnv"


######### common part #########

TEMPLATE_FILE="$PROJECT/$COMPONENT/templates/$TEMPLATE.yaml"
PARAM_FILE="$PROJECT/parameters/parameters.json"
PARAMS=$(cat $PARAM_FILE | jq -jr 'map("\(.ParameterKey)=\(.ParameterValue)") | join (" ")')

deploy="aws cloudformation deploy \
    --template-file $TEMPLATE_FILE \
    --stack-name $PROJECT-$COMPONENT-$STACK \
    --no-fail-on-empty-changeset \
    --parameter-overrides $PARAMS \
    --capabilities CAPABILITY_NAMED_IAM \
    --region $REGION \
    --tags Project=$PROJECT Stage=$STAGE Component=$COMPONENT"

echo $deploy

$deploy
