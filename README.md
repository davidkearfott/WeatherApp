## Run Rancher Desktop

## Build
docker build -t weatherapp .

## Create the Container
docker create weatherapp

## Run the Container
## specify env as "Development" to be able to access Swagger
docker run -it --rm -e ASPNETCORE_ENVIRONMENT=Development -p 8000:80 --name weatherapp_test weatherapp

API accessed through `http://localhost:8000/weatherforecast`
Swagger accessed through `http://localhost:8000/swagger/index.html`


## references: 
## https://softchris.github.io/pages/dotnet-dockerize.html#build-our-image-start-container
## https://github.com/alanschneider/dockerizedweatherforecast/blob/master/README.md?plain=1
