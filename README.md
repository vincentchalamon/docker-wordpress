# Docker Wordpress

A Dockerfile for better [Wordpress](https://wordpress.org/).

**This configuration is built for development. You can use it in production at your own risks !**

[Don't know Docker yet ?](http://blog.vincent-chalamon.fr/docker/)

## Installation

Install [Docker](https://www.docker.com/) ([Toolbox](https://www.docker.com/toolbox) for OS X & Windows).

Then, run following command to run container:

```
docker run -d -P vincentchalamon/wordpress
```

Your project is available at [http://127.0.0.1](http://127.0.0.1) (for Toolbox, follow [http://192.168.99.100](http://192.168.99.100)).

Directory `wp-content` is mount as volume. **It's your own to download this directory from a Wordpress install and mount it as volume.**

## Configuration

Want to integrate it with MySql ? I recommand to use [Docker Compose](https://docs.docker.com/compose/).

Create `docker-compose.yml` file as following:

```yml
wordpress:
    image: vincentchalamon/wordpress
    volumes:
        - .:/var/www/content
    links:
        - db:mysql
    ports:
        - 80:80
    environment:
        WORDPRESS_URI: www.example.com
        WORDPRESS_CONTENT_DIR: custom-content
        WORDPRESS_DB_PASSWORD: custom_database
        WORDPRESS_TABLE_PREFIX: customprefix_

db:
    image: mysql
    environment:
        MYSQL_USER: root
        MYSQL_ROOT_PASSWORD: custom_database
```

Then run `docker-compose up -d`, your Symfony project is ready to access MySql through `127.0.0.1:3306`.
