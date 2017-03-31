# Yet Another Documentation generator

[![Greenkeeper badge](https://badges.greenkeeper.io/xtuc/Yet-Another-Documentation-generator.svg)](https://greenkeeper.io/)

Functions documentation for JavaScript

## Motiviations

Good introduction to compiler frontend.
Most JavaScript source code will break the tokenizer.

Backend wasn't my main focus, it only generates markdown using a templating engine.

## Projet goal

Document functions from any language.
It should be clear (without author explainations) what the module does: its impact on arguments, used environnement variables, …

## Requirements

* C++11
* Mustache templating engine: https://github.com/no1msd/mstch
* Flex
* GNU/Bison

## Build from source

```sh
make build
```

## Launch test

Requires NPM and Node.

Install test dependencies (Mocha) :
```sh
npm install
```

Launch :
```sh
npm test
```
