test:
	docker build -f Dockerfile.server -t server-image . 
	docker run -p 5000:5000 -d --name webserver server-image
	docker build -f Dockerfile.test -t test-image .
	docker run --network host --name testserver test-image  robot -d result/ --variable url:http://localhost:5000 API_Test.robot
	docker cp testserver:/app/result/. ./result
	docker kill webserver
	docker rm webserver testserver  
	docker image rmi -f server-image  test-image

