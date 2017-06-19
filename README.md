# TodoMVC Example

Assuming you already have react-native and elm setup. From the command 
line run in the examples directory (not this directory!):

```bash
$ react-native init TodoMVC 
```

When asked if you want to overwrite index.ios.js and index.android.js
- decline with "n"

Using git revert the changes react-native made to the package.json file 
and run:

```bash
$ cd TodoMVC
$ npm run compile 
```

finally:

ios: 
```bash
$ react-native run-ios # this runs emulator
```

android:


```bash
$ android avd # Simple instruction for emulator

$ react-native run-android
$ react-native start --reset-cache
```

Development
terminal:
```bash
$ npm run compile 
```

ios:

emulator updates: ctrl (command) - R

Enable logging from menu

android:

emulator updates: R + R
logging:
```bash
$ adb -e logcat
```

## To Do (not all in order)

- [x] Basic PoC
  - [x] Have runnin in IOS
  - [x] Have runnin in Android
- [ ] Polish
- [ ] Add web version
  - [ ] Reuse code between elm-native-ui and http version
  - [ ] Server side rendering
- [ ] Use device/local storage
- [ ] Server
  - [ ] Get data graphql Endpoint to receive data from
  - [ ] Create Elixir project to get data from
