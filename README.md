# notegen

Note generating application in a container

## Notegen Usage

```console
usage: notegen [-h] [-d] [-v] file

positional arguments:
  file           name of the markdown file to use

optional arguments:
  -h, --help     show this help message and exit
  -d, --docx     also generate a docx file
  -v, --verbose  Make the output verbose
```

## Use the container

You can use `notegen` separately, or as a docker container. If you want to use `notegen`
without using the container, please see
[roaldnefs/writeup-template](https://github.com/roaldnefs/writeup-template)
for the dependencies of `notegen` and `pandoc`.

### Build it yourself

```bash
docker build . -t kn0x/notegen:latest
```

### Run the container

First ensure the data directory is writable by the pandoc user inside the container

```bash
chmod 777 data
```

To generate a PDF

```bash
docker run -v $(pwd):/data:ro kn0x/notegen /data/example.md > example.pdf
```
