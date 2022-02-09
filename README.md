# NYXX_INTERACTIONS_TEMPLATE
Ready to go discord bot template for [nyxx_interactions](https://pub.dev/packages/nyxx_interactions) module

## Getting started

```bash
git clone https://github.com/61soldiers/nit myproject
cd myproject
dart pub get
```

## Tokens and confidential data
Any secret keys must go to a file name confidential.yaml in the root directory of project <br/>
Keep in mind that the same confidential.yaml file will need to be inside `root/prod`

## Scripts

The use of [derry](https://pub.dev/packages/derry) package is recommended

### `derry run:dev`

Runs the bot in development mode

### `derry run:prod`

Runs the bot in production mode <br/>

Keep in mind that this is not running in its full potential due to the existing dartvm

### `derry build:aot`

Builds an executable of bot into `root/prod`

### `derry run:dev_aot`

Runs the compiled executable of bot in development mode

## Learn more
[nyxx](https://pub.dev/packages/nyxx) | [nyxx_interactions](https://pub.dev/packages/nyxx_interactions)