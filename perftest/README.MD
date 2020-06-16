# k8s Configurations for RTI PerfTest

## Attach labels to nodes
`$ kubectl label nodes <node-name> perftest=pub`

`$ kubectl label nodes <node-name> perftest=sub`

## Create a Deployment for PerfTest publisher
`$ kubectl create -f rtiperftest-pub.yaml`

## Create a Deployment for PerfTest subscriber
`$ kubectl create -f rtiperftest-sub.yaml`
