# Simple Nginx proxy with Basic Auth

Docker image to put services behind basic auth. 

## Usage

* Set `SERVICE_HOST` and `SERVICE_PORT` to point to existing service
* Optionally set `HTPASSWD_PATH` (defaults to `/etc/nginx/htpasswd`)
* Create `htpasswd`
  ```
   docker run -v /etc/nginx --name htpasswd expert360/htpasswd /etc/nginx/htpasswd username password
  ```
* Run proxy
  ```
	 docker run -d -e SERVICE_HOST=web SERVICE_PORT=80 --volumes-from htpasswd getapp/nginx-auth-proxy`
  ```
