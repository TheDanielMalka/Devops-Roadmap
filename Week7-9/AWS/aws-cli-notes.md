# AWS CLI Cheat Sheet & Notes

## 1. Authentication Methods
* **Local Machine:** Used `aws configure` with IAM User Access Keys.
* **EC2 Server (Best Practice):** Used **IAM Roles**. No keys stored on disk; the server inherits permissions automatically.

## 2. Basic Command Structure
`aws <service> <operation> <options>`

## 3. S3 Commands (Simple Storage Service)
* **List Buckets:** `aws s3 ls`
* **List Contents of a Bucket:** `aws s3 ls s3://my-bucket-name`
* **Upload File:** `aws s3 cp local-file.txt s3://my-bucket-name/`
* **Download File:** `aws s3 cp s3://my-bucket-name/remote-file.txt .`
* **Sync Directory (Upload only changed files):** `aws s3 sync ./my-folder s3://my-bucket-name/`
* **Delete Object:** `aws s3 rm s3://my-bucket-name/file.txt`

## 4. EC2 Commands (Elastic Compute Cloud)
* **List Instances:** `aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId,State.Name,PublicIpAddress]' --output table`
* **Stop Instance:** `aws ec2 stop-instances --instance-ids i-0123456789abcdef0`
* **Start Instance:** `aws ec2 start-instances --instance-ids i-0123456789abcdef0`

## 5. Troubleshooting
* **Check identity:** `aws sts get-caller-identity` (Verifies which user/role you are currently using).
* **Region mismatch:** Add `--region eu-north-1` to any command if the default is wrong.
