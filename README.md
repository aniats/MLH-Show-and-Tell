# 🖥 MLH-Show-and-Tell
Small workshop on ruby and web development with the use of it

## 🚀 DEVELOPMENT STEPS

Just follow the steps below to set up the development enviroment.

1. Clone this repository by running the following command inside your terminal:

```sh
git clone https://github.com/aniats/MLH-Show-and-Tell.git
```

2. Installing dependencies and running web application:

* For a "single" scripts you just have to:

    ```sh
        cd small_examples
        ruby hello_world.rb
    ```
* For a web apps:

    1. Install bundler gem, if you don't have it.

    ```sh
    cd triangles_web_app
    gem install bundler
    ```

    `Note:` If you're running scripts in UNIX you might have to add "sudo".
    ```sh    
    sudo gem install bundler
    ```

    2. Install necessary gems

    ```sh
    bundle install
    ```

    3. Run server

    ```sh
    rerun rackup
    ```

    4. Go to http://localhost:9292/
