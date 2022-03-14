DOCKER_NETWORK = docker-hadoop_default
ENV_FILE = hadoop.env
current_branch := 3.3.0
build:
	docker build --load -t sufar/hadoop-base-arm64:$(current_branch) ./base
	docker build --load -t sufar/hadoop-namenode:$(current_branch) ./namenode
	docker build --load -t sufar/hadoop-datanode:$(current_branch) ./datanode
	docker build --load -t sufar/hadoop-resourcemanager:$(current_branch) ./resourcemanager
	docker build --load -t sufar/hadoop-nodemanager:$(current_branch) ./nodemanager
	docker build --load -t sufar/hadoop-historyserver:$(current_branch) ./historyserver
	docker build --load -t sufar/hadoop-submit:$(current_branch) ./submit

# wordcount:
# 	docker build -t hadoop-wordcount ./submit
# 	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} sufar/hadoop-base-arm64:$(current_branch) hdfs dfs -mkdir -p /input/
# 	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} sufar/hadoop-base-arm64:$(current_branch) hdfs dfs -copyFromLocal -f /opt/hadoop-3.3.0/README.txt /input/
# 	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} hadoop-wordcount
# 	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} sufar/hadoop-base-arm64:$(current_branch) hdfs dfs -cat /output/*
# 	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} sufar/hadoop-base-arm64:$(current_branch) hdfs dfs -rm -r /output
# 	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} sufar/hadoop-base-arm64:$(current_branch) hdfs dfs -rm -r /input
