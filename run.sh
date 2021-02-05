docker build -t ft_server .
docker run -it --rm --name ft_server -p 80:80 -p 443:443 ft_server

