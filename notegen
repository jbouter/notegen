#!/usr/bin/env python3

import os
import argparse
import sys
import platform


def check_ext(file):
    extension = os.path.splitext(file)[1][1:]

    if extension == 'md':
        return True


def check_present(file):
    return os.path.isfile(file)


def gen_pdf(file, verbose):
    filename = os.path.splitext(file)[0]
    if verbose:
        print('[+] Converting {} to pdf...'.format(file))

    try:
        os.system(
            'pandoc -o {}.pdf {} --pdf-engine xelatex --from markdown --template eisvogel --listings'.format(filename, file))
    except:
        print('[!] Pandoc broke')


def gen_docx(file, verbose):
    filename = os.path.splitext(file)[0]
    if verbose:
        print('[+] Converting {} to docx...'.format(file))
    try:
        os.system('pandoc -o {}.docx {}'.format(filename, file))
    except:
        print('[!] Pandoc broke')


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        'file', help='name of the markdown file to use')
    parser.add_argument('-d', '--docx', action='store_true',
                        help='also generate a docx file')
    parser.add_argument('-v', '--verbose', action='store_true',
                        help='Make the output verbose')
    args = parser.parse_args()

    if not check_ext(args.file):
        print('File {} is not a markdown file'.format(args.file))
        sys.exit(1)
    if not check_present(args.file):
        print('Couldn\'t find {}'.format(args.file))
        sys.exit(1)

    gen_pdf(args.file, args.verbose)

    if args.docx:
        gen_docx(args.file, args.verbose)


if __name__ == "__main__":
    # execute only if run as a script
    main()
