#!/bin/bash

PROJECT="environments"
STAGE="prod"



#########  Params ###########

COMPONENT="EC2"
STACK="Verify-App-Server"
TEMPLATE="verify-app-server-prod-a"
PARAMETERS="verify-app-server-prod-a"
ENVIRONMENT="LearnEnv"


######### common part #########

TEMPLATE_FILE="cloudformation/beaconcure/$PROJECT/$COMPONENT/templates/$TEMPLATE.yaml"
PARAM_FILE="cloudformation/beaconcure/$PROJECT/parameters/parameters.json"
PARAMS=$(cat $PARAM_FILE | jq -jr 'map("\(.ParameterKey)=\(.ParameterValue)") | join (" ")')

deploy="aws cloudformation deploy \
    --template-file $TEMPLATE_FILE \
    --stack-name $PROJECT-$COMPONENT-$STACK-$STAGE-A \
    --no-fail-on-empty-changeset \
    --parameter-overrides $PARAMS \
    --capabilities CAPABILITY_NAMED_IAM \
    --tags Project=$PROJECT Stage=$STAGE Component=$COMPONENT"

echo $deploy

$deploy
