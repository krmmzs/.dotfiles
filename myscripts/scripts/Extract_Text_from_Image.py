#!/usr/bin python3

from PIL import Image

# https://github.com/madmaze/pytesseract
# https://github.com/tesseract-ocr/tesseract
# https://pypi.org/project/pytesseract/
import pytesseract
import sys
from plyer import notification


def write_file(src, text):
    with open(src, "w") as f:
        f.write(text)


def extract_text_from_image(src):
    try:
        text = pytesseract.image_to_string(Image.open(src), lang="eng")
        write_file("./output.txt", text)

        notification.notify(
            title="Finished executing " + sys.argv[0],
            message="Successful, See ./output.txt",
        )
    except Exception as e:
        notification.notify(
            title="Finished executing " + sys.argv[0],
            message="Failed",
        )
        raise e


def main(argv=sys.argv[1:]):
    src = argv[0]
    extract_text_from_image(src)


if __name__ == "__main__":
    main()
