function aws_login
  set -x AWS_CREDENTIALS_PATH $HOME/.phrase/config.json
  eval (aws-mfa env)
  set account_id (aws sts get-caller-identity | grep Account | cut -d '"' -f 4)
  if test -z $account_id
    echo "unable to extract account_id" > /dev/stderr
    exit 1
  end

  aws ecr get-login-password | docker login -u AWS --password-stdin $account_id.dkr.ecr.$AWS_REGION.amazonaws.com
end

