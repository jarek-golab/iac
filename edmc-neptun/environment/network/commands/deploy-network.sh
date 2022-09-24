#!/bin/bash

PROJECT="environment"
STAGE="dev"


#########  Params ###########

COMPONENT="network"
STACK="network"
TEMPLATE="network"
PARAMETERS="network-dev"


######### common part #########

TEMPLATE_FILE="./$PROJECT/$COMPONENT/templates/$TEMPLATE.yaml"
PARAM_FILE="./$PROJECT/parameters/parameters.json"

PARAMS=$(cat $PARAM_FILE | jq -jr 'map("\(.ParameterKey)=\(.ParameterValue)") | join (" ")')

deploy="aws cloudformation deploy \
    --template-file $TEMPLATE_FILE \
    --stack-name $PROJECT-$COMPONENT-$STACK-$STAGE \
    --no-fail-on-empty-changeset \
    --parameter-overrides $PARAMS \
    --tags Project=$PROJECT Stage=$STAGE Component=$COMPONENT"

echo $deploy

$deploy
