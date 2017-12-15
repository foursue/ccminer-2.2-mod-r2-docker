# ccminer-2.2-mod-r2-docker

## require

read

- https://qiita.com/bohemian916/items/baf4e3bbe19417f8a147

## usage

```
sudo nvidia-docker run -ti --rm mona   /bin/bash -c "cd /home/ubuntu/ccminer-2.2-mod-r2; ./ccminer -a lyra2v2 -o stratum+tcp://vippool.net:8888 -u {$user} -p {$password}"
```

