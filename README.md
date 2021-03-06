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

### Pull it from dockerhub

```bash
docker pull kyentei/notegen:latest
```

### Build it yourself

```bash
docker build . -t kyentei/notegen:latest
```

### Run the container

To generate a PDF

```bash
docker run -v $(pwd):/data:ro kyentei/notegen /data/example.md > example.pdf
```
