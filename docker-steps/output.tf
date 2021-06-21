# Display ECR repo

output "ecr_repo_url" {
  value = "${aws_ecr_repository.splunk-assignment.repository_url}"
}

output "arn" {
  value = "${aws_ecr_repository.splunk-assignment.arn}"
}