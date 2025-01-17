# A minimal container for building and running buildfarm services.
# We copy in the current state of the reposiory to test against PR changes.
FROM ubuntu:18.04

# For network stability we allow apt-get to retry.
# The "80" is required for config priority but its not specifically important.
RUN echo 'APT::Acquire::Retries "5";' > /etc/apt/apt.conf.d/80retries

RUN apt-get update
RUN apt-get -y install wget git python gcc openjdk-8-jdk g++ redis redis-server
COPY . buildfarm