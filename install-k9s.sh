#!/bin/bash

wget https://github.com/derailed/k9s/releases/download/v0.27.4/k9s_Linux_amd64.tar.gz

tar xvf k9s_Linux_amd64.tar.gz && chmod +x k9s && sudo mv k9s /usr/local/bin

mkdir k9s

mv k9s_Linux_amd64.tar.gz k9s/
mv LICENSE k9s/
mv README.md k9s/
