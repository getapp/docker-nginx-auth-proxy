# Simple Nginx proxy with Basic Auth

Docker image to put services behind basic auth. 

## Usage

* Set `SERVICE_HOST` and `SERVICE_PORT` to point to existing service
* Optionally set `HTPASSWD_PATH` (defaults to `/etc/nginx/htpasswd`)
* Create `htpasswd`
  ```
 >$ docker run -v /data --name htpasswd getapp/random-htpasswd /data/htpasswd username
 >$ Adding password for user myuser
		=============== CREDENTIALS ================
		** USER: myuser
		** PASSWORD: b0164e6653117031fb634ef3fdde67e3a1b63e46a416afeee4856097516ec272
		** FILE: /data/htpasswd
		===========================================
  ```

* Run proxy
  ```
	 docker run -d
					-e SERVICE_HOST=web \
					-e SERVICE_PORT=80 \
					-e HTPASSWD_PATH=/data/htpasswd \
					--volumes-from htpasswd \
					getapp/nginx-auth-proxy
  ```
