# @theia/cli를 이용한 빌드

1. ~~theia-cli install~~ ( 아래 2.과 같이 package.json 파일만 있으면 됨)

   ```sh
   yarn add @theia/cli@next --dev
   ```

2. package.json을 다음과 같이 작성

   1. name에 "@theia/example-browser" 명시(?)</br>
   2. theia 부분 명시 </br>
   3. dependencies 명시 - theia 공식 github의 example/browser/package.json에 있는 dependencies에서는 @theia/api-samples가 있었는데, 이를 넣으니 yarn(모듈 설치) 에러가 남.

   ```json
   {
     "private": true,
     "name": "@theia/example-browser",
     "version": "1.25.0",
     "license": "EPL-2.0 OR GPL-2.0 WITH Classpath-exception-2.0",
     "theia": {
       "frontend": {
         "config": {
           "applicationName": "Theia Browser Example",
           "preferences": {
             "files.enableTrash": false
           }
         }
       }
     },
     "dependencies": {
       "@theia/bulk-edit": "1.25.0",
       "@theia/callhierarchy": "1.25.0",
       "@theia/console": "1.25.0",
       "@theia/core": "1.25.0",
       "@theia/debug": "1.25.0",
       "@theia/editor": "1.25.0",
       "@theia/editor-preview": "1.25.0",
       "@theia/file-search": "1.25.0",
       "@theia/filesystem": "1.25.0",
       "@theia/getting-started": "1.25.0",
       "@theia/git": "1.25.0",
       "@theia/keymaps": "1.25.0",
       "@theia/markers": "1.25.0",
       "@theia/messages": "1.25.0",
       "@theia/metrics": "1.25.0",
       "@theia/mini-browser": "1.25.0",
       "@theia/monaco": "1.25.0",
       "@theia/navigator": "1.25.0",
       "@theia/outline-view": "1.25.0",
       "@theia/output": "1.25.0",
       "@theia/plugin-dev": "1.25.0",
       "@theia/plugin-ext": "1.25.0",
       "@theia/plugin-ext-vscode": "1.25.0",
       "@theia/plugin-metrics": "1.25.0",
       "@theia/preferences": "1.25.0",
       "@theia/preview": "1.25.0",
       "@theia/process": "1.25.0",
       "@theia/property-view": "1.25.0",
       "@theia/scm": "1.25.0",
       "@theia/scm-extra": "1.25.0",
       "@theia/search-in-workspace": "1.25.0",
       "@theia/task": "1.25.0",
       "@theia/terminal": "1.25.0",
       "@theia/timeline": "1.25.0",
       "@theia/toolbar": "1.25.0",
       "@theia/typehierarchy": "1.25.0",
       "@theia/userstorage": "1.25.0",
       "@theia/variable-resolver": "1.25.0",
       "@theia/vsx-registry": "1.25.0",
       "@theia/workspace": "1.25.0"
     },
     "devDependencies": {
       "@theia/cli": "^1.26.0-next.15"
     }
   }
   ```

3. yarn 모듈 설치

   ```sh
   yarn
   ```

4. theia 빌드 실행

   ```sh
   yarn theia build
   ```

5. theia 실행

   ```sh
   yarn theia start
   ```

- 파일 용량을 줄이기 위해 ts파일, cache등 삭제 (100mb 안밖)

  ```sh
  yarn autoclean --init && \
  echo *.ts >> .yarnclean && \
  echo *.ts.map >> .yarnclean && \
  echo *.spec.* >> .yarnclean && \
  yarn autoclean --force && \
  yarn cache clean
  ```

  </br>

> 최종적으로 전체 용량은 800mb 안밖이 된다. node_modules가 대부분 용량을 차지 하는데, 빌드 후에도 이 모둘들이 필요한지 확인해 봐야 할 문제인 것 같다.
