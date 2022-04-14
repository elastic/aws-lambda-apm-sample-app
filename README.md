This is a sample Node.js application for AWS Lambda demonstrating the usage of Elastic APM.

# Usage
To try the sample application you will need to install [npm](https://www.npmjs.com/), [Node.js](https://nodejs.org/) and the [Serverless framework](https://www.serverless.com).

## Step 1 - Clone the sample application repo and install dependencies

```bash
git clone https://github.com/elastic/aws-lambda-apm-sample-app.git

cd aws-lambda-apm-sample-app/lambda-application
npm install --save-dev

cd ../load-generator
npm install --save-dev
```

## Step 2 - Configure Elastic APM

To try out Elastic APM with AWS Lambda, you will need an Elastic Stack, including an APM Server that will receive the APM data. The simplest way to get started with Elastic APM is through Elastic Cloud. [Sign up for a trial on Elastic Cloud through this link](https://www.elastic.co/cloud/elasticsearch-service/signup).

You need to provide the corresponding connection details to the APM Server in the `env.json` file. In addition, you can provide the AWS region to deploy the sample application to.

```json
{
   "aws-region": "eu-central-1",
   "apm-server-url": "https://THIS_IS_YOUR_APM_SERVER_URL",
   "apm-server-token": "THIS_IS_YOUR_APM_SECRET_TOKEN"
}
```

## Step 3 - Deploy the sample application
To deploy to AWS you will need an AWS access key with the following permissions:
- AmazonS3FullAccess
- CloudWatchLogsFullAccess
- AmazonAPIGatewayAdministrator
- AWSCloudFormationFullAccess
- AWSLambda_FullAccess

Follow the [instructions for setting up AWS credentials](https://www.serverless.com/framework/docs/providers/aws/guide/credentials) in AWS and using them with your system.

Once your AWS credentials are set up, execute the following command in the *lambda-application* directory to deploy the sample application:

```
serverless deploy
```

Copy the base URL of the API Gateway from the output in the console (`r7ckl4adme.execute-api.eu-central-1.amazonaws.com` in the following example):

```
…
endpoints:
  GET - https://r7ckl4adme.execute-api.eu-central-1.amazonaws.com/dev/ping
  POST - https://r7ckl4adme.execute-api.eu-central-1.amazonaws.com/dev/produce
…
```

## Step 4 - Generate load
Change to the *load-generator* directory and execute the following command with the previously copied base URL of the API Gateway to start load generation.

```bash
sh ./load.sh <PASTE_THE_API_GATEWAY_BASE_URL_HERE> 
```
