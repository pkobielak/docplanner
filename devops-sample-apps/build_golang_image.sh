cd golang
docker build --platform linux/amd64 -t pkobielak/docplanner-go-app:0.0.1 .
docker push pkobielak/docplanner-go-app:0.0.1
