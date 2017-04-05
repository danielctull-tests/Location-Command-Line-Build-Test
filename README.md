
When tested from Xcode this project succeeds. 

When tested using `xcodebuild`, it fails. 

If you wish to try this yourself, use the provided `build.sh` script and remove the app from the simulator to make sure the location isn't carried over from an Xcode build.



## Radar Number: 31450652

###Summary:

When adding UI tests, there is an option in the scheme to add a Test Location. This is given to the app correctly when testing from Xcode but not when using xcodebuild.



###Steps to Reproduce:

* Add UI tests to a project that requires a location
* Provide a Test Location in the scheme in the Test section
* Run the UI tests with xcodebuild on the command line



###Expected Results:

Tests complete and succeed in exactly the same way as they do using Xcode to perform the test.



###Actual Results:

Tests fail because no location is received.



###Notes:

I have attached a test project which has a basic setup, but similar tests to the app I’m trying to run tests on. This can also be found at https://github.com/danielctull-tests/Location-Command-Line-Build-Test
