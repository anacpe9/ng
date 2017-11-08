## this project was forked by _*[cha/nodetestplat](https://lab.er.co.th/cha/nodetestplat)*_ project

```
+-- alpine:3.6 (3.962 MB)                                ===========> official image
    |
    +-- node:9.0.0-alpine (64.64 MB)                     ===========> official image
    |   |
    |   +-- ops/ng:1.6.0-beta.0-alpine (108 MB)            ===========> optional ***
    |   `-- ops/ng:1.5.0-alpine (108 MB)                 ===========> this project ***
    |       |
    |      (+)-- ops/ng-testplat:1.5.0-alpine (285 MB)   ===========> for ng e2e and unit testing
    |       |
    `------ ops/e2e-testplat:57-alpine (181 MB)          ===========> (Optional for other projects)
```

```
// with @angular/cli@1.5.*
+-- .angular-cli.json
    |
    `-- (add app1 to .angular-cli.json)
        +-- (Step 0:) Install @angular/platform-server
        |   `-- npm install --save-dev @angular/platform-server
        +-- (Step 1:) Prepare your app for Universal rendering
        |   +-- edit: src/app/app.module.ts
        |   |   `-- BrowserModule.withServerTransition({appId: 'er-app-pccm-dom'})
        |   `-- create: src/app/app.server.module.ts
        +-- (Step 2:) Create a server main file and tsconfig to build it
        |   +-- create: src/main.server.ts
        |   |   `-- export {AppServerModule} from './app/app.server.module';
        |   +-- create: src/tsconfig.server.json
        |       |-- copy from src/tsconfig.app.json
        |           +-- "module": "commonjs" // Set the module format to "commonjs"
        |           `-- "angularCompilerOptions": { "entryModule": "app/app.server.module#AppServerModule" } // Add "angularCompilerOptions" with the AppServerModule
        +-- (Step 3:) Create a new project in .angular-cli.json
        |   +-- copy app[0] to app[1]
        |   +-- app[1].platform: "server";
        |   +-- app[1].main: "main.server.ts"
        |   +-- app[1].tsconfig: "tsconfig.server.json"
        |   `-- delete app[1].polyfills        
        +-- (Step 4:) Building the bundle
        |   +-- ng build --prod
        |   `-- ng build --prod --app=1
        +-- (Step 5:) Testing the bundle
            +-- echo -e "const main_path='${ls dist-server/main.+.bundle.js}';" > ssr.js
            +-- cat ssr-pre.js >> ssr.js
            `-- node ssr.js
        
```