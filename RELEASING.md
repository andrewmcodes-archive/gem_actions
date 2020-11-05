# Release Process

This project uses [Semantic Versioning](https://semver.org)

## Setup

1. Create or login to RubyGems.org and retrieve your `API key`.
2. Create a new repository secret on GitHub. [View Documentation](https://docs.github.com/en/free-pro-team@latest/actions/reference/encrypted-secrets)
  - Name: `RUBYGEMS_API_KEY`
  - Value: your API key value

**Note: If you have MFA on, you will need to set it to `UI` instead of `UI and API`**
> TODO: figure out a way to not have to make this change. Contributions welcome.

## Create a release

Prepare release on main branch, then run:

```bash
rake prepare:release
```

and follow the instructions.
