#!/bin/bash

TCHPDID=$(xinput -list | grep -i touchpad | grep -o 'id=[0-9]*' | cut -f2 -d '=')

TAPID=$(xinput -list-props $TCHPDID | grep -i 'tapping enabled' | grep -o '([0-9]*)' -m 1 | cut -f2 -d '(' | cut -f1 -d ')')

NSID=$(xinput -list-props $TCHPDID | grep -i 'natural scrolling' | grep -o '([0-9]*)' -m 1 | cut -f2 -d '(' | cut -f1 -d ')')

xinput -set-prop $TCHPDID $TAPID 1
xinput -set-prop $TCHPDID $NSID 1

echo xinput -set-prop $TCHPDID $TAPID 1
echo xinput -set-prop $TCHPDID $NSID 1
