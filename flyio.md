# fly.io instructions

## Create htpasswd file

1. Install apache2-utils on your OS. (e.g: `sudo apt install apache2-utils`)
1. Create htpasswd file in this directory (`htpasswd -b -c htpasswd USERNAME PASSWD`). Change `USERNAME` and `PASSWD` to your own.

## Create a volume to mount the db

stream uses a `.jsonl` file to store the posts.

```bash
fly volumes create db
# say yes to creating a volume attached to a single host
# choose the same region as your deployment (ord in my case)

```
