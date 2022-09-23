#!/bin/bash

PROJECT="environments"
STAGE="dev"


#########  Params ###########

COMPONENT="network"
STACK="vpc-peering-requester"
TEMPLATE="vpc-peering-requester"
PARAMETERS="beacon_sms"


######### common part #########

TEMPLATE_FILE="cloudformation/beaconcure/$PROJECT/$COMPONENT/templates/$TEMPLATE.yaml"
PARAM_FILE="cloudformation/beaconcure/$PROJECT/parameters/parameters.json"

PARAMS=$(cat $PARAM_FILE | jq -jr 'map("\(.ParameterKey)=\(.ParameterValue)") | join (" ")')

deploy="aws cloudformation deploy \
    --template-file $TEMPLATE_FILE \
    --stack-name $PROJECT-$COMPONENT-$STACK \
    --no-fail-on-empty-changeset \
    --parameter-overrides $PARAMS \
    --tags Project=$PROJECT Stage=$STAGE Component=$COMPONENT"

echo $deploy

$deploy
