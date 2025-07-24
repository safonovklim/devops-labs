#!/bin/bash

OUTPUT_FILE="iam_users.csv"
POLICY_ARN="arn:aws:iam::[TODO_ENTER_AWS_ACCOUNT_ID]:policy/devops-lab-policy"
echo "Username,Password" > $OUTPUT_FILE

for i in {2..20}
do
  USERNAME="devops-lab-user$i"
  PASSWORD=$(openssl rand -base64 8)

  aws iam create-user --user-name "$USERNAME"
  aws iam create-login-profile --user-name "$USERNAME" --password "$PASSWORD"
  aws iam attach-user-policy --user-name "$USERNAME" --policy-arn "$POLICY_ARN"
  aws iam tag-user --user-name "$USERNAME" --tags "Key=Name,Value=$USERNAME"

  echo "$USERNAME,$PASSWORD" >> $OUTPUT_FILE
done

echo "User creation complete. Credentials stored in $OUTPUT_FILE"
