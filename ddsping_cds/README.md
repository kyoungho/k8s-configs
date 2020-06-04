#### Create a ConfigMap for RTI License
`$ kubectl create configmap rti-license --from-file rti_license.dat`

#### Attach labels to nodes
`$ kubectl label nodes <node-name> discovery=cds`

`$ kubectl label nodes <node-name> ping=pub`

`$ kubectl label nodes <node-name> ping=sub`

#### Create a Deployment and a Service for Cloud Discovery Service
`$ kubectl create -f rticlouddiscoveryservice.yaml`

#### Create a Deployment for DDS ping publisher
`$ kubectl create -f rtiddsping-cds-pub.yaml`

#### Create a Deployment for DDS ping subscriber
`$ kubectl create -f rtiddsping-cds-sub.yaml`
