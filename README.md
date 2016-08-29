# ionic-package-build

This step vendors the Ionic CLI, and allows the user to execute the
package build command. Options are passed along to the `ionic` executable as is.

# Prerequisites:

* Requires the Ionic CLI installed. Install it either as part of the pipeline, or make use of a Docker image that has it pre-installed, such as [devillex/docker-ionic](https://hub.docker.com/r/devillex/docker-ionic/).
* Requires Ionic CLI to be logged into Ionic.io. Either log in manually using a script step, or use a pre-built step to log in, such as [devillex/ionic-login](https://github.com/devillex/wercker-ionic-login-step).

# Options:

* `platform` - Platform to target, i.e. `android` or `ios`.
* `release` - (Optional) Indicate whether this is a release build. Possible values are `true` or `false`. Defaults to `false`.
* `profile` - (Optional) Security profile to use for the build, as defined in Ionic.io console.
* `debug` - (Optional) Prints out the command that is executed to the console. **Warning this prints the everything in the clear, including the password.** Possible values are `true` or `false`. Defaults to `false`.

# Example

```yml
deploy:
    steps:
      - ionic-package-build:
          platform: android
          release: $IONIC_RELEASE
          profile: $IONIC_PROFILE
```

# License

The MIT License (MIT)

# Changelog

## 1.0.0

- Initial release
