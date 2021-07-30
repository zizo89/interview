Task 3: Solution (Please see the attached architecture)


- Copying Data from ElasticSearch to Amazon Redshift:

In order to funnel data coming from ElasticSearch which the Data Science team will use to do their data science stuff,
I suggest to use Amazon Redshift combined with Amazon S3. 
Loading data from Elasticsearch to Redshift is challenging as they have a different structure. With the help of Amazon S3, 
it is possible to load the data from Elasticsearch to S3 and then, from S3 to Redshift using a COPY command.
Redshift is a database system built by AWS, based on PostgreSQL but optimised for extremely large data sets. 
It is designed for "data warehouse" applications, where you want to write complex logical queries against the data.
We will use Logstash for loading data from Elasticsearch to S3, the latest version of Logstash includes S3 plugins that allow you to export data to S3 without any intermediate storage.
To load data from S3 to Redshift, we can use Redshift’s COPY command where S3 will act as a source to perform bulk data load.


- Connecting to the Redshift warehouse instance and loading the data using Python:

Since Redshift is compatible with other databases such as PostgreSQL, we use the Python psycopg library to access and query the data from Redshift.
To access your Redshift data using Python, we will first need to connect to our instance.
We will use the psycopg Python driver to connect to our Redshift instance.
