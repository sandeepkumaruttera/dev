If your RDS backup is not connecting to S3, there are several key areas to troubleshoot. Here's a step-by-step checklist to identify and resolve the issue:

✅ 1. Check IAM Role Permissions
RDS must assume an IAM role that has permission to access the S3 bucket.

Ensure the IAM role used by RDS has the following permissions:

json
Copy
Edit
{
  "Effect": "Allow",
  "Action": [
    "s3:PutObject",
    "s3:GetObject",
    "s3:ListBucket"
  ],
  "Resource": [
    "arn:aws:s3:::your-bucket-name",
    "arn:aws:s3:::your-bucket-name/*"
  ]
}
The IAM role should be associated with the RDS instance or snapshot export task.

✅ 2. Check S3 Bucket Policy
The bucket must allow access from the RDS service or the specific IAM role.

Example bucket policy:

json
Copy
Edit
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "rds.amazonaws.com"
      },
      "Action": [
        "s3:GetObject",
        "s3:PutObject",
        "s3:ListBucket"
      ],
      "Resource": [
        "arn:aws:s3:::your-bucket-name",
        "arn:aws:s3:::your-bucket-name/*"
      ]
    }
  ]
}
Make sure this policy is added in the S3 console under the Permissions tab > Bucket Policy.

✅ 3. Attach the IAM Role to RDS
When exporting an RDS snapshot to S3:

You must specify the IAM role that allows the export

The role should be visible under "Roles for RDS to access S3" in the IAM console

Also:

Ensure you’ve called AddRoleToDBInstance if needed via CLI or API

For snapshot exports, ensure the role is passed in the StartExportTask request

✅ 4. Region Mismatch
RDS and S3 must be in the same region for export to work

If your RDS instance is in us-east-1, the S3 bucket must also be there

✅ 5. KMS Permissions (if using encryption)
If the RDS snapshot or the S3 bucket uses encryption:

Ensure the IAM role and RDS have access to the KMS key

Check the KMS key policy includes permission for RDS and your IAM role

✅ 6. Check for Service Limits and Quotas
You may be hitting a service quota (e.g., number of export tasks or size limits). Check:

AWS Console → RDS → Events

Look for any export errors

✅ 7. Use AWS CLI for Debugging
You can use the AWS CLI to test the export manually:

bash
Copy
Edit
aws rds start-export-task \
  --export-task-identifier my-export-task \
  --source-arn arn:aws:rds:region:account-id:snapshot:snapshot-name \
  --s3-bucket-name your-bucket-name \
  --iam-role-arn arn:aws:iam::account-id:role/YourExportRole \
  --kms-key-id arn:aws:kms:region:account-id:key/key-id
