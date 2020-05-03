RAND=$RANDOM

read -r -d '' template << EOM
apiVersion: batch/v1
kind: Job
metadata:
  name: batch-job-$RAND
  namespace: jobs
spec:
  template:
    spec:
      containers:
      - name: batch-job-$RAND
        image: perl
        command: ["perl",  "-Mbignum=bpi", "-wle", "print bpi(200)"]
      restartPolicy: Never
  backoffLimit: 1
EOM

echo "$template" > batch-job-$RAND.yaml
