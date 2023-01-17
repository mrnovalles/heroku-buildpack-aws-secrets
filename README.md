# Heroku Buildpack: Aws Secrets Manager

This buildpack allows a user to read secrets stored in AWS Secrets Manager.

## Adding this buildpack to your application

```
heroku:buildpacks add https://github.com/mrnovalles/heroku-buildpack-aws-secrets --index=1
```

## Pre-requisites

### 1. Heroku aws-cli buildpack

The heroku-community aws-cli buildpack needs to be added to the Heroku application as:

```
heroku buildpacks:add heroku-community/awscli --index=0
```

### 2. AWS Authentication related config vars

Some [heroku config vars](https://devcenter.heroku.com/articles/config-vars) are needed in order for this buildpack to work correctly

```
  heroku config:set AWS_ACCESS_KEY_ID=MY_AWS_KEY_ID
  heroku config:set AWS_SECRET_ACCESS_KEY=MY_AWS_SECRET_ACCESS_KEY
  heroku config:set AWS_DEFAULT_REGION=eu-west-1
```

### 3. Definition of Heroku config values and Secret ARNs

A newline delimited list of env vars to be populated in your Heroku application environment as a key, and the AWS ARN of the secret that should be read for it.

```
heroku config:set AWS_SECRETS="SECRET_PASSWORD=arn:aws:secretsmanager:eu-west-1:111111111111:secret:heroku-secret-password-I28gzn
ANOTHER_PASSWORD=arn:aws:secretsmanager:eu-west-1:111111111111:secret:heroku-another-password-I38asm"
```

This can also easily be filled through the Settings page in your Heroku Application Dashboard https://dashboard.heroku.com/apps/${MY_APP}/settings

## Gotchas

- After making changes in AWS Secrets, a new deployment of the application needs to take place for the changes to take effect.

## Development

This project uses the `heroku-buildpack-testrunner` for testing. A Makefile including steps to download these deps is already provided.
To run tests do:

```
make test
```
