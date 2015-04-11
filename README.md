# generate.cr

Generic tool for generating whole Crystal project structure, or any part of it during lifetime of project.

## Installation

Add it to your Projectfile:

```crystal
deps do
  github "generate-cr/generate"
end
```

Initialize Generatefile and add binstub:

```
curl https://github.com/generate-cr/generate/master/scripts/install.sh | bash
```

## Usage

```
generate.cr new library example
```

Example project structure:

```
$ tree example -a
example
├── .gitignore
├── libs
│   └── .keep
├── LICENSE
├── Projectfile
├── README.md
├── spec
│   ├── example
│   │   └── .keep
│   ├── example_spec.cr
│   └── spec_helper.cr
├── src
│   ├── example
│   │   └── version.cr
│   └── example.cr
└── .travis.yml
```

## Development

TODO: Write instructions for development

## Contributing

1. Fork it ( https://github.com/generate.cr/generate/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [waterlink](https://github.com/waterlink) Oleksii Fedorov - creator, maintainer
