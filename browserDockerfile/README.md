# Browser Dockerfile

1. clone eclipse-theia/theia and build

   ```sh
   git clone https://github.com/eclipse-theia/theia.git
    && cd theia \
    && yarn \
    && yarn download:plugins \
    && yarn browser build \
   ```

2. Copy some builded files

   ```code
   browserTheia
    │ dev-packages
    │ examples
    │ │ api-samples
    │ │ api-tests
    │ └ browser
    │ plugins
    │ docker
    │ package.json
    │ tsfmt.json
    └ yarn.lock
   ```

3. Build the Dockerfile and Run

   ```sh
   docker build --tag theia-browser .
   ```

   ```sh
   docker run --name theia-nill -d -p 3000:3000 theia-browser
   ```
