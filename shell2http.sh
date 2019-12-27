# http://www.chodorowski.com/projects/zws/


# https://github.com/msoap/shell2http
brew tap msoap/tools
brew install shell2http
# update:
# brew upgrade shell2http

# docker pull msoap/shell2http

# go get -u github.com/msoap/shell2http
# # set link to your PATH if needed:
# ln -s $(go env GOPATH)/bin/shell2http ~/bin/shell2http
cd ~/Code
git clone git@github.com:msoap/shell2http.git
cd shell2http
docker build -f test.Dockerfile -t date-server .
docker run --rm -p 8081:8080 date-server
open http://localhost:8081

# https://github.com/jsks/czhttpd