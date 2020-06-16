# k8s Manifests for RTI Routing Service
This repository contains example manifests for exposing DDS applications with RTI Routing Service outside the k8s cluster. 
The example manifests require Docker images for RTI Routing Service and RTI DDS Ping (used as an example DDS applicaiton).

## Create a Deployment for a RTI DDS Ping subscriber
`$ kubectl create -f rtiddsping-sub.yaml`

## Create a ConfigMap for the internal Routing Service XML configuration file
`$ kubectl configmap routingservice-inbound --from-file=config.xml`

## Create a Deployment for the internal Routing Service
`$ kubectl create -f rs-statefulset.yaml`

## Create a NodePort Service for the internal Routing Service
`$ kubectl create -f rs-nodeport.yaml`

## Run the external Routing Service (outside the cluster)
`$ routingservice -cfgFile ./rs-extern.xml -cfgName RS_TCP_EXTERN`

## Run a RTI DDS Ping publisher (outside the cluster)
`$ rtiddsping -publsher -domainId 11`
