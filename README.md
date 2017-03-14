# homebrew-dart [![Build Status](https://travis-ci.org/dartsim/homebrew-dart.svg?branch=master)](https://travis-ci.org/dartsim/homebrew-dart)

[Homebrew][homebrew] [tap][homebrew-tap] for [DART][dart] and GRIP.

## How do I install these formulae?

### Without tapping
```
brew install dartsim/dart/<formula>
```

### With tapping
Dependency and main source code formulae are available by adding this repository as a tap to your local homebrew installation:
```
brew tap dartsim/dart
brew install <formula>
```
If you need to drop the tap due to compatability issues, or are very particular about keeping a clean homebrew installation, you can untap this repo:
```
brew untap dartsim/dart
```
But note that you will not be able to upgrade any currently installed software from this tap.

### Using URL
```
brew install https://raw.githubusercontent.com/dartsim/homebrew-dart/master/Formula/<formula>.rb
```
But note that you will not receive updates.


## Documentation
`brew help`, `man brew` or check [Homebrew's documentation][homebrew-documentation].

[homebrew]: https://brew.sh/
[homebrew-tap]: https://github.com/Homebrew/brew/blob/master/docs/brew-tap.md
[homebrew-documentation]: https://github.com/Homebrew/brew/tree/master/docs#readme
[dartsim-github]: https://github.com/dartsim/
[dart]: http://dartsim.github.io/
