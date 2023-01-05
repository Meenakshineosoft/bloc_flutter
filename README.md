# bloc_flutter

A new Flutter project.

## Getting Started

This project explains about CI/CD using github actions.

A few resources to get you started:

- [Link to start:](https://docs.github.com/en/actions)
- [Code for yml file:](https://github.com/subosito/flutter-action)
- [Reference links:](https://medium.com/mobile-development-group/github-actions-for-flutter-cf02923d7b5d)


##Creating a Workflow File
The first thing you have to do is create a .yml file, which is a configuration file that Github Action can understand.

You must store workflow files in the .github/workflows/ directory in your repository. You can name the file whatever you want, for this I have name it ci.yml.

.github/workflows/ci.yml

#on
Github Actions will execute the workflow following the events under on key.

#job
A workflow run is made up of one or more jobs.

#runs-on
The type of virtual host machine to run the job on. For our case, we need ubuntu-latest.

#steps
A job contains a sequence of tasks called steps.

Steps to work using github actions:

We have to set up the Flutter environment for the Github Actions and for that we will be using subosito/flutter-action that link I have shared above.

Write the command to get the Flutter dependencies.

- run: flutter pub get

Statically analyze the Dart code for any errors.

- run: flutter analyze .

Run widget tests for our flutter project.

- run: flutter test

Build an Android APK.

- run: flutter build apk

Finally, upload our generated app-release.apk for our workflow to the artifacts. For this, we will be using 

actions/upload-artifact .

##complete yaml file


name: Flutter CI

# This workflow is triggered on pushes to the repository.

on:
  push:
    branches:
    - master
    
# on: push    # Default will running for every branch.
    
jobs:
  build:
    # This job will run on ubuntu virtual machine
    runs-on: ubuntu-latest
    steps:
    
    # Setup Java environment in order to build the Android app.
    - uses: actions/checkout@v1
    - uses: actions/setup-java@v1
      with:
        java-version: '12.x'
    
    # Setup the flutter environment.
    - uses: subosito/flutter-action@v1
      with:
        channel: 'beta' # 'dev', 'alpha', default to: 'stable'
        # flutter-version: '1.12.x' # you can also specify exact version of flutter
    
    # Get flutter dependencies.
    - run: flutter pub get
    
    # Check for any formatting issues in the code.
    - run: flutter format --set-exit-if-changed .
    
    # Statically analyze the Dart code for any errors.
    - run: flutter analyze .
    
    # Run widget tests for our flutter project.
    - run: flutter test
    
    # Build apk.
    - run: flutter build apk
    
    # Upload generated apk to the artifacts.
    - uses: actions/upload-artifact@v1
      with:
        name: release-apk
        path: build/app/outputs/apk/release/app-release.apk
        
        
        
        Watch your builds on GitHub
Once you have pushed to your master branch, you can immediately see the build starting for your latest commit on GitHub under the Actions tab.
