# this project was forked from __**[cha/nodetestplat](https://lab.er.co.th/cha/nodetestplat)**__ project

Angular cli - alpine base, for development process.
used in Gitlab CI/CD.

## docker-image dependencies graph

```text
+-- alpine:3.8 (4.41 MB)                                    ====> official image
    |
    +-- node:11.3.0-alpine (70.30 MB)                       ====> official image
    |   |
    |   +-- anacha/ng:7.2.0-beta.1  -alpine (330 MB)          ====> optional ***
    |   `-- anacha/ng:7.1.1-alpine (330 MB)                 ====> this project ***
    |       |
    |      (+)-- anacha/ng-testplat:7.1.1-alpine (330 MB)   ====> for ng e2e and unit testing
    |       |
    `------ anacha/e2e-testplat:68-alpine (201 MB)          ====> (Optional for other projects)
```

| Image           | base-0 image        | base-1 image |
| --------------- | ------------------- | ------------ |
| ng:7.1.1-alpine | node:11.3.0-alpine  | alpine:3.8   |
| ng:7.1.0-alpine | node:11.3.0-alpine  | alpine:3.8   |
| ng:6.2.8-alpine | node:11.2.0-alpine  | alpine:3.8   |
| ng:7.0.6-alpine | node:11.1.0-alpine  | alpine:3.8   |
| ng:6.2.7-alpine | node:11.1.0-alpine  | alpine:3.8   |
| ng:7.0.5-alpine | node:11.1.0-alpine  | alpine:3.8   |
| ng:7.0.4-alpine | node:11.0.0-alpine  | alpine:3.8   |
| ng:7.0.3-alpine | node:11.0.0-alpine  | alpine:3.8   |
| ng:7.0.2-alpine | node:11.0.0-alpine  | alpine:3.8   |
| ng:6.2.6-alpine | node:10.12.0-alpine | alpine:3.8   |
| ng:7.0.1-alpine | node:10.12.0-alpine | alpine:3.8   |
| ng:6.2.5-alpine | node:10.12.0-alpine | alpine:3.8   |
| ng:6.2.4-alpine | node:10.11.0-alpine | alpine:3.8   |
| ng:6.2.3-alpine | node:10.10.0-alpine | alpine:3.8   |
| ng:6.2.2-alpine | node:10.10.0-alpine | alpine:3.8   |
| ng:6.2.1-alpine | node:10.10.0-alpine | alpine:3.8   |
| ng:6.1.5-alpine | node:10.9.0-alpine  | alpine:3.8   |
| ng:6.1.4-alpine | node:10.9.0-alpine  | alpine:3.8   |
| ng:6.1.3-alpine | node:10.8.0-alpine  | alpine:3.8   |
| ng:6.1.2-alpine | node:10.8.0-alpine  | alpine:3.8   |
| ng:6.1.1-alpine | node:10.7.0-alpine  | alpine:3.8   |
| ng:6.1.0-alpine | node:10.7.0-alpine  | alpine:3.8   |
| ng:6.0.8-alpine | node:10.4.0-alpine  | alpine:3.7   |
| ng:6.0.7-alpine | node:10.3.0-alpine  | alpine:3.7   |
| ng:6.0.5-alpine | node:10.2.1-alpine  | alpine:3.7   |
| ng:6.0.3-alpine | node:10.1.0-alpine  | alpine:3.7   |
| ng:1.7.4-alpine | node:9.10.1-alpine  | alpine:3.6   |
| ng:1.7.4-alpine | node:9.10.1-alpine  | alpine:3.6   |
| ng:1.7.3-alpine | node:9.7.1-alpine   | alpine:3.6   |
| ng:1.7.2-alpine | node:9.6.1-alpine   | alpine:3.6   |
| ng:1.7.1-alpine | node:9.6.1-alpine   | alpine:3.6   |
| ng:1.7.0-alpine | node:9.5.0-alpine   | alpine:3.6   |
| ng:1.6.8-alpine | node:9.5.0-alpine   | alpine:3.6   |
| ng:1.6.7-alpine | node:9.5.0-alpine   | alpine:3.6   |
| ng:1.6.6-alpine | node:9.4.0-alpine   | alpine:3.6   |
| ng:1.6.5-alpine | node:9.4.0-alpine   | alpine:3.6   |
| ng:1.6.4-alpine | node:9.4.0-alpine   | alpine:3.6   |
| ng:1.6.3-alpine | node:9.3.0-alpine   | alpine:3.6   |
| ng:1.6.2-alpine | node:9.3.0-alpine   | alpine:3.6   |
| ng:1.6.1-alpine | node:9.3.0-alpine   | alpine:3.6   |
| ng:1.6.0-alpine | node:9.2.0-alpine   | alpine:3.6   |
| ng:1.5.5-alpine | node:9.2.0-alpine   | alpine:3.6   |
| ng:1.5.4-alpine | node:9.2.0-alpine   | alpine:3.6   |
| ng:1.5.3-alpine | node:9.2.0-alpine   | alpine:3.6   |
| ng:1.5.2-alpine | node:9.2.0-alpine   | alpine:3.6   |
| ng:1.5.0-alpine | node:9.0.0-alpine   | alpine:3.6   |

```text
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

## Source Repository

- [**cha-node/ng | Gitlab**](https://gitlab.com/cha-node/ng) - main repo.
- [anacpe9/ng | Github](https://github.com/anacpe9/ng) - mirror.
- [anacpe9/ng | Bitbucket](https://bitbucket.org/anacpe9/ng) - mirror.

## License

[MIT](LICENSE)
