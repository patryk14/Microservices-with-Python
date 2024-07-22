install:
	#install commands
	pip install --upgrade pip &&\
	pip install -r requirements.txt 
format:
	#format code
	black *.py mylib/*.py
lint:
	#flake8 or pylint
	pylint --disable=R,C *.py mylib/*.py
test:
	#test
	python -m pytest -vv --cov=mylib test_*.py
build:
	#build container
	docker build -t deploy-fastapi .
deploy:
	#deploy
	docker run -p 127.0.0.1:8080:8080 deploy-fastapi
run:
	#run docker container
	#docker run -p 127.0.0.1:8080:8080 deploy-fastapi
all: install format lint test build deploy