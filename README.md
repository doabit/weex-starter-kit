# weex-starter-kit

> Starter kit for weex with vue 2.0, vue-router and vuex.

## getting start

```bash
npm install
```
## compile source code

```bash
npm run build
```

## copy the bundle file

```bash
npm run copy:ios # Copy bundle file to the assets folder of iOS project
```

## start web service

```bash
npm run serve
```

Now, you can visit http://127.0.0.1:8080 to preview the app on browser.


## run ios project

First you should [setup the iOS develop environment](https://developer.apple.com/library/content/documentation/IDEs/Conceptual/AppStoreDistributionTutorial/Setup/Setup.html) and install the [CocoaPods](https://guides.cocoapods.org/using/getting-started.html).

Enter the `ios` path to install dependencies:

```bash
pod install
```

Open the project in the `ios` folder by Xcode, you could run the app on the simulator.


## file structure

* `src/*`: all source code
* `app.js`: entrance of the Weex page
* `build/*`: some build scripts
* `dist/*`: where places generated code
* `assets/*`: some assets for Web preview
* `index.html`: a page with Web preview and qrcode of Weex js bundle
* `weex.html`: Web render
* `.babelrc`: babel config (preset-2015 by default)
* `.eslintrc`: eslint config (standard by default)
* `ios/*`: ios platform

## npm scripts

```bash
# build both two js bundles for Weex and Web
npm run build

# build the two js bundles and watch file changes
npm run dev

# start a Web server at 8080 port
npm run serve

# start weex-devtool for debugging with native
npm run debug
```

## notes

You can config more babel, ESLint and PostCSS plugins in `webpack.config.js`.

## reference resources

[vue-ssr-starter-kit](https://github.com/doabit/vue-ssr-starter-kit)

[weex-hackernews](https://github.com/weexteam/weex-hackernews)

## license

[MIT](http://opensource.org/licenses/MIT)